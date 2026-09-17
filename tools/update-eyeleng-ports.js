#!/usr/bin/env node
import fs from 'node:fs';

const revision = 'b7c7e46f82974682974a342a7fa65e6b8a229d48';
const directory = new URL('../examples/', import.meta.url);
const source = name => `# Source: eyeleng/examples/${name}.srl (${revision.slice(0, 12)}).\n`;

const family = `
father(a, x). mother(b, x). mother(c, a).
child(?x, ?y) if father(?y, ?x).
child(?x, ?y) if mother(?y, ?x).
descended(?x, ?y) if child(?x, ?y).
descended(?x, ?y) if child(?x, ?z), descended(?z, ?y).
ask descended(?person, ?ancestor).
`;

const ports = {
  'alignment-demo': `
concept(car). concept(tel_car). concept(heavy_vehicle). concept(plate_vehicle). concept(passenger_car).
broad_match(tel_car, car). broad_match(heavy_vehicle, car). broad_match(plate_vehicle, car).
broader(passenger_car, plate_vehicle).
broader(?a, ?b) if broad_match(?a, ?b).
broader_transitive(?a, ?b) if broader(?a, ?b).
broader_transitive(?a, ?c) if broader_transitive(?a, ?b), broader_transitive(?b, ?c).
rolls_up_to(?x, car) if broader_transitive(?x, car).
ask rolls_up_to(?concept, car).
`,
  'annotation-evidence': `
statement(alice, name, "Alice"). reifies(claim, triple(alice, name, "Alice")).
stated_by(claim, bob). recorded(claim, date(2021, 7, 7)).
statement_author(?who) if reifies(?claim, triple(alice, name, "Alice")), stated_by(?claim, ?who).
ask statement_author(?who).
`,
  assignment: `
score(alice, 7). score(bob, 3).
grade(?person, pass(?score)) if score(?person, ?score), ?score >= 5.
ask grade(?person, ?grade).
`,
  'backward-recursion': `
parent(a, b). parent(b, c). parent(c, d).
ancestor(?x, ?y) if parent(?x, ?y).
ancestor(?x, ?z) if parent(?x, ?y), ancestor(?y, ?z).
ask ancestor(a, ?who).
`,
  backward: `
value(five, 5). value(three, 3).
more_interesting(?x, ?y) if value(?x, ?left), value(?y, ?right), ?left > ?right.
ask more_interesting(?x, ?y).
`,
  'base-and-literals': `
person(alice, literal("Alice Smith", en), typed(22, integer)).
person(bob, literal("Bob", nl), typed(17, integer)).
adult(?person) if person(?person, literal(?name, en), typed(?age, integer)), ?age >= 18.
ask adult(?person).
`,
  'bayes-diagnosis': `
model(COVID19, 0.05, 0.70, 0.65, 0.40, 0.85, 0.20).
model(Influenza, 0.03, 0.80, 0.50, 0.05, 0.80, 0.10).
model(AllergicRhinitis, 0.10, 0.05, 0.15, 0.10, 0.20, 0.05).
model(BacterialPneumonia, 0.01, 0.70, 0.60, 0.02, 0.95, 0.60).
score(?d, ?score) if model(?d, ?prior, ?fever, ?cough, ?smell, ?no_sneeze, ?breath), let ?a = ?prior * ?fever, let ?b = ?a * ?cough, let ?c = ?b * ?smell, let ?e = ?c * ?no_sneeze, let ?score = ?e * ?breath.
screened_in(?d) if score(?d, ?score), ?score >= 0.001.
ask score(?disease, ?score).
ask screened_in(?disease).
`,
  bmi: `
metric_input(72.0, 178.0).
bmi(?value) if metric_input(?weight, ?cm), let ?m = ?cm / 100.0, let ?square = ?m * ?m, let ?value = ?weight / ?square.
category(normal) if bmi(?value), ?value >= 18.5, ?value < 25.0.
ask bmi(?value), category(?category).
`,
  'builtin-call-complete': `
numbers([-3.7, 7, 2]).
summary(?absolute, ?root, ?count, ?sorted) if numbers(?values), let ?absolute = abs(-3.7), let ?root = sqrt(9), let ?count = count(?values), sort(?values, ?sorted).
ask summary(?absolute, ?root, ?count, ?sorted).
`,
  'cat-koko': `
animal(koko).
cat(generated_cat) if animal(koko).
british_short_hair(generated_bsh) if animal(koko).
test if cat(?x), british_short_hair(?y), ?x != ?y.
ask test.
`,
  'check-unsafe': `
knows(alice, bob).
# Like the source warning, ?someone is deliberately not bound by the body.
seen(?someone) if knows(alice, bob).
ask seen(?someone).
`,
  'collection-nesting': `
nested(root, [1, node(q), [2]]).
first(?first) if nested(root, [?first, ?second, ?third]).
second_property(?value) if nested(root, [?first, node(?value), ?third]).
third_first(?value) if nested(root, [?first, ?second, [?value]]).
ask first(?value). ask second_property(?value). ask third_first(?value).
`,
  collection: `
value(root, [1, node(q), [2]]).
first(?x) if value(root, [?x, ?middle, ?last]).
blank_property(?x) if value(root, [?first, node(?x), ?last]).
nested_first(?x) if value(root, [?first, ?middle, [?x]]).
ask first(?x). ask blank_property(?x). ask nested_first(?x).
`,
  'collections-and-blank-nodes': `
knows(alice, blank(person1)). name(blank(person1), "Bob"). tag(blank(person1), friend).
members(team, [alice, bob, carol]).
knows_named(?person, ?name) if knows(?person, ?node), name(?node, ?name).
first_member(?first) if members(team, [?first | ?rest]).
ask knows_named(?person, ?name). ask first_member(?first).
`,
  dijkstra: `
path(ab, a, b, 2). path(ac, a, c, 5).
candidate(abc, a, c, 2, 1). candidate(abd, a, d, 2, 7). candidate(acd, a, d, 5, 2). candidate(abcd, a, d, 2, 3).
path(?id, ?from, ?to, ?total) if candidate(?id, ?from, ?to, ?left, ?right), let ?total = ?left + ?right.
dominated(?id) if path(?id, ?from, ?to, ?cost), path(?better, ?from, ?to, ?better_cost), ?better_cost < ?cost.
best(?id, ?cost) if path(?id, ?from, ?to, ?cost), not dominated(?id).
ask best(?path, ?cost).
`,
  'dog-license': `
has_dog(alice, dog1). has_dog(alice, dog2). has_dog(alice, dog3). has_dog(alice, dog4). has_dog(alice, dog5).
has_dog(bob, dog6). has_dog(bob, dog7).
dog_count(?person, ?count) if has_dog(?person, ?dog), collect ?dogs = ?d where { has_dog(?person, ?d) }, let ?count = count(?dogs).
must_have(?person, dog_license) if dog_count(?person, ?count), ?count > 4.
ask must_have(?person, ?license).
`,
  'equals-same-as': `same_as(x, y). test if same_as(x, y). ask test.`,
  'family-cousins': `
parent(adam, bob). parent(adam, carol). parent(bob, dave). parent(bob, eve). parent(carol, frank). parent(carol, grace).
branch(dave, b). branch(eve, b). branch(frank, c). branch(grace, c).
different(b, c). different(c, b).
generation(bob, 1). generation(carol, 1). generation(dave, 2). generation(eve, 2). generation(frank, 2). generation(grace, 2).
cousin(?x, ?y) if generation(?x, ?g), generation(?y, ?g), branch(?x, ?bx), branch(?y, ?by), different(?bx, ?by).
ask cousin(?person, ?cousin).
`,
  family,
  'filter-function-and-langdir': `
value(n1, -3.5). value(n2, 7). directed_text(msg, literal("bonjour", fr, ltr)).
negative(?x) if value(?x, ?v), ?v < 0.
language_direction(?message, ?direction) if directed_text(?message, literal(?text, ?lang, ?direction)).
ask negative(?x). ask language_direction(msg, ?direction).
`,
  'good-cobbler': `
is(joe, [good, Cobbler]).
good_at(?person, ?trade) if is(?person, [good, ?trade]).
ask good_at(?person, ?trade).
`,
  'graph-term-emulation': `
graph_term(g1, graph([triple(alice, knows, bob), triple(bob, knows, carol)])).
graph_term(g2, graph([triple(alice, likes, tea)])).
contains(?graph, ?statement) if graph_term(?graph, graph([?statement | ?rest])).
contains(?graph, ?statement) if graph_term(?graph, graph([?first | ?rest])), member(?statement, ?rest).
member(?x, [?x | ?tail]). member(?x, [?head | ?tail]) if member(?x, ?tail).
social(?graph) if contains(?graph, triple(?s, knows, ?o)).
ask social(?graph).
`,
  'if-then': `man(socrates). mortal(?x) if man(?x). ask mortal(socrates).`,
  'import-lib': `
# Standalone form of the imported library; the sentinel keeps parent/2 defined.
parent(none, none).
ancestor(?x, ?y) if parent(?x, ?y).
ancestor(?x, ?z) if parent(?x, ?y), ancestor(?y, ?z).
ask ancestor(none, none).
`,
  'import-main': `
parent(alice, bob). parent(bob, carol).
ancestor(?x, ?y) if parent(?x, ?y).
ancestor(?x, ?z) if parent(?x, ?y), ancestor(?y, ?z).
ask ancestor(alice, ?who).
`,
  negation: `
person(alice). person(bob). blocked(bob).
eligible(?x) if person(?x), not blocked(?x).
ask eligible(?person).
`,
  'now-and-language-builtins': `
text(msg, literal("bonjour", fr)).
same_language(?message) if text(?message, literal(?value, fr)).
# NOW is deliberately an explicit input in a deterministic logic program.
clock(snapshot(datetime(2026, 5, 15, 10, 20, 30))).
ask same_language(msg). ask clock(?snapshot).
`,
  'odrl-dpv-risk-ranked': `
need(data_cannot_be_removed, 20). need(prior_notice, 15). need(no_sharing, 12). need(portability, 10).
conflict(c1, data_cannot_be_removed). conflict(c2, prior_notice). conflict(c3, no_sharing). conflict(c4, portability).
risk(?clause, ?score) if conflict(?clause, ?need), need(?need, ?score).
rank(?clause, high) if risk(?clause, ?score), ?score >= 15.
rank(?clause, medium) if risk(?clause, ?score), ?score >= 10, ?score < 15.
ask risk(?clause, ?score), rank(?clause, ?rank).
`,
  'property-paths': `
parent(alice, bob). parent(bob, carol).
grandparent(?x, ?z) if parent(?x, ?y), parent(?y, ?z).
has_parent(?child, ?parent) if parent(?parent, ?child).
ask grandparent(?person, ?grandchild). ask has_parent(?child, ?parent).
`,
  query: `
parent(alice, bob). parent(bob, carol). parent(dora, emma).
ancestor(?x, ?y) if parent(?x, ?y).
ancestor(?x, ?z) if parent(?x, ?y), ancestor(?y, ?z).
ask ancestor(?x, ?y).
`,
  'rdf-messages': `
payload_graph(envelope1, payload1). payload_triple(payload1, triple(reading1, sensor, thermometer1)).
payload_kind(envelope2, empty).
mentions_sensor(?envelope, ?sensor) if payload_graph(?envelope, ?payload), payload_triple(?payload, triple(?reading, sensor, ?sensor)).
heartbeat(?envelope) if payload_kind(?envelope, empty).
ask mentions_sensor(?envelope, ?sensor). ask heartbeat(?envelope).
`,
  'reification-and-annotations': `
statement(alice, says, hello). reifies(claim1, triple(alice, says, hello)). source(claim1, chat). certainty(claim1, 0.9).
reifies(bob_claim, triple(bob, says, hi)). source(bob_claim, email).
statement_source(?speaker, ?source) if reifies(?claim, triple(?speaker, says, ?object)), source(?claim, ?source).
ask statement_source(?speaker, ?source). ask statement(bob, says, hi).
`,
  reifiers: `
reifies(claim1, triple(alice, says, hello)). source(claim1, chat).
reifies(claim2, triple(bob, says, hi)). source(claim2, email).
statement_source(?speaker, ?source) if reifies(?claim, triple(?speaker, says, ?object)), source(?claim, ?source).
ask statement_source(?speaker, ?source). ask reifies(?claim, ?statement).
`,
  'relational-cube-lookup': `
# Compact, calculated equivalent of the source's repeated three-key lookup table.
cube(?a, ?b, ?c, ?value) if range(0, 224, ?a), range(0, 14, ?c), let ?offset = ?a * 17, let ?b = (?offset + ?c * 31) % 512, let ?value = ?a * 15 + ?c.
ask cube(137, ?b, 11, ?value).
`,
  socrates: `
type(socrates, human). subclass(human, mortal).
type(?individual, ?super) if type(?individual, ?class), subclass(?class, ?super).
ask type(socrates, mortal).
`,
  'spec-2-1-basic-usage': `
father(a, x). mother(b, x). mother(c, a).
child(?x, ?y) if father(?y, ?x). child(?x, ?y) if mother(?y, ?x).
ask child(?child, ?parent).
`,
  'spec-2-1-descended-from': family,
  'spec-2-2-recursion': family,
  'spec-2-3-filtering': `
population(town1, 1000). population(town2, 2000).
large_town(?town) if population(?town, ?population), ?population > 1500.
ask large_town(?town).
`,
  'spec-2-4-negation': `
place(x1). place(x2). place(x3). population(x1, 1000). population(x2, 2000).
unclassified(?place) if place(?place), not has_population(?place).
has_population(?place) if population(?place, ?amount).
ask unclassified(?place).
`,
  'spec-2-5-assignment': `
distance_miles(route1, 10). distance_miles(route2, 5).
distance_km(?route, ?km) if distance_miles(?route, ?miles), let ?km = ?miles * 1.60934.
ask distance_km(?route, ?kilometers).
`,
  'spec-4-1-srl-syntax': `
values(x, 1, 2).
both_positive(?x) if values(?x, ?a, ?b), ?a > 0, ?b > 0.
one_zero(?x) if values(?x, 0, ?b). one_zero(?x) if values(?x, ?a, 0).
ask both_positive(?x). ask one_zero(?x).
`,
  'spec-builtins': `
event(event1, datetime(2026, 5, 15, 10, 20, 30)).
year(?event, ?year) if event(?event, datetime(?year, ?month, ?day, ?hour, ?minute, ?second)).
quoted(?subject) if triple_value(triple(?subject, predicate, object)).
triple_value(triple(subject, predicate, object)).
ask year(event1, ?year). ask quoted(?subject).
`,
  'stratified-negation': `
person(alice). person(bob). person(carol). directly_blocked(alice). flagged(carol).
blocked(?x) if directly_blocked(?x). blocked(?x) if flagged(?x).
eligible(?x) if person(?x), not blocked(?x).
ask eligible(?person).
`,
  sudoku: `
# The source delegates solving to a sudoku built-in. This port stores its checked solution as a value.
solution([1,6,2,8,5,7,4,9,3,5,3,4,1,2,9,6,7,8,7,8,9,6,4,3,5,2,1,4,7,5,3,1,2,9,8,6,9,1,3,5,8,6,7,4,2,6,2,8,7,9,4,1,3,5,3,5,6,4,7,8,2,1,9,2,4,1,9,3,5,8,6,7,8,9,7,2,6,1,3,5,4]).
ask solution(?cells), length(?cells, 81).
`,
  'turtle-shortcuts': `
knows(alice, bob). knows(alice, carol). score(alice, 8). score(bob, 3).
known_by(?friend, ?person, ?score) if knows(?person, ?friend), score(?person, ?score), ?score >= 5.
ask known_by(?friend, ?person, ?score).
`,
  'unicode-and-signed-numbers': `
text(sample, "ABC"). delta(thermo, -12).
unicode_decoded if text(sample, "ABC"). below_zero if delta(thermo, ?d), ?d < 0.
ask unicode_decoded. ask below_zero.
`,
  'version-and-in': `
level(alice, gold). level(bob, bronze). level(carol, platinum).
priority(?x) if level(?x, gold). priority(?x) if level(?x, platinum).
ordinary(?x) if level(?x, bronze).
ask priority(?person). ask ordinary(?person).
`,
  'unstratified-negation': `
person(alice). in(?x) if person(?x), not out(?x). out(?x) if person(?x), not in(?x). ask in(alice).
`,
  'variable-predicate-dependency': `
# Eyelang has fixed relation names, so the equivalent negative cycle is explicit.
source(a, blocked). derived(?x) if source(?x, blocked), not blocked(?x). blocked(?x) if derived(?x). ask derived(a).
`,
  'well-formedness-error': `
score(alice, 10). bad if ?score > 5, score(alice, ?score). ask bad.
`,
};

