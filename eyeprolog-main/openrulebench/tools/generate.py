#!/usr/bin/env python3
import argparse, random, shutil
from pathlib import Path

HEADER = """% OpenRuleBench -> EyeProlog portable benchmark\n% Generated deterministically by tools/generate.py.\n% See ../README.md for provenance and fidelity notes.\n\n"""

def write(path, text):
    path.write_text(HEADER + text, encoding='utf-8')

def pairs(count, domain, seed):
    rnd = random.Random(seed)
    vals = rnd.sample(range(domain * domain), count)
    return [(v // domain + 1, v % domain + 1) for v in vals]

def facts2(pred, ps):
    return ''.join(f"{pred}({a},{b}).\n" for a,b in ps)

def benchmark2(pred):
    return f"benchmark(Count) :- findall(pair(X,Y), {pred}(X,Y), Answers), length(Answers, Count).\n%% goal: benchmark(Count)\n"

def gen_join1(out, rows=10000, domain=1000):
    rules = """a(X,Y) :- b1(X,Z), b2(Z,Y).
b1(X,Y) :- c1(X,Z), c2(Z,Y).
b2(X,Y) :- c3(X,Z), c4(Z,Y).
c1(X,Y) :- d1(X,Z), d2(Z,Y).

benchmark_ff(Count) :- findall(pair(X,Y), a(X,Y), A), length(A, Count).
benchmark_bf(Count) :- findall(Y, a(1,Y), A), length(A, Count).
benchmark_fb(Count) :- findall(X, a(X,1), A), length(A, Count).
%% goal: benchmark_ff(Count)

"""
    data=''
    for i,p in enumerate(['c2','c3','c4','d1','d2']):
        data += facts2(p, pairs(rows, domain, 101+i))
    write(out/'join1.pl', rules+data)

def gen_joindup(out, rows=10000, domain=1000):
    s=[]
    for i in range(1,6):
        s += [
            f"a{i}(X,Y) :- b1_{i}(X,Z), b2_{i}(Z,Y).\n",
            f"b1_{i}(X,Y) :- c1_{i}(X,Z), c2(Z,Y).\n",
            f"b2_{i}(X,Y) :- c3(X,Z), c4(Z,Y).\n",
            f"c1_{i}(X,Y) :- d1(X,Z), d2(Z,Y).\n",
        ]
    for i in range(1,6):
        s.append(f"a(X,Y) :- a{i}(X,Y).\n")
    s.append("\nbenchmark(Count) :- findall(pair(X,Y), a(X,Y), A), length(A, Count).\n%% goal: benchmark(Count)\n\n")
    for i,p in enumerate(['c2','c3','c4','d1','d2']):
        s.append(facts2(p, pairs(rows, domain, 201+i)))
    write(out/'joindup.pl', ''.join(s))

def gen_join2(out):
    rules = """ra(A,B,C,D,E) :- p(A), p(B), p(C), p(D), p(E).
rb(A,B,C,D,E) :- p(A), p(B), p(C), p(D), p(E).
r(A,B,C,D,E) :- ra(A,B,C,D,E), rb(A,B,C,D,E).
q1(A) :- r(A,_,_,_,_).
q2(B) :- r(_,B,_,_,_).
q3(C) :- r(_,_,C,_,_).
q4(D) :- r(_,_,_,D,_).
q5(E) :- r(_,_,_,_,E).
benchmark(Count) :- findall(A, q1(A), Answers), length(Answers, Count).
%% goal: benchmark(Count)

"""
    data=''.join(f"p(a{i}).\n" for i in range(19))
    write(out/'join2.pl', rules+data)

def gen_tc(out, edges=50000, domain=1000):
    rules="""tc(X,Y) :- par(X,Y).
tc(X,Y) :- par(X,Z), tc(Z,Y).
benchmark(Count) :- findall(pair(X,Y), tc(X,Y), Answers), length(Answers, Count).
%% goal: benchmark(Count)

"""
    write(out/'tc.pl', rules+facts2('par', pairs(edges, domain, 301)))

def sg_data(total, domain, seed):
    half=total//2
    return facts2('par', pairs(half,domain,seed))+facts2('sib',pairs(total-half,domain,seed+1))

def gen_sg(out, total=6000, domain=1000):
    rules="""sg(X,Y) :- sib(X,Y).
sg(X,Y) :- par(X,Z), sg(Z,Z1), par(Y,Z1).
benchmark(Count) :- findall(pair(X,Y), sg(X,Y), Answers), length(Answers, Count).
%% goal: benchmark(Count)

"""
    write(out/'sg.pl',rules+sg_data(total,domain,401))

def gen_modsg(out,total=6000,domain=1000):
    rules="""tc(X,Y) :- par(X,Y).
tc(X,Y) :- par(X,Z), tc(Z,Y).
sg(X,Y) :- sib(X,Y).
sg(X,Y) :- par(X,Z), sg(Z,Z1), par(Y,Z1).
nonsg(X,Y) :- tc(X,Y).
nonsg(X,Y) :- tc(Y,X).
sg2(X,Y) :- sg(X,Y), \\+ nonsg(X,Y).
benchmark(Count) :- findall(pair(X,Y), sg2(X,Y), Answers), length(Answers, Count).
%% goal: benchmark(Count)

"""
    write(out/'modsg.pl',rules+sg_data(total,domain,501))

def gen_win(out,n=10000):
    rule="""win(X) :- move(X,Y), \\+ win(Y).
benchmark(Count) :- findall(X, win(X), Answers), length(Answers, Count).
%% goal: benchmark(Count)

"""
    tree=''.join(f"move({i},{2*i}).\nmove({i},{2*i+1}).\n" for i in range(1,n+1))
    cyc=''.join(f"move({i},{i+1}).\n" for i in range(1,n))+f"move({n},1).\n"
    write(out/'win_tree.pl', "% Locally stratified Win instance (scaled portable data).\n"+rule+tree)
    write(out/'win_cycle.pl', "% Non-locally-stratified Win instance; requires well-founded negation for ORB-equivalent semantics.\n"+rule+cyc)

def gen_magicset(out, edge_rows=24000, domain=1000):
    rules="""% Non-stratified after magic-set transformation; ORB semantics is well-founded negation.
fb(X) :- magicfb(X), d(X), \\+ ab(X), h(X,Y), ab(Y).
ab(X) :- magicab(X), g(X).
ab(X) :- magicab(X), b(X,Y), ab(Y).
magicab(Y) :- magicab(X), b(X,Y).
magicab(Y) :- magicfb(X), d(X), \\+ ab(X), h(X,Y).
magicab(X) :- magicfb(X), d(X).
benchmark(Count) :- findall(X, fb(X), Answers), length(Answers, Count).
%% goal: benchmark(Count)

magicfb(1).
"""
    unaries=''.join(f"d({i}).\n" for i in range(1,domain+1)) + ''.join(f"g({i}).\n" for i in range(1,domain+1,17))
    data=facts2('b',pairs(edge_rows,domain,601))+facts2('h',pairs(edge_rows,domain,602))
    write(out/'magicset.pl',rules+unaries+data)

def gen_dblp(out, pubs=20000):
    rules="""q(Id,T,A,Y,M) :- att(Id,title,T), att(Id,year,Y), att(Id,author,A), att(Id,month,M).
benchmark(Count) :- findall(row(Id,T,A,Y,M), q(Id,T,A,Y,M), Answers), length(Answers, Count).
%% goal: benchmark(Count)

"""
    s=[rules]
    for i in range(1,pubs+1):
        pid=f"pub{i}"
        s += [
            f"att({pid},title,title{i}).\n",
            f"att({pid},year,y{1990+i%35}).\n",
            f"att({pid},author,author{i%5000}).\n",
            f"att({pid},month,m{1+i%12}).\n",
            f"att({pid},venue,venue{i%300}).\n",
            f"att({pid},type,article).\n",
        ]
        if i % 3 == 0:
            s.append(f"att({pid},author,author{(i+733)%5000}).\n")
    write(out/'dblp.pl',''.join(s))

def gen_lubm(out, universities=10, departments=10, students=100, faculty=10, courses=10):
    rules="""query1(X) :- takesCourse(X,graduateCourse0), graduateStudent(X).
query2(X,Y,Z) :- graduateStudent(X), memberOf(X,Z), undergraduateDegreeFrom(X,Y), university(Y), department(Z), subOrganizationOf_0(Z,Y).
query9(X,Y,Z) :- advisor(X,Y), teacherOf(Y,Z), takesCourse(X,Z), student(X), faculty(Y), course(Z).
benchmark(Count) :- findall(X, query1(X), Answers), length(Answers, Count).
%% goal: benchmark(Count)

course(graduateCourse0).
"""
    s=[rules]
    for u in range(universities):
        un=f"u{u}"
        s.append(f"university({un}).\n")
        for d in range(departments):
            dep=f"dep{u}_{d}"
            s += [f"department({dep}).\n",f"subOrganizationOf_0({dep},{un}).\n"]
            fs=[]; cs=[]
            for f in range(faculty):
                fac=f"fac{u}_{d}_{f}"; fs.append(fac)
                s.append(f"faculty({fac}).\n")
            for c in range(courses):
                co=f"course{u}_{d}_{c}"; cs.append(co)
                s.append(f"course({co}).\n")
                s.append(f"teacherOf({fs[c%len(fs)]},{co}).\n")
            for j in range(students):
                st=f"stu{u}_{d}_{j}"; fac=fs[j%len(fs)]; co=cs[j%len(cs)]
                s += [f"graduateStudent({st}).\n",f"student({st}).\n",f"memberOf({st},{dep}).\n",
                      f"undergraduateDegreeFrom({st},u{(u+universities-1)%universities}).\n",
                      f"advisor({st},{fac}).\n",f"takesCourse({st},{co}).\n"]
                if j == 0:
                    s.append(f"takesCourse({st},graduateCourse0).\n")
    write(out/'lubm.pl',''.join(s))

def gen_wordnet(out, synsets=15000):
    rules="""% Structural WordNet 3.0 port: same predicate shape and recursive query kernels, synthetic lexicon data.
hypernyms(W1,W2) :- s(S1,_,W1,_,_,_), hypernym_synsets(S1,S2), s(S2,_,W2,_,_,_).
hypernym_synsets(S1,S2) :- hypernym(S1,S2).
hypernym_synsets(S1,S2) :- hypernym(S1,S3), hypernym_synsets(S3,S2).
hyponyms(W1,W2) :- hypernyms(W2,W1).
meronyms(W1,W2) :- s(S1,_,W1,_,_,_), meronym_synsets(S1,S2), s(S2,_,W2,_,_,_).
meronym_synsets(S1,S2) :- meronym(S1,S2).
meronym_synsets(S1,S2) :- meronym(S1,S3), meronym_synsets(S3,S2).
holonyms(W1,W2) :- meronyms(W2,W1).
troponyms(W1,W2) :- s(S1,_,W1,_,_,_), troponym_synsets(S1,S2), s(S2,_,W2,_,_,_).
troponym_synsets(S1,S2) :- troponym(S1,S2).
troponym_synsets(S1,S2) :- troponym(S1,S3), troponym_synsets(S3,S2).
same_synset(W1,W2) :- s(S,_,W1,_,_,_), s(S,_,W2,_,_,_), W1 \\= W2.
gloss(W,G) :- s(S,_,W,_,_,_), gloss_fact(S,G).
antonyms(W1,W2) :- s(S1,_,W1,_,_,_), antonym_synsets(S1,S2), s(S2,_,W2,_,_,_).
adjective_clusters(W1,W2) :- s(S1,_,W1,_,_,_), similar_synsets(S1,S2), s(S2,_,W2,_,_,_).
benchmark(Count) :- findall(pair(W1,W2), hypernyms(W1,W2), Answers), length(Answers, Count).
%% goal: benchmark(Count)

"""
    s=[rules]
    for i in range(1,synsets+1):
        sy=f"s{i}"
        s.append(f"s({sy},1,word{i}a,n,1,0).\n")
        s.append(f"s({sy},2,word{i}b,n,1,0).\n")
        s.append(f"gloss_fact({sy},gloss{i}).\n")
        if i>1: s.append(f"hypernym({sy},s{i//2}).\n")
        if i>10 and i%5==0: s.append(f"meronym({sy},s{i//5}).\n")
        if i>20 and i%23==0: s.append(f"troponym({sy},s{i//23}).\n")
        if i%97==0 and i+1<=synsets: s.append(f"antonym_synsets({sy},s{i+1}).\n")
        if i%31==0 and i+1<=synsets: s.append(f"similar_synsets({sy},s{i+1}).\n")
    write(out/'wordnet.pl',''.join(s))

def gen_mondial(out, countries=100, provinces=20, cities=10):
    rules="""% Structural Mondial port. OpenRuleBench uses compound terms such as prov(Y,X).
province_stat(P,Area,Population,City,CityPopulation) :-
    isa(prov(P,china),provi),
    att(prov(P,china),area,Area),
    att(prov(P,china),population,Population),
    located(City,prov(P,china)),
    att(City,population,CityPopulation).
benchmark(Count) :- findall(row(P,A,N,C,CN), province_stat(P,A,N,C,CN), Answers), length(Answers, Count).
%% goal: benchmark(Count)

"""
    s=[rules]
    for ci in range(countries):
        country='china' if ci==0 else f"country{ci}"
        s.append(f"isa({country},country).\n")
        for pi in range(provinces):
            p=f"p{ci}_{pi}"; term=f"prov({p},{country})"
            s += [f"isa({term},provi).\n",f"att({term},area,{1000+pi*17+ci}).\n",f"att({term},population,{100000+ci*1000+pi*100}).\n"]
            for cj in range(cities):
                city=f"city{ci}_{pi}_{cj}"
                s += [f"isa({city},city).\n",f"located({city},{term}).\n",f"att({city},population,{10000+cj*100+pi}).\n"]
    write(out/'mondial.pl',''.join(s))

def gen_wine(out):
    # Structural surrogate preserving the well-known OpenRuleBench shape:
    # 961 rules, 225 IDB predicates, 113 EDB predicates, 654 facts.
    preds=['wine']+[f"w{i:03d}" for i in range(1,225)]
    edbs=[f"e{i:03d}" for i in range(113)]
    rules=[]
    n=len(preds)
    for i,p in enumerate(preds):
        prev=preds[(i-1)%n]; nxt=preds[(i+1)%n]; alt=preds[(i+17)%n]
        e1=edbs[i%len(edbs)]; e2=edbs[(i*7+3)%len(edbs)]
        rules += [
            f"{p}(X) :- {prev}(X).\n",
            f"{p}(X) :- {nxt}(X).\n",
            f"{p}(X) :- {e1}(X,Y), {prev}(Y).\n",
            f"{p}(X) :- {alt}(Y), {e2}(Y,X).\n",
        ]
    for i in range(61):
        p=preds[i]; e=edbs[(i*11)%len(edbs)]
        rules.append(f"{p}(X) :- {e}(X,_).\n")
    assert len(rules)==961
    facts=[]
    total=0
    for i,e in enumerate(edbs):
        k=6 if i<89 else 5
        for j in range(k):
            a=(i*13+j)%400+1; b=(i*29+j*7+1)%400+1
            facts.append(f"{e}(item{a},item{b}).\n")
            total += 1
    assert total==654
    text="% Structural Wine surrogate: preserves 961-rule / 225-IDB / 113-EDB / 654-fact stress shape; not the historical OWL-to-rules program.\n"
    text += ''.join(rules)
    text += "\nbenchmark(Count) :- findall(X, wine(X), Answers), length(Answers, Count).\n%% goal: benchmark(Count)\n\n"
    text += ''.join(facts)
    write(out/'wine.pl',text)

def profile_values(name):
    if name=='smoke':
        return dict(join_rows=1000,join_domain=1000,tc_edges=1250,tc_domain=500,sg_total=500,sg_domain=500,win_n=1000,magic_edges=2000,dblp_pubs=2000,lubm_u=3,lubm_d=4,lubm_s=20,wordnet=2000,mondial_c=20,mondial_p=10,mondial_city=5)
    if name=='portable':
        # Tuned for cross-engine runs without multi-GB findall bags or million-answer closures.
        # Join density is lowered while preserving a non-trivial multi-join workload; TC/SG
        # preserve approximately the orb-small edge density at half the node domain.
        return dict(join_rows=3500,join_domain=1000,tc_edges=12500,tc_domain=500,sg_total=1500,sg_domain=500,win_n=5000,magic_edges=12000,dblp_pubs=15000,lubm_u=6,lubm_d=8,lubm_s=60,wordnet=10000,mondial_c=60,mondial_p=15,mondial_city=8)
    if name=='orb-small':
        return dict(join_rows=10000,join_domain=1000,tc_edges=50000,tc_domain=1000,sg_total=6000,sg_domain=1000,win_n=10000,magic_edges=24000,dblp_pubs=20000,lubm_u=10,lubm_d=10,lubm_s=100,wordnet=15000,mondial_c=100,mondial_p=20,mondial_city=10)
    raise ValueError(name)

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--profile',choices=['smoke','portable','orb-small'],default='portable')
    ap.add_argument('--output',type=Path,default=Path(__file__).resolve().parents[1]/'benchmarks')
    args=ap.parse_args(); v=profile_values(args.profile)
    out=args.output; shutil.rmtree(out,ignore_errors=True); out.mkdir(parents=True)
    gen_join1(out,v['join_rows'],v['join_domain']); gen_join2(out); gen_joindup(out,v['join_rows'],v['join_domain'])
    gen_lubm(out,v['lubm_u'],v['lubm_d'],v['lubm_s'])
    gen_mondial(out,v['mondial_c'],v['mondial_p'],v['mondial_city'])
    gen_dblp(out,v['dblp_pubs']); gen_tc(out,v['tc_edges'],v['tc_domain']); gen_sg(out,v['sg_total'],v['sg_domain'])
    gen_wordnet(out,v['wordnet']); gen_wine(out); gen_modsg(out,v['sg_total'],v['sg_domain'])
    gen_win(out,v['win_n']); gen_magicset(out,v['magic_edges'])
    print(f"generated {len(list(out.glob('*.pl')))} Prolog files in {out}")

if __name__=='__main__': main()
