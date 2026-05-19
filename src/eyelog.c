#define _GNU_SOURCE

#include <ctype.h>
#include <errno.h>
#include <math.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#ifndef EYELOG_VERSION
#define EYELOG_VERSION "0.0.0"
#endif

#define MAX_ARGS 16
#define MAX_BODY 256
#define MAX_DEPTH 100000
#define MAX_SOLUTIONS 10000000

/* ------------------------------------------------------------------------- */
/* Utilities                                                                 */
/* ------------------------------------------------------------------------- */

static void die(const char *message) {
  fprintf(stderr, "eyelog: %s\n", message);
  exit(1);
}

static void *xmalloc(size_t size) {
  void *ptr = malloc(size ? size : 1);
  if (!ptr) die("out of memory");
  return ptr;
}

static void *xcalloc(size_t count, size_t size) {
  void *ptr = calloc(count ? count : 1, size ? size : 1);
  if (!ptr) die("out of memory");
  return ptr;
}

static void *xrealloc(void *ptr, size_t size) {
  void *next = realloc(ptr, size ? size : 1);
  if (!next) die("out of memory");
  return next;
}

static char *xstrdup(const char *text) {
  char *copy = strdup(text ? text : "");
  if (!copy) die("out of memory");
  return copy;
}

static char *xstrndup(const char *text, size_t length) {
  char *copy = xmalloc(length + 1);
  memcpy(copy, text, length);
  copy[length] = '\0';
  return copy;
}

/* ------------------------------------------------------------------------- */
/* Terms                                                                     */
/* ------------------------------------------------------------------------- */

typedef enum {
  TERM_VAR,
  TERM_ATOM,
  TERM_STRING,
  TERM_NUMBER,
  TERM_COMPOUND
} TermType;

typedef struct Term Term;

struct Term {
  TermType type;
  char *name;
  int arity;
  Term **args;
};

static Term *new_term(TermType type, const char *name) {
  Term *term = xmalloc(sizeof(*term));
  term->type = type;
  term->name = xstrdup(name);
  term->arity = 0;
  term->args = NULL;
  return term;
}

static Term *new_compound(const char *functor, int arity, Term **args) {
  Term *term = new_term(TERM_COMPOUND, functor);
  term->arity = arity;
  term->args = xmalloc(sizeof(Term *) * (arity ? arity : 1));
  for (int i = 0; i < arity; i++) term->args[i] = args[i];
  return term;
}

static Term *number_term_from_i64(long long value) {
  char buffer[64];
  snprintf(buffer, sizeof(buffer), "%lld", value);
  return new_term(TERM_NUMBER, buffer);
}

static Term *number_term_from_text(const char *value) {
  return new_term(TERM_NUMBER, value);
}

static Term *atom_term(const char *value) {
  return new_term(TERM_ATOM, value);
}

static Term *string_term(const char *value) {
  return new_term(TERM_STRING, value);
}

static Term *empty_list_term(void) {
  return new_term(TERM_ATOM, "[]");
}

static Term *cons_term(Term *head, Term *tail) {
  Term *args[2] = { head, tail };
  return new_compound(".", 2, args);
}

static bool is_empty_list_term(Term *term) {
  return term->type == TERM_ATOM && strcmp(term->name, "[]") == 0;
}

static bool is_cons_term(Term *term) {
  return term->type == TERM_COMPOUND && strcmp(term->name, ".") == 0 && term->arity == 2;
}

/* ------------------------------------------------------------------------- */
/* Scanner and parser                                                        */
/* ------------------------------------------------------------------------- */

typedef enum {
  TOK_EOF,
  TOK_ATOM,
  TOK_VAR,
  TOK_STRING,
  TOK_NUMBER,
  TOK_LPAREN,
  TOK_RPAREN,
  TOK_LBRACKET,
  TOK_RBRACKET,
  TOK_COMMA,
  TOK_BAR,
  TOK_DOT,
  TOK_IF
} TokenType;

typedef struct {
  TokenType type;
  char *text;
  int line;
} Token;

typedef struct {
  const char *source;
  size_t pos;
  size_t length;
  int line;
  int anonymous_id;
  Token token;
} Parser;

static char peek(Parser *parser) {
  return parser->pos < parser->length ? parser->source[parser->pos] : '\0';
}

static char take(Parser *parser) {
  char c = peek(parser);
  if (c) {
    parser->pos++;
    if (c == '\n') parser->line++;
  }
  return c;
}

static void free_token(Token *token) {
  free(token->text);
  token->text = NULL;
}

static bool atom_char(char c) {
  return c &&
         !isspace((unsigned char)c) &&
         c != '(' && c != ')' && c != '[' && c != ']' &&
         c != ',' && c != '|' && c != '.' &&
         c != '"' && c != '\'';
}

static void skip_ws_and_comments(Parser *parser) {
  for (;;) {
    while (isspace((unsigned char)peek(parser))) take(parser);
    if (peek(parser) == '%') {
      while (peek(parser) && peek(parser) != '\n') take(parser);
      continue;
    }
    break;
  }
}

static Token next_token(Parser *parser) {
  skip_ws_and_comments(parser);

  Token token = { TOK_EOF, xstrdup(""), parser->line };
  char c = peek(parser);
  if (!c) return token;

  if (c == '(') { take(parser); token.type = TOK_LPAREN; free(token.text); token.text = xstrdup("("); return token; }
  if (c == ')') { take(parser); token.type = TOK_RPAREN; free(token.text); token.text = xstrdup(")"); return token; }
  if (c == '[') { take(parser); token.type = TOK_LBRACKET; free(token.text); token.text = xstrdup("["); return token; }
  if (c == ']') { take(parser); token.type = TOK_RBRACKET; free(token.text); token.text = xstrdup("]"); return token; }
  if (c == ',') { take(parser); token.type = TOK_COMMA; free(token.text); token.text = xstrdup(","); return token; }
  if (c == '|') { take(parser); token.type = TOK_BAR; free(token.text); token.text = xstrdup("|"); return token; }
  if (c == '.') { take(parser); token.type = TOK_DOT; free(token.text); token.text = xstrdup("."); return token; }

  if (c == ':' && parser->pos + 1 < parser->length && parser->source[parser->pos + 1] == '-') {
    parser->pos += 2;
    token.type = TOK_IF;
    free(token.text);
    token.text = xstrdup(":-");
    return token;
  }

  if (c == '"' || c == '\'') {
    char quote = take(parser);
    size_t capacity = 64;
    size_t length = 0;
    char *buffer = xmalloc(capacity);

    while (peek(parser) && peek(parser) != quote) {
      char value = take(parser);
      if (value == '\\' && peek(parser)) {
        char escaped = take(parser);
        if (escaped == 'n') value = '\n';
        else if (escaped == 't') value = '\t';
        else value = escaped;
      }
      if (length + 2 >= capacity) {
        capacity *= 2;
        buffer = xrealloc(buffer, capacity);
      }
      buffer[length++] = value;
    }

    if (peek(parser) != quote) die("unterminated quoted term");
    take(parser);
    buffer[length] = '\0';

    token.type = quote == '"' ? TOK_STRING : TOK_ATOM;
    free(token.text);
    token.text = buffer;
    return token;
  }

  if (isdigit((unsigned char)c) ||
      (c == '-' && parser->pos + 1 < parser->length && isdigit((unsigned char)parser->source[parser->pos + 1]))) {
    size_t start = parser->pos;
    if (peek(parser) == '-') take(parser);
    while (isdigit((unsigned char)peek(parser))) take(parser);

    if (peek(parser) == '.' && parser->pos + 1 < parser->length &&
        isdigit((unsigned char)parser->source[parser->pos + 1])) {
      take(parser);
      while (isdigit((unsigned char)peek(parser))) take(parser);
    }

    if ((peek(parser) == 'e' || peek(parser) == 'E') &&
        parser->pos + 1 < parser->length) {
      size_t exponent_pos = parser->pos;
      size_t digit_pos = exponent_pos + 1;
      if (parser->source[digit_pos] == '+' || parser->source[digit_pos] == '-') digit_pos++;
      if (digit_pos < parser->length && isdigit((unsigned char)parser->source[digit_pos])) {
        take(parser);
        if (peek(parser) == '+' || peek(parser) == '-') take(parser);
        while (isdigit((unsigned char)peek(parser))) take(parser);
      }
    }

    token.type = TOK_NUMBER;
    free(token.text);
    token.text = xstrndup(parser->source + start, parser->pos - start);
    return token;
  }

  size_t start = parser->pos;
  while (atom_char(peek(parser))) take(parser);
  free(token.text);
  token.text = xstrndup(parser->source + start, parser->pos - start);
  token.type = (token.text[0] == '_' || isupper((unsigned char)token.text[0])) ? TOK_VAR : TOK_ATOM;

  if (token.type == TOK_VAR && strcmp(token.text, "_") == 0) {
    char name[64];
    snprintf(name, sizeof(name), "__anon%d", parser->anonymous_id++);
    free(token.text);
    token.text = xstrdup(name);
  }

  return token;
}

