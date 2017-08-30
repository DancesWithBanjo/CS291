%Christian Wiemer
%Family Tree Exercise

male(homer).
male(ward).
male(wally).
male(ted).
male(tim).
male(tom).

female(marge).
female(maggie).
female(lisa).
female(june).
female(jenny).
female(kate).
female(mary).

parent(marge,lisa).
parent(homer,lisa).
parent(marge,maggie).
parent(homer,maggie).
parent(lisa,jenny).
parent(lisa,kate).
parent(june,wally).
parent(june,ted).
parent(ward,wally).
parent(ward,ted).
parent(wally,jenny).
parent(wally,kate).
parent(ted,tim).
parent(ted,tom).
parent(mary,tom).
parent(mary,tim).

spouse(marge,homer).
spouse(homer,marge).
spouse(june,ward).
spouse(ward,june).
spouse(ted,mary).
spouse(mary,ted).
spouse(lisa,wally).
spouse(wally,lisa).

father(Dad, Child) :- parent(Dad, Child), male(Dad).
mother(Mom, Child) :- parent(Mom, Child), female(Mom).

sibling(Sibling1, Sibling2):-
  parent(Parent, Sibling1),
  parent(Parent, Sibling2),
  Sibling1 \= Sibling2.

brother(Brother, Sib) :-
  sibling(Brother, Sib),
  male(Brother).

sister(Sister, Sib) :-
  sibling(Sister, Sib),
  female(Sister).

mother_in_law(Mlaw, Person) :-
    spouse(Person,X),
    mother(Mlaw,X),
    female(Mlaw).

father_in_law(Flaw, Person) :-
    spouse(Person,X),
    father(Flaw,X),
    male(Flaw).

daughter_in_law(Dlaw, Person) :-
    parent(Person,X),
    spouse(X,Dlaw),
    female(Dlaw).

brother_in_law(Blaw, Person):-
    spouse(Person,X),
    sibling(X,Blaw),
    male(Blaw).