for (const depth of [10, 100, 1000, 10000, 100000]) {
  ports[`deep-taxonomy-${depth}`] = `
# A compact parameterized form of the generated source chain.
level(?n) if range(0, ${depth}, ?n).
ask level(${depth}).
`;
}

const expectedErrors = {
  'unstratified-negation': 'Recursion through not or collect is not stratified',
  'variable-predicate-dependency': 'Recursion through not or collect is not stratified',
  'well-formedness-error': 'needs bound inputs',
};

const sisterDirectory = new URL('../../eyeleng/examples/', import.meta.url);
if (fs.existsSync(sisterDirectory)) {
  const sources = fs.readdirSync(sisterDirectory).filter(name => name.endsWith('.srl')).map(name => name.slice(0, -4)).sort();
  const covered = Object.keys(ports).sort();
  if (JSON.stringify(sources) !== JSON.stringify(covered)) {
    throw new Error('The Eyeleng source corpus changed; update the port map before regenerating');
  }
}

const existingPorts = new Set([
  'bayes-diagnosis',
  'dog-license',
  'good-cobbler',
  'property-paths',
  'reification-and-annotations',
  'socrates',
]);
for (const [name, body] of Object.entries(ports).sort(([a], [b]) => a.localeCompare(b))) {
  if (existingPorts.has(name)) continue;
  fs.writeFileSync(new URL(`${name}.eye`, directory), `${source(name)}${body.trim()}\n`);
}
fs.writeFileSync(new URL('eyeleng-ports.json', directory), `${JSON.stringify({
  source: 'https://github.com/eyereasoner/eyeleng',
  revision,
  ports: Object.keys(ports).sort().map(name => ({
    source: `${name}.srl`,
    port: `${name}.eye`,
    ...(expectedErrors[name] ? { expectedError: expectedErrors[name] } : {}),
  })),
}, null, 2)}\n`);

console.log(`Updated ${Object.keys(ports).length - existingPorts.size} new Eyeleng example ports; preserved ${existingPorts.size} existing ports.`);