static void advance(Parser *parser) {
  free_token(&parser->token);
  parser->token = next_token(parser);
}

static void expect(Parser *parser, TokenType type, const char *description) {
  if (parser->token.type != type) {
    fprintf(stderr, "parse line %d: expected %s, got %s\n", parser->token.line, description, parser->token.text);
    exit(1);
  }
}

static Term *parse_term(Parser *parser);

static Term *parse_list(Parser *parser) {
  expect(parser, TOK_LBRACKET, "[");
  advance(parser);

  if (parser->token.type == TOK_RBRACKET) {
    advance(parser);
    return empty_list_term();
  }

  int len = 0;
  int cap = 8;
  Term **items = xmalloc(sizeof(Term *) * cap);
  Term *tail = NULL;

  for (;;) {
    if (len == cap) {
      cap *= 2;
      items = xrealloc(items, sizeof(Term *) * cap);
    }
    items[len++] = parse_term(parser);

    if (parser->token.type == TOK_COMMA) {
      advance(parser);
      continue;
    }

    if (parser->token.type == TOK_BAR) {
      advance(parser);
      tail = parse_term(parser);
      expect(parser, TOK_RBRACKET, "]");
      advance(parser);
      break;
    }

    expect(parser, TOK_RBRACKET, "]");
    advance(parser);
    tail = empty_list_term();
    break;
  }

  for (int i = len - 1; i >= 0; i--) tail = cons_term(items[i], tail);
  free(items);
  return tail;
}

static Term *parse_term(Parser *parser) {
  if (parser->token.type == TOK_LBRACKET) {
    return parse_list(parser);
  }

  if (parser->token.type == TOK_VAR) {
    char *name = xstrdup(parser->token.text);
    advance(parser);
    Term *result = new_term(TERM_VAR, name);
    free(name);
    return result;
  }

  if (parser->token.type == TOK_STRING) {
    char *value = xstrdup(parser->token.text);
    advance(parser);
    Term *result = new_term(TERM_STRING, value);
    free(value);
    return result;
  }

  if (parser->token.type == TOK_NUMBER) {
    char *value = xstrdup(parser->token.text);
    advance(parser);
    Term *result = new_term(TERM_NUMBER, value);
    free(value);
    return result;
  }

  if (parser->token.type == TOK_ATOM) {
    char *name = xstrdup(parser->token.text);
    advance(parser);

    if (parser->token.type == TOK_LPAREN) {
      advance(parser);
      Term *args[MAX_ARGS];
      int arity = 0;

      if (parser->token.type != TOK_RPAREN) {
        for (;;) {
          if (arity >= MAX_ARGS) die("too many arguments");
          args[arity++] = parse_term(parser);
          if (parser->token.type == TOK_COMMA) {
            advance(parser);
            continue;
          }
          break;
        }
      }

      expect(parser, TOK_RPAREN, ")");
      advance(parser);

      Term *result = new_compound(name, arity, args);
      free(name);
      return result;
    }

    Term *result = new_term(TERM_ATOM, name);
    free(name);
    return result;
  }

  die("bad term");
  return NULL;
}

/* ------------------------------------------------------------------------- */
/* Program indexing                                                          */
/* ------------------------------------------------------------------------- */

typedef struct {
  Term *head;
  int body_len;
  Term **body;
} Clause;

typedef struct {
  char *name;
  int arity;
  int *clause_indexes;
  int len;
  int cap;
} PredicateGroup;

typedef struct {
  Clause *clauses;
  int len;
  int cap;
  PredicateGroup *groups;
  int group_len;
  int group_cap;
} Program;

static char *read_file(const char *path) {
  FILE *file = fopen(path, "rb");
  if (!file) {
    perror(path);
    exit(1);
  }

  fseek(file, 0, SEEK_END);
  long length = ftell(file);
  fseek(file, 0, SEEK_SET);

  char *buffer = xmalloc((size_t)length + 1);
  if (fread(buffer, 1, (size_t)length, file) != (size_t)length) die("read failed");
  buffer[length] = '\0';
  fclose(file);
  return buffer;
}

static void add_clause(Program *program, Clause clause) {
  if (program->len == program->cap) {
    program->cap = program->cap ? program->cap * 2 : 1024;
    program->clauses = xrealloc(program->clauses, sizeof(Clause) * program->cap);
  }
  program->clauses[program->len++] = clause;
}

static PredicateGroup *find_group(Program *program, const char *name, int arity) {
  for (int i = 0; i < program->group_len; i++) {
    PredicateGroup *group = &program->groups[i];
    if (group->arity == arity && strcmp(group->name, name) == 0) return group;
  }
  return NULL;
}

static void index_clause(Program *program, int clause_index) {
  Term *head = program->clauses[clause_index].head;
  if (head->type != TERM_COMPOUND) return;

  PredicateGroup *group = find_group(program, head->name, head->arity);
  if (!group) {
    if (program->group_len == program->group_cap) {
      program->group_cap = program->group_cap ? program->group_cap * 2 : 64;
      program->groups = xrealloc(program->groups, sizeof(PredicateGroup) * program->group_cap);
    }
    group = &program->groups[program->group_len++];
    group->name = xstrdup(head->name);
    group->arity = head->arity;
    group->clause_indexes = NULL;
    group->len = 0;
    group->cap = 0;
  }

  if (group->len == group->cap) {
    group->cap = group->cap ? group->cap * 2 : 256;
    group->clause_indexes = xrealloc(group->clause_indexes, sizeof(int) * group->cap);
  }
  group->clause_indexes[group->len++] = clause_index;
}

static Program parse_program(const char *path) {
  char *source = read_file(path);
  Parser parser = { source, 0, strlen(source), 1, 0, { TOK_EOF, NULL, 1 } };
  Program program = { 0 };

  advance(&parser);
  while (parser.token.type != TOK_EOF) {
    Clause clause = { 0 };
    clause.head = parse_term(&parser);

    if (parser.token.type == TOK_IF) {
      advance(&parser);
      clause.body = xmalloc(sizeof(Term *) * MAX_BODY);
      for (;;) {
        if (clause.body_len >= MAX_BODY) die("too many goals in rule body");
        clause.body[clause.body_len++] = parse_term(&parser);
        if (parser.token.type == TOK_COMMA) {
          advance(&parser);
          continue;
        }
        break;
      }
    }

    expect(&parser, TOK_DOT, ".");
    advance(&parser);
    add_clause(&program, clause);
    index_clause(&program, program.len - 1);
  }

  free(source);
  return program;
}

/* ------------------------------------------------------------------------- */
/* Environments and unification                                              */
/* ------------------------------------------------------------------------- */

typedef struct Binding Binding;

struct Binding {
  const char *name;
  Term *value;
  Binding *next;
};

typedef struct {
  Binding *head;
} Env;

static Binding *find_binding(Env *env, const char *name) {
  for (Binding *binding = env->head; binding; binding = binding->next) {
    if (strcmp(binding->name, name) == 0) return binding;
  }
  return NULL;
}

static Env clone_env(Env *env) {
  Env copy = { env->head };
  return copy;
}

static void bind_var(Env *env, const char *name, Term *value) {
  Binding *binding = xmalloc(sizeof(*binding));
  binding->name = name;
  binding->value = value;
  binding->next = env->head;
  env->head = binding;
}

static Term *deref(Term *term, Env *env) {
  while (term->type == TERM_VAR) {
    Binding *binding = find_binding(env, term->name);
    if (!binding) break;
    term = binding->value;
  }
  return term;
}

static bool unify(Term *left, Term *right, Env *env) {
  left = deref(left, env);
  right = deref(right, env);

  if (left->type == TERM_VAR) {
    bind_var(env, left->name, right);
    return true;
  }
  if (right->type == TERM_VAR) {
    bind_var(env, right->name, left);
    return true;
  }

  if (left->type != right->type) {
    bool left_scalar = left->type == TERM_ATOM || left->type == TERM_STRING || left->type == TERM_NUMBER;
    bool right_scalar = right->type == TERM_ATOM || right->type == TERM_STRING || right->type == TERM_NUMBER;
    return left_scalar && right_scalar && strcmp(left->name, right->name) == 0;
  }

  if (left->type == TERM_ATOM || left->type == TERM_STRING || left->type == TERM_NUMBER) {
    return strcmp(left->name, right->name) == 0;
  }

  if (left->type == TERM_COMPOUND) {
    if (strcmp(left->name, right->name) != 0 || left->arity != right->arity) return false;
    for (int i = 0; i < left->arity; i++) {
      if (!unify(left->args[i], right->args[i], env)) return false;
    }
    return true;
  }

  return false;
}


static bool simple_scalar(Term *term) {
  return term->type == TERM_ATOM || term->type == TERM_STRING || term->type == TERM_NUMBER;
}

static bool scalar_terms_match(Term *left, Term *right) {
  return simple_scalar(left) && simple_scalar(right) && strcmp(left->name, right->name) == 0;
}

static bool clause_head_cannot_match(Term *goal, Clause *clause, Env *env) {
  Term *head = clause->head;
  if (goal->type != TERM_COMPOUND || head->type != TERM_COMPOUND) return false;
  if (strcmp(goal->name, head->name) != 0 || goal->arity != head->arity) return true;

  for (int i = 0; i < goal->arity; i++) {
    Term *goal_arg = deref(goal->args[i], env);
    Term *head_arg = head->args[i];
    if (simple_scalar(goal_arg) && simple_scalar(head_arg) && !scalar_terms_match(goal_arg, head_arg)) {
      return true;
    }
  }
  return false;
}

static int fresh_id = 0;

static Term *fresh_term(Term *term, int id) {
  if (term->type == TERM_VAR) {
    char name[512];
    snprintf(name, sizeof(name), "%s#%d", term->name, id);
    return new_term(TERM_VAR, name);
  }

  Term *copy = new_term(term->type, term->name);
  copy->arity = term->arity;
  if (term->arity) {
    copy->args = xmalloc(sizeof(Term *) * term->arity);
    for (int i = 0; i < term->arity; i++) copy->args[i] = fresh_term(term->args[i], id);
  }
  return copy;
}

static Clause fresh_clause(Clause *clause) {
  int id = ++fresh_id;
  Clause fresh = {
    fresh_term(clause->head, id),
    clause->body_len,
    xmalloc(sizeof(Term *) * (clause->body_len ? clause->body_len : 1))
  };
  for (int i = 0; i < clause->body_len; i++) fresh.body[i] = fresh_term(clause->body[i], id);
  return fresh;
}

/* ------------------------------------------------------------------------- */
/* String builder and term rendering                                         */
/* ------------------------------------------------------------------------- */

typedef struct {
  char *data;
  size_t len;
  size_t cap;
} StringBuilder;

static void sb_init(StringBuilder *sb) {
  sb->cap = 128;
  sb->len = 0;
  sb->data = xmalloc(sb->cap);
  sb->data[0] = '\0';
}

static void sb_append(StringBuilder *sb, const char *text) {
  size_t length = strlen(text);
  if (sb->len + length + 1 > sb->cap) {
    while (sb->len + length + 1 > sb->cap) sb->cap *= 2;
    sb->data = xrealloc(sb->data, sb->cap);
  }
  memcpy(sb->data + sb->len, text, length + 1);
  sb->len += length;
}

static void sb_append_char(StringBuilder *sb, char c) {
  char buffer[2] = { c, '\0' };
  sb_append(sb, buffer);
}

static void write_term(StringBuilder *sb, Term *term, Env *env, bool quote_strings);

static void write_list(StringBuilder *sb, Term *term, Env *env) {
  sb_append_char(sb, '[');
  bool first = true;

  for (;;) {
    term = deref(term, env);

    if (is_empty_list_term(term)) {
      sb_append_char(sb, ']');
      return;
    }

    if (!is_cons_term(term)) {
      if (!first) sb_append(sb, " | ");
      write_term(sb, term, env, true);
      sb_append_char(sb, ']');
      return;
    }

    if (!first) sb_append(sb, ", ");
    write_term(sb, term->args[0], env, true);
    term = term->args[1];
    first = false;
  }
}

static void write_term(StringBuilder *sb, Term *term, Env *env, bool quote_strings) {
  term = deref(term, env);

  if (term->type == TERM_VAR) {
    sb_append(sb, term->name);
    return;
  }

  if (is_cons_term(term)) {
    write_list(sb, term, env);
    return;
  }

  if (term->type == TERM_STRING) {
    if (!quote_strings) {
      sb_append(sb, term->name);
      return;
    }

    sb_append_char(sb, '"');
    for (char *p = term->name; *p; p++) {
      if (*p == '"' || *p == '\\') {
        sb_append_char(sb, '\\');
        sb_append_char(sb, *p);
      } else if (*p == '\n') {
        sb_append(sb, "\\n");
      } else {
        sb_append_char(sb, *p);
      }
    }
    sb_append_char(sb, '"');
    return;
  }

  if (term->type == TERM_ATOM || term->type == TERM_NUMBER) {
    sb_append(sb, term->name);
    return;
  }

  sb_append(sb, term->name);
  sb_append_char(sb, '(');
  for (int i = 0; i < term->arity; i++) {
    if (i) sb_append(sb, ", ");
    write_term(sb, term->args[i], env, true);
  }
  sb_append_char(sb, ')');
}

static char *term_to_string(Term *term, Env *env, bool quote_strings) {
  StringBuilder sb;
  sb_init(&sb);
  write_term(&sb, term, env, quote_strings);
  return sb.data;
}

static char *term_lexical_value(Term *term, Env *env) {
  term = deref(term, env);
  if (term->type == TERM_VAR) return NULL;
  if (term->type == TERM_STRING || term->type == TERM_ATOM || term->type == TERM_NUMBER) {
    return xstrdup(term->name);
  }
  return term_to_string(term, env, true);
}

static long long term_i64(Term *term, Env *env, bool *ok) {
  char *text = term_lexical_value(term, env);
  if (!text) {
    *ok = false;
    return 0;
  }

  char *end = NULL;
  errno = 0;
  long long value = strtoll(text, &end, 10);
  *ok = errno == 0 && end && *end == '\0';
  free(text);
  return value;
}

static bool has_float_marker(const char *text) {
  if (!text) return false;
  for (const char *p = text; *p; p++) {
    if (*p == '.' || *p == 'e' || *p == 'E') return true;
  }
  return false;
}

static bool parse_double_strict(const char *text, double *out) {
  if (!text || !*text) return false;
  char *end = NULL;
  errno = 0;
  double value = strtod(text, &end);
  if (errno != 0 || !end || *end != '\0' || !isfinite(value)) return false;
  *out = value;
  return true;
}

static char *number_text_from_double(double value) {
  if (!isfinite(value)) return NULL;
  if (value == 0.0) value = 0.0;

  char buffer[128];
  snprintf(buffer, sizeof(buffer), "%.17g", value);

  if (!has_float_marker(buffer)) {
    StringBuilder sb;
    sb_init(&sb);
    sb_append(&sb, buffer);
    sb_append(&sb, ".0");
    return sb.data;
  }

  return xstrdup(buffer);
}

/* ------------------------------------------------------------------------- */
/* Decimal integer helpers for generic BigInt addition                       */
/* ------------------------------------------------------------------------- */

static bool is_decimal_integer(const char *text) {
  if (!text || !*text) return false;
  if (*text == '-') text++;
  if (!*text) return false;
  while (*text) {
    if (!isdigit((unsigned char)*text)) return false;
    text++;
  }
  return true;
}

static char *strip_leading_zeroes(char *text) {
  bool negative = text[0] == '-';
  char *digits = text + (negative ? 1 : 0);
  while (digits[0] == '0' && digits[1]) digits++;
  if (negative) {
    StringBuilder sb;
    sb_init(&sb);
    sb_append_char(&sb, '-');
    sb_append(&sb, digits);
    free(text);
    return sb.data;
  }
  if (digits != text) {
    char *copy = xstrdup(digits);
    free(text);
    return copy;
  }
  return text;
}

static int compare_abs_decimal(const char *a, const char *b) {
  while (*a == '0' && a[1]) a++;
  while (*b == '0' && b[1]) b++;
  size_t la = strlen(a);
  size_t lb = strlen(b);
  if (la != lb) return la < lb ? -1 : 1;
  int cmp = strcmp(a, b);
  return cmp < 0 ? -1 : cmp > 0 ? 1 : 0;
}

static int compare_signed_decimal(const char *left, const char *right) {
  bool left_neg = left[0] == '-';
  bool right_neg = right[0] == '-';
  const char *a = left + (left_neg ? 1 : 0);
  const char *b = right + (right_neg ? 1 : 0);

  while (*a == '0' && a[1]) a++;
  while (*b == '0' && b[1]) b++;
  if (strcmp(a, "0") == 0) left_neg = false;
  if (strcmp(b, "0") == 0) right_neg = false;

  if (left_neg != right_neg) return left_neg ? -1 : 1;

  int cmp = compare_abs_decimal(a, b);
  return left_neg ? -cmp : cmp;
}

static char *add_abs_decimal(const char *a, const char *b) {
  size_t la = strlen(a);
  size_t lb = strlen(b);
  size_t n = la > lb ? la : lb;
  char *out = xmalloc(n + 2);
  out[n + 1] = '\0';

  int carry = 0;
  for (size_t i = 0; i < n; i++) {
    int da = i < la ? a[la - 1 - i] - '0' : 0;
    int db = i < lb ? b[lb - 1 - i] - '0' : 0;
    int sum = da + db + carry;
    out[n - i] = (char)('0' + (sum % 10));
    carry = sum / 10;
  }
  out[0] = (char)('0' + carry);
  return strip_leading_zeroes(out);
}

static char *sub_abs_decimal(const char *a, const char *b) {
  /* Requires abs(a) >= abs(b), both positive digit strings. */
  size_t la = strlen(a);
  size_t lb = strlen(b);
  char *out = xmalloc(la + 1);
  out[la] = '\0';

  int borrow = 0;
  for (size_t i = 0; i < la; i++) {
    int da = a[la - 1 - i] - '0' - borrow;
    int db = i < lb ? b[lb - 1 - i] - '0' : 0;
    if (da < db) {
      da += 10;
      borrow = 1;
    } else {
      borrow = 0;
    }
    out[la - 1 - i] = (char)('0' + (da - db));
  }
  return strip_leading_zeroes(out);
}

static char *add_decimal(const char *left, const char *right) {
  bool left_neg = left[0] == '-';
  bool right_neg = right[0] == '-';
  const char *a = left + (left_neg ? 1 : 0);
  const char *b = right + (right_neg ? 1 : 0);

  if (left_neg == right_neg) {
    char *sum = add_abs_decimal(a, b);
    if (left_neg && strcmp(sum, "0") != 0) {
      StringBuilder sb;
      sb_init(&sb);
      sb_append_char(&sb, '-');
      sb_append(&sb, sum);
      free(sum);
      return sb.data;
    }
    return sum;
  }

  int cmp = compare_abs_decimal(a, b);
  if (cmp == 0) return xstrdup("0");

  const char *larger = cmp > 0 ? a : b;
  const char *smaller = cmp > 0 ? b : a;
  bool result_neg = cmp > 0 ? left_neg : right_neg;
  char *diff = sub_abs_decimal(larger, smaller);

  if (result_neg && strcmp(diff, "0") != 0) {
    StringBuilder sb;
    sb_init(&sb);
    sb_append_char(&sb, '-');
    sb_append(&sb, diff);
    free(diff);
    return sb.data;
  }
  return diff;
}


static char *negate_decimal(const char *value) {
  if (strcmp(value, "0") == 0) return xstrdup("0");
  if (value[0] == '-') return xstrdup(value + 1);

  StringBuilder sb;
  sb_init(&sb);
  sb_append_char(&sb, '-');
  sb_append(&sb, value);
  return sb.data;
}

static char *sub_decimal(const char *left, const char *right) {
  char *negated = negate_decimal(right);
  char *result = add_decimal(left, negated);
  free(negated);
  return result;
}

static char *mul_abs_decimal(const char *a, const char *b) {
  while (*a == '0' && a[1]) a++;
  while (*b == '0' && b[1]) b++;
  if (strcmp(a, "0") == 0 || strcmp(b, "0") == 0) return xstrdup("0");

  size_t la = strlen(a);
  size_t lb = strlen(b);
  int *digits = xcalloc(la + lb, sizeof(int));

  for (size_t ia = 0; ia < la; ia++) {
    int da = a[la - 1 - ia] - '0';
    for (size_t ib = 0; ib < lb; ib++) {
      int db = b[lb - 1 - ib] - '0';
      digits[ia + ib] += da * db;
    }
  }

  for (size_t i = 0; i < la + lb - 1; i++) {
    digits[i + 1] += digits[i] / 10;
    digits[i] %= 10;
  }

  size_t top = la + lb - 1;
  while (top > 0 && digits[top] == 0) top--;

  char *out = xmalloc(top + 2);
  for (size_t i = 0; i <= top; i++) out[i] = (char)('0' + digits[top - i]);
  out[top + 1] = '\0';
  free(digits);
  return strip_leading_zeroes(out);
}

static char *mul_decimal(const char *left, const char *right) {
  bool left_neg = left[0] == '-';
  bool right_neg = right[0] == '-';
  const char *a = left + (left_neg ? 1 : 0);
  const char *b = right + (right_neg ? 1 : 0);
  char *product = mul_abs_decimal(a, b);

  if (left_neg != right_neg && strcmp(product, "0") != 0) {
    StringBuilder sb;
    sb_init(&sb);
    sb_append_char(&sb, '-');
    sb_append(&sb, product);
    free(product);
    return sb.data;
  }
  return product;
}

static char *div_abs_decimal(const char *a, const char *b) {
  /* Integer division for positive decimal strings. Requires b != 0. */
  while (*a == '0' && a[1]) a++;
  while (*b == '0' && b[1]) b++;
  if (strcmp(a, "0") == 0) return xstrdup("0");
  if (compare_abs_decimal(a, b) < 0) return xstrdup("0");

  size_t la = strlen(a);
  char *quotient = xmalloc(la + 1);
  size_t qi = 0;
  char *remainder = xstrdup("0");

  for (size_t i = 0; i < la; i++) {
    size_t lr = strlen(remainder);
    char *next = NULL;
    if (strcmp(remainder, "0") == 0) {
      next = xmalloc(2);
      next[0] = a[i];
      next[1] = '\0';
    } else {
      next = xmalloc(lr + 2);
      memcpy(next, remainder, lr);
      next[lr] = a[i];
      next[lr + 1] = '\0';
    }
    free(remainder);
    remainder = strip_leading_zeroes(next);

    int digit = 0;
    while (compare_abs_decimal(remainder, b) >= 0) {
      char *smaller = sub_abs_decimal(remainder, b);
      free(remainder);
      remainder = smaller;
      digit++;
    }
    quotient[qi++] = (char)('0' + digit);
  }

  quotient[qi] = '\0';
  free(remainder);
  return strip_leading_zeroes(quotient);
}

static char *div_decimal(const char *left, const char *right) {
  bool left_neg = left[0] == '-';
  bool right_neg = right[0] == '-';
  const char *a = left + (left_neg ? 1 : 0);
  const char *b = right + (right_neg ? 1 : 0);
  while (*b == '0' && b[1]) b++;
  if (strcmp(b, "0") == 0) return NULL;

  char *quotient = div_abs_decimal(a, b);
  if (left_neg != right_neg && strcmp(quotient, "0") != 0) {
    StringBuilder sb;
    sb_init(&sb);
    sb_append_char(&sb, '-');
    sb_append(&sb, quotient);
    free(quotient);
    return sb.data;
  }
  return quotient;
}

static char *pow_decimal(const char *base_text, long long exponent) {
  if (exponent < 0) return NULL;

  char *result = xstrdup("1");
  char *base = xstrdup(base_text);

  while (exponent > 0) {
    if (exponent & 1LL) {
      char *next = mul_decimal(result, base);
      free(result);
      result = next;
    }

    exponent >>= 1;
    if (exponent > 0) {
      char *next_base = mul_decimal(base, base);
      free(base);
      base = next_base;
    }
  }

  free(base);
  return result;
}

/* ------------------------------------------------------------------------- */
/* Solver                                                                    */
/* ------------------------------------------------------------------------- */

typedef struct Solver Solver;
typedef void (*SolutionCallback)(Env *env, void *user_data);

struct Solver {
  Program *program;
  int max_depth;
  long long solutions_seen;
  long long solution_limit;
};

static void solve_goals(Solver *solver, Term **goals, int goal_count, Env *env,
                        int depth, SolutionCallback callback, void *user_data);

static void call_once(Env *env, SolutionCallback callback, void *user_data) {
  callback(env, user_data);
}

typedef struct {
  Solver *solver;
  Term **rest;
  int rest_len;
  int next_depth;
  SolutionCallback callback;
  void *user_data;
} Continuation;

static void continue_after_builtin(Env *env, void *user_data) {
  Continuation *cont = user_data;
  solve_goals(cont->solver, cont->rest, cont->rest_len, env, cont->next_depth,
              cont->callback, cont->user_data);
}

typedef struct {
  int count;
} CountSolutions;

static void count_solution(Env *env, void *user_data) {
  (void)env;
  CountSolutions *counter = user_data;
  counter->count++;
}

static bool builtin_unify(Term *goal, Env *env, SolutionCallback callback, void *user_data) {
  Env next = clone_env(env);
  if (unify(goal->args[0], goal->args[1], &next)) call_once(&next, callback, user_data);
  return true;
}

static bool builtin_neq(Term *goal, Env *env, SolutionCallback callback, void *user_data) {
  Env attempt = clone_env(env);
  if (!unify(goal->args[0], goal->args[1], &attempt)) call_once(env, callback, user_data);
  return true;
}

static bool builtin_compare(const char *name, Term *goal, Env *env,
                            SolutionCallback callback, void *user_data) {
  char *left_text = term_lexical_value(goal->args[0], env);
  char *right_text = term_lexical_value(goal->args[1], env);
  if (!left_text || !right_text) {
    free(left_text);
    free(right_text);
    return true;
  }

  int cmp = 0;
  bool comparable = false;

  if (is_decimal_integer(left_text) && is_decimal_integer(right_text)) {
    cmp = compare_signed_decimal(left_text, right_text);
    comparable = true;
  } else {
    double left = 0.0;
    double right = 0.0;
    if (parse_double_strict(left_text, &left) && parse_double_strict(right_text, &right)) {
      cmp = left < right ? -1 : left > right ? 1 : 0;
      comparable = true;
    }
  }

  if (!comparable) {
    /* Useful for ISO-8601 timestamps and other canonical strings used by
       Eyeling examples. */
    cmp = strcmp(left_text, right_text);
    comparable = true;
  }

  bool pass = false;
  if (strcmp(name, "lt") == 0) pass = cmp < 0;
  else if (strcmp(name, "gt") == 0) pass = cmp > 0;
  else if (strcmp(name, "le") == 0) pass = cmp <= 0;
  else if (strcmp(name, "ge") == 0) pass = cmp >= 0;

  if (pass) call_once(env, callback, user_data);
  free(left_text);
  free(right_text);
  return true;
}

static bool builtin_arithmetic(const char *name, Term *goal, Env *env,
                               SolutionCallback callback, void *user_data) {
  char *left_text = term_lexical_value(goal->args[0], env);
  char *right_text = term_lexical_value(goal->args[1], env);
  if (!left_text || !right_text) {
    free(left_text);
    free(right_text);
    return true;
  }

  Term *result = NULL;

  if (is_decimal_integer(left_text) && is_decimal_integer(right_text) &&
      (strcmp(name, "add") == 0 || strcmp(name, "sub") == 0 ||
       strcmp(name, "mul") == 0 || strcmp(name, "div") == 0 ||
       strcmp(name, "pow") == 0 || strcmp(name, "max") == 0 ||
       strcmp(name, "min") == 0)) {
    char *value = NULL;
    if (strcmp(name, "add") == 0) value = add_decimal(left_text, right_text);
    else if (strcmp(name, "sub") == 0) value = sub_decimal(left_text, right_text);
    else if (strcmp(name, "mul") == 0) value = mul_decimal(left_text, right_text);
    else if (strcmp(name, "div") == 0) {
      value = div_decimal(left_text, right_text);
      if (!value) {
        free(left_text);
        free(right_text);
        return true;
      }
    } else if (strcmp(name, "max") == 0) {
      value = xstrdup(compare_signed_decimal(left_text, right_text) >= 0 ? left_text : right_text);
    } else if (strcmp(name, "min") == 0) {
      value = xstrdup(compare_signed_decimal(left_text, right_text) <= 0 ? left_text : right_text);
    } else {
      bool ok_exp = false;
      long long exponent = term_i64(goal->args[1], env, &ok_exp);
      if (!ok_exp || exponent < 0) {
        free(left_text);
        free(right_text);
        return true;
      }
      value = pow_decimal(left_text, exponent);
    }
    result = number_term_from_text(value);
    free(value);
  } else if (strcmp(name, "add") == 0 || strcmp(name, "sub") == 0 ||
             strcmp(name, "mul") == 0 || strcmp(name, "div") == 0 ||
             strcmp(name, "pow") == 0 || strcmp(name, "max") == 0 ||
             strcmp(name, "min") == 0) {
    double left = 0.0;
    double right = 0.0;
    if (!parse_double_strict(left_text, &left) || !parse_double_strict(right_text, &right)) {
      free(left_text);
      free(right_text);
      return true;
    }

    double value = 0.0;
    if (strcmp(name, "add") == 0) value = left + right;
    else if (strcmp(name, "sub") == 0) value = left - right;
    else if (strcmp(name, "mul") == 0) value = left * right;
    else if (strcmp(name, "div") == 0) {
      if (right == 0.0) {
        free(left_text);
        free(right_text);
        return true;
      }
      value = left / right;
    } else if (strcmp(name, "pow") == 0) {
      errno = 0;
      value = pow(left, right);
      if (errno != 0 || !isfinite(value)) {
        free(left_text);
        free(right_text);
        return true;
      }
    } else if (strcmp(name, "max") == 0) {
      value = left > right ? left : right;
    } else {
      value = left < right ? left : right;
    }

    char *value_text = number_text_from_double(value);
    if (!value_text) {
      free(left_text);
      free(right_text);
      return true;
    }
    result = number_term_from_text(value_text);
    free(value_text);
  } else {
    bool ok_left = false;
    bool ok_right = false;
    long long left = term_i64(goal->args[0], env, &ok_left);
    long long right = term_i64(goal->args[1], env, &ok_right);
    long long value = 0;

    if (!ok_left || !ok_right) {
      free(left_text);
      free(right_text);
      return true;
    }

    if (strcmp(name, "mod") == 0) {
      if (right == 0) {
        free(left_text);
        free(right_text);
        return true;
      }
      value = left % right;
    } else {
      free(left_text);
      free(right_text);
      return true;
    }
    result = number_term_from_i64(value);
  }

  Env next = clone_env(env);
  if (result && unify(goal->args[2], result, &next)) call_once(&next, callback, user_data);

  free(left_text);
  free(right_text);
  return true;
}

static bool builtin_between(Term *goal, Env *env, SolutionCallback callback, void *user_data) {
  bool ok_low = false;
  bool ok_high = false;
  long long low = term_i64(goal->args[0], env, &ok_low);
  long long high = term_i64(goal->args[1], env, &ok_high);
  if (!ok_low || !ok_high) return true;

  for (long long value = low; value <= high; value++) {
    Env next = clone_env(env);
    if (unify(goal->args[2], number_term_from_i64(value), &next)) call_once(&next, callback, user_data);
  }
  return true;
}

static bool builtin_smallest_divisor_from(Term *goal, Env *env,
                                          SolutionCallback callback, void *user_data) {
  bool ok_n = false;
  bool ok_d = false;
  long long n = term_i64(goal->args[0], env, &ok_n);
  long long d = term_i64(goal->args[1], env, &ok_d);
  if (!ok_n || !ok_d || n < 0 || d <= 0) return true;

  long long result = n;
  for (long long candidate = d; candidate > 0 && candidate <= n / candidate; candidate++) {
    if (n % candidate == 0) {
      result = candidate;
      break;
    }
  }

  Env next = clone_env(env);
  if (unify(goal->args[2], number_term_from_i64(result), &next)) call_once(&next, callback, user_data);
  return true;
}

static bool builtin_concat(const char *name, Term *goal, Env *env,
                           SolutionCallback callback, void *user_data) {
  char *left = term_lexical_value(goal->args[0], env);
  char *right = term_lexical_value(goal->args[1], env);
  if (!left || !right) {
    free(left);
    free(right);
    return true;
  }

  StringBuilder sb;
  sb_init(&sb);
  sb_append(&sb, left);
  sb_append(&sb, right);

  Term *result = strcmp(name, "str_concat") == 0 ? string_term(sb.data) : atom_term(sb.data);
  Env next = clone_env(env);
  if (unify(goal->args[2], result, &next)) call_once(&next, callback, user_data);

  free(left);
  free(right);
  free(sb.data);
  return true;
}

static bool simple_alternation_match(const char *haystack, const char *pattern) {
  const char *start = pattern;
  for (const char *cursor = pattern;; cursor++) {
    if (*cursor == '|' || *cursor == '\0') {
      size_t len = (size_t)(cursor - start);
      char *needle = xstrndup(start, len);
      bool matched = len == 0 || strstr(haystack, needle) != NULL;
      free(needle);
      if (matched) return true;
      if (*cursor == '\0') break;
      start = cursor + 1;
    }
  }
  return false;
}

static bool builtin_contains(const char *name, Term *goal, Env *env,
                             SolutionCallback callback, void *user_data) {
  char *haystack = term_lexical_value(goal->args[0], env);
  char *needle = term_lexical_value(goal->args[1], env);
  if (!haystack || !needle) {
    free(haystack);
    free(needle);
    return true;
  }

  bool has = strstr(haystack, needle) != NULL;
  bool pass = (strcmp(name, "contains") == 0 && has) ||
              (strcmp(name, "not_contains") == 0 && !has) ||
              ((strcmp(name, "matches") == 0 || strcmp(name, "string:matches") == 0) &&
               simple_alternation_match(haystack, needle)) ||
              ((strcmp(name, "not_matches") == 0 || strcmp(name, "string:notMatches") == 0) &&
               !simple_alternation_match(haystack, needle));
  if (pass) call_once(env, callback, user_data);

  free(haystack);
  free(needle);
  return true;
}

static bool proper_list_items(Term *list, Env *env, Term ***items_out, int *len_out) {
  int len = 0;
  int cap = 8;
  Term **items = xmalloc(sizeof(Term *) * cap);
  Term *cursor = deref(list, env);

  while (is_cons_term(cursor)) {
    if (len == cap) {
      cap *= 2;
      items = xrealloc(items, sizeof(Term *) * cap);
    }
    items[len++] = cursor->args[0];
    cursor = deref(cursor->args[1], env);
  }

  if (!is_empty_list_term(cursor)) {
    free(items);
    return false;
  }

  *items_out = items;
  *len_out = len;
  return true;
}

static Term *list_from_items(Term **items, int start, int end, Term *tail) {
  Term *result = tail ? tail : empty_list_term();
  for (int i = end - 1; i >= start; i--) result = cons_term(items[i], result);
  return result;
}

static bool builtin_append(Term *goal, Env *env, SolutionCallback callback, void *user_data) {
  Term **items = NULL;
  int len = 0;

  if (proper_list_items(goal->args[0], env, &items, &len)) {
    Term *tail = deref(goal->args[1], env);
    Term *result = list_from_items(items, 0, len, tail);
    Env next = clone_env(env);
    if (unify(goal->args[2], result, &next)) call_once(&next, callback, user_data);
    free(items);
    return true;
  }

  if (proper_list_items(goal->args[2], env, &items, &len)) {
    for (int split = 0; split <= len; split++) {
      Term *prefix = list_from_items(items, 0, split, empty_list_term());
      Term *suffix = list_from_items(items, split, len, empty_list_term());
      Env next = clone_env(env);
      if (unify(goal->args[0], prefix, &next) && unify(goal->args[1], suffix, &next)) {
        call_once(&next, callback, user_data);
      }
    }
    free(items);
  }

  return true;
}

static bool builtin_rest(Term *goal, Env *env, SolutionCallback callback, void *user_data) {
  Term *list = deref(goal->args[0], env);
  if (!is_cons_term(list)) return true;

  Env next = clone_env(env);
  if (unify(goal->args[1], list->args[1], &next)) call_once(&next, callback, user_data);
  return true;
}

static bool builtin_member(Term *goal, Env *env, SolutionCallback callback, void *user_data) {
  Term **items = NULL;
  int len = 0;
  if (!proper_list_items(goal->args[1], env, &items, &len)) return true;

  for (int i = 0; i < len; i++) {
    Env next = clone_env(env);
    if (unify(goal->args[0], items[i], &next)) call_once(&next, callback, user_data);
  }

  free(items);
  return true;
}

static bool builtin_length(Term *goal, Env *env, SolutionCallback callback, void *user_data) {
  Term **items = NULL;
  int len = 0;
  if (!proper_list_items(goal->args[0], env, &items, &len)) return true;

  Env next = clone_env(env);
  if (unify(goal->args[1], number_term_from_i64(len), &next)) call_once(&next, callback, user_data);

  free(items);
  return true;
}

static bool builtin_is_list(Term *goal, Env *env, SolutionCallback callback, void *user_data) {
  Term **items = NULL;
  int len = 0;
  if (proper_list_items(goal->args[0], env, &items, &len)) {
    call_once(env, callback, user_data);
    free(items);
  }
  return true;
}

static bool builtin_reverse(Term *goal, Env *env, SolutionCallback callback, void *user_data) {
  Term **items = NULL;
  int len = 0;
  if (!proper_list_items(goal->args[0], env, &items, &len)) return true;

  Term *result = empty_list_term();
  for (int i = 0; i < len; i++) result = cons_term(items[i], result);

  Env next = clone_env(env);
  if (unify(goal->args[1], result, &next)) call_once(&next, callback, user_data);

  free(items);
  return true;
}

static bool builtin_not_member(Term *goal, Env *env, SolutionCallback callback, void *user_data) {
  Term **items = NULL;
  int len = 0;
  if (!proper_list_items(goal->args[1], env, &items, &len)) return true;

  bool found = false;
  for (int i = 0; i < len; i++) {
    Env attempt = clone_env(env);
    if (unify(goal->args[0], items[i], &attempt)) {
      found = true;
      break;
    }
  }

  if (!found) call_once(env, callback, user_data);
  free(items);
  return true;
}

static bool builtin_not(Solver *solver, Term *goal, Env *env,
                        SolutionCallback callback, void *user_data) {
  CountSolutions counter = { 0 };
  Term *inner_goals[1] = { goal->args[0] };
  Env attempt = clone_env(env);
  Solver limited = *solver;
  limited.solutions_seen = 0;
  limited.solution_limit = 1;
  solve_goals(&limited, inner_goals, 1, &attempt, 0, count_solution, &counter);
  if (counter.count == 0) call_once(env, callback, user_data);
  return true;
}

static bool try_builtin(Solver *solver, Term *goal, Env *env,
                        SolutionCallback callback, void *user_data) {
  if (goal->type != TERM_COMPOUND) return false;

  const char *name = goal->name;
  int arity = goal->arity;

  if ((strcmp(name, "eq") == 0 || strcmp(name, "=") == 0 ||
       strcmp(name, "equal_to") == 0 || strcmp(name, "math:equalTo") == 0) && arity == 2) {
    return builtin_unify(goal, env, callback, user_data);
  }

  if ((strcmp(name, "neq") == 0 || strcmp(name, "not_eq") == 0 ||
       strcmp(name, "not_equal") == 0 || strcmp(name, "not_equal_to") == 0 ||
       strcmp(name, "math:notEqualTo") == 0 || strcmp(name, "log:notEqualTo") == 0) && arity == 2) {
    return builtin_neq(goal, env, callback, user_data);
  }

  if ((strcmp(name, "add") == 0 || strcmp(name, "sum") == 0 || strcmp(name, "math:sum") == 0 ||
       strcmp(name, "sub") == 0 || strcmp(name, "difference") == 0 || strcmp(name, "math:difference") == 0 ||
       strcmp(name, "mul") == 0 || strcmp(name, "product") == 0 || strcmp(name, "math:product") == 0 ||
       strcmp(name, "div") == 0 || strcmp(name, "quotient") == 0 || strcmp(name, "math:quotient") == 0 ||
       strcmp(name, "integer_quotient") == 0 || strcmp(name, "integerQuotient") == 0 || strcmp(name, "math:integerQuotient") == 0 ||
       strcmp(name, "mod") == 0 || strcmp(name, "remainder") == 0 || strcmp(name, "math:remainder") == 0 ||
       strcmp(name, "max") == 0 || strcmp(name, "maximum") == 0 || strcmp(name, "math:max") == 0 || strcmp(name, "math:maximum") == 0 ||
       strcmp(name, "min") == 0 || strcmp(name, "minimum") == 0 || strcmp(name, "math:min") == 0 || strcmp(name, "math:minimum") == 0 ||
       strcmp(name, "pow") == 0 || strcmp(name, "exponentiation") == 0 || strcmp(name, "math:exponentiation") == 0) && arity == 3) {
    const char *op = name;
    if (strcmp(name, "sum") == 0 || strcmp(name, "math:sum") == 0) op = "add";
    else if (strcmp(name, "difference") == 0 || strcmp(name, "math:difference") == 0) op = "sub";
    else if (strcmp(name, "product") == 0 || strcmp(name, "math:product") == 0) op = "mul";
    else if (strcmp(name, "quotient") == 0 || strcmp(name, "math:quotient") == 0 ||
             strcmp(name, "integer_quotient") == 0 || strcmp(name, "integerQuotient") == 0 ||
             strcmp(name, "math:integerQuotient") == 0) op = "div";
    else if (strcmp(name, "remainder") == 0 || strcmp(name, "math:remainder") == 0) op = "mod";
    else if (strcmp(name, "maximum") == 0 || strcmp(name, "math:max") == 0 || strcmp(name, "math:maximum") == 0) op = "max";
    else if (strcmp(name, "minimum") == 0 || strcmp(name, "math:min") == 0 || strcmp(name, "math:minimum") == 0) op = "min";
    else if (strcmp(name, "exponentiation") == 0 || strcmp(name, "math:exponentiation") == 0) op = "pow";
    return builtin_arithmetic(op, goal, env, callback, user_data);
  }

  if ((strcmp(name, "lt") == 0 || strcmp(name, "less_than") == 0 ||
       strcmp(name, "gt") == 0 || strcmp(name, "greater_than") == 0 ||
       strcmp(name, "le") == 0 || strcmp(name, "not_greater_than") == 0 ||
       strcmp(name, "ge") == 0 || strcmp(name, "not_less_than") == 0 ||
       strcmp(name, "math:lessThan") == 0 || strcmp(name, "math:greaterThan") == 0 ||
       strcmp(name, "math:notGreaterThan") == 0 || strcmp(name, "math:notLessThan") == 0) && arity == 2) {
    const char *op = name;
    if (strcmp(name, "less_than") == 0 || strcmp(name, "math:lessThan") == 0) op = "lt";
    else if (strcmp(name, "greater_than") == 0 || strcmp(name, "math:greaterThan") == 0) op = "gt";
    else if (strcmp(name, "not_greater_than") == 0 || strcmp(name, "math:notGreaterThan") == 0) op = "le";
    else if (strcmp(name, "not_less_than") == 0 || strcmp(name, "math:notLessThan") == 0) op = "ge";
    return builtin_compare(op, goal, env, callback, user_data);
  }

  if (strcmp(name, "between") == 0 && arity == 3) {
    return builtin_between(goal, env, callback, user_data);
  }

  if (strcmp(name, "smallest_divisor_from") == 0 && arity == 3) {
    return builtin_smallest_divisor_from(goal, env, callback, user_data);
  }

  if ((strcmp(name, "atom_concat") == 0 || strcmp(name, "str_concat") == 0) && arity == 3) {
    return builtin_concat(name, goal, env, callback, user_data);
  }

  if ((strcmp(name, "contains") == 0 || strcmp(name, "not_contains") == 0 ||
       strcmp(name, "matches") == 0 || strcmp(name, "not_matches") == 0 ||
       strcmp(name, "string:matches") == 0 || strcmp(name, "string:notMatches") == 0) && arity == 2) {
    return builtin_contains(name, goal, env, callback, user_data);
  }

  if ((strcmp(name, "append") == 0 || strcmp(name, "list:append") == 0) && arity == 3) {
    return builtin_append(goal, env, callback, user_data);
  }

  if ((strcmp(name, "rest") == 0 || strcmp(name, "list:rest") == 0) && arity == 2) {
    return builtin_rest(goal, env, callback, user_data);
  }

  if ((strcmp(name, "member") == 0 || strcmp(name, "in") == 0 ||
       strcmp(name, "list:member") == 0 || strcmp(name, "list:in") == 0) && arity == 2) {
    return builtin_member(goal, env, callback, user_data);
  }

  if ((strcmp(name, "not_member") == 0 || strcmp(name, "list:notMember") == 0) && arity == 2) {
    return builtin_not_member(goal, env, callback, user_data);
  }

  if ((strcmp(name, "reverse") == 0 || strcmp(name, "list:reverse") == 0) && arity == 2) {
    return builtin_reverse(goal, env, callback, user_data);
  }

  if ((strcmp(name, "length") == 0 || strcmp(name, "list:length") == 0) && arity == 2) {
    return builtin_length(goal, env, callback, user_data);
  }

  if ((strcmp(name, "is_list") == 0 || strcmp(name, "list:isList") == 0) && arity == 1) {
    return builtin_is_list(goal, env, callback, user_data);
  }

  if (strcmp(name, "not") == 0 && arity == 1) {
    return builtin_not(solver, goal, env, callback, user_data);
  }

  return false;
}

static void solve_one_goal(Solver *solver, Term *goal, Term **rest, int rest_len,
                           Env *env, int depth, SolutionCallback callback, void *user_data) {
  if (depth > solver->max_depth) return;
  if (solver->solutions_seen >= solver->solution_limit) return;

  Continuation cont = { solver, rest, rest_len, depth + 1, callback, user_data };
  if (try_builtin(solver, goal, env, continue_after_builtin, &cont)) return;

  if (goal->type != TERM_COMPOUND) return;

  PredicateGroup *group = find_group(solver->program, goal->name, goal->arity);
  if (!group) return;

  for (int i = 0; i < group->len && solver->solutions_seen < solver->solution_limit; i++) {
    Clause *clause = &solver->program->clauses[group->clause_indexes[i]];
    if (clause_head_cannot_match(goal, clause, env)) continue;

    Clause fresh = fresh_clause(clause);
    Env next = clone_env(env);

    if (unify(goal, fresh.head, &next)) {
      int total = fresh.body_len + rest_len;
      Term **next_goals = xmalloc(sizeof(Term *) * (total ? total : 1));
      for (int j = 0; j < fresh.body_len; j++) next_goals[j] = fresh.body[j];
      for (int j = 0; j < rest_len; j++) next_goals[fresh.body_len + j] = rest[j];
      solve_goals(solver, next_goals, total, &next, depth + 1, callback, user_data);
    }
  }
}

static void solve_goals(Solver *solver, Term **goals, int goal_count, Env *env,
                        int depth, SolutionCallback callback, void *user_data) {
  if (solver->solutions_seen >= solver->solution_limit) return;

  if (goal_count == 0) {
    solver->solutions_seen++;
    callback(env, user_data);
    return;
  }

  solve_one_goal(solver, goals[0], goals + 1, goal_count - 1, env, depth, callback, user_data);
}

/* ------------------------------------------------------------------------- */
/* Default triple/3 materialization output                                   */
/* ------------------------------------------------------------------------- */

typedef struct {
  char **items;
  int len;
  int cap;
  char **set;
  int set_cap;
  int set_count;
} Lines;

static uint64_t hash_line(const char *text) {
  uint64_t hash = 1469598103934665603ULL;
  while (*text) {
    hash ^= (unsigned char)*text++;
    hash *= 1099511628211ULL;
  }
  return hash;
}

static void lines_insert_existing(Lines *lines, char *line) {
  uint64_t hash = hash_line(line);
  int mask = lines->set_cap - 1;
  for (int i = (int)(hash & (uint64_t)mask);; i = (i + 1) & mask) {
    if (!lines->set[i]) {
      lines->set[i] = line;
      lines->set_count++;
      return;
    }
  }
}

static void lines_rehash(Lines *lines, int requested_cap) {
  int cap = 2048;
  while (cap < requested_cap) cap *= 2;

  free(lines->set);
  lines->set = xcalloc((size_t)cap, sizeof(char *));
  lines->set_cap = cap;
  lines->set_count = 0;

  for (int i = 0; i < lines->len; i++) lines_insert_existing(lines, lines->items[i]);
}

static bool lines_contains(Lines *lines, const char *line) {
  if (!lines->set_cap) return false;

  uint64_t hash = hash_line(line);
  int mask = lines->set_cap - 1;
  for (int i = (int)(hash & (uint64_t)mask);; i = (i + 1) & mask) {
    char *candidate = lines->set[i];
    if (!candidate) return false;
    if (strcmp(candidate, line) == 0) return true;
  }
}

static void add_line(Lines *lines, const char *line) {
  if (!lines->set_cap || (lines->set_count + 1) * 10 >= lines->set_cap * 7) {
    lines_rehash(lines, lines->set_cap ? lines->set_cap * 2 : 2048);
  }

  if (lines_contains(lines, line)) return;

  if (lines->len == lines->cap) {
    lines->cap = lines->cap ? lines->cap * 2 : 1024;
    lines->items = xrealloc(lines->items, sizeof(char *) * lines->cap);
  }

  char *copy = xstrdup(line);
  lines->items[lines->len++] = copy;
  lines_insert_existing(lines, copy);
}

static int compare_lines(const void *left, const void *right) {
  return strcmp(*(char *const *)left, *(char *const *)right);
}

typedef struct {
  Lines *lines;
  Term *goal;
} PrintContext;

static void collect_printed_goal(Env *env, void *user_data) {
  PrintContext *ctx = user_data;
  char *text = term_to_string(ctx->goal, env, true);

  StringBuilder line;
  sb_init(&line);
  sb_append(&line, text);
  sb_append(&line, ".\n");
  add_line(ctx->lines, line.data);

  free(text);
  free(line.data);
}

static void print_default_output(Program *program) {
  Solver solver = { program, MAX_DEPTH, 0, MAX_SOLUTIONS };
  Term *args[3] = { new_term(TERM_VAR, "S"), new_term(TERM_VAR, "P"), new_term(TERM_VAR, "O") };
  Term *goal = new_compound("triple", 3, args);
  Term *goals[1] = { goal };
  Env env = { 0 };
  Lines lines = { 0 };
  PrintContext ctx = { &lines, goal };

  solve_goals(&solver, goals, 1, &env, 0, collect_printed_goal, &ctx);
  qsort(lines.items, lines.len, sizeof(char *), compare_lines);

  for (int i = 0; i < lines.len; i++) fputs(lines.items[i], stdout);
}

/* ------------------------------------------------------------------------- */
/* CLI                                                                       */
/* ------------------------------------------------------------------------- */

static void print_usage(FILE *stream) {
  fprintf(stream, "usage: eyelog [--version] [--query GOAL] FILE.pl\n");
}

static void print_version(void) {
  printf("eyelog %s\n", EYELOG_VERSION);
}

static Term *parse_query_goal(const char *query) {
  char *source = NULL;
  if (asprintf(&source, "q(%s).", query) < 0) die("out of memory");

  char path[] = "/tmp/eyelog-query-XXXXXX";
  int fd = mkstemp(path);
  if (fd < 0) die("could not create query temp file");

  FILE *file = fdopen(fd, "w");
  if (!file) die("could not open query temp file");
  fputs(source, file);
  fclose(file);

  Program program = parse_program(path);
  remove(path);
  free(source);

  return program.clauses[0].head->args[0];
}

static void print_query_solution(Env *env, void *user_data) {
  Term *goal = user_data;
  char *text = term_to_string(goal, env, true);
  printf("%s.\n", text);
  free(text);
}

int main(int argc, char **argv) {
  const char *query = NULL;
  const char *file = NULL;

  for (int i = 1; i < argc; i++) {
    if (strcmp(argv[i], "--version") == 0 || strcmp(argv[i], "-v") == 0) {
      print_version();
      return 0;
    } else if (strcmp(argv[i], "--help") == 0 || strcmp(argv[i], "-h") == 0) {
      print_usage(stdout);
      return 0;
    } else if (strcmp(argv[i], "--query") == 0) {
      if (++i >= argc) die("missing query after --query");
      query = argv[i];
    } else {
      file = argv[i];
    }
  }

  if (!file) {
    print_usage(stderr);
    return 2;
  }

  Program program = parse_program(file);

  if (query) {
    Term *goal = parse_query_goal(query);
    Term *goals[1] = { goal };
    Env env = { 0 };
    Solver solver = { &program, MAX_DEPTH, 0, MAX_SOLUTIONS };
    solve_goals(&solver, goals, 1, &env, 0, print_query_solution, goal);
  } else {
    print_default_output(&program);
  }

  return 0;
}
