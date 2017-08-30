% Here's a simple list using two facts and a function.
% A variable can unify with a list as well as elements of a list
% don't need to specify length
X = [apple,banana, frozen(cherry)]

% Head/tail notation
% [Head|Tail]
% Head unifies with the first element of the list
% Tail unifies with the rest of the list
% This sets us up nicely for recursion!

[Head|Tail] = [a,b,c,d,e].
% Plugged into a console, this will give Head = a, Tail = the rest

% Here's a predicate that recognizes lists
list([]).
list([_|T]) :-
  list(T).

fruit(apple).
fruit(banana).
fruit(cherry).

fruitCombo(F1,F2,F3) :-
  fruit(F1),
  fruit(F2),
  fruit(F3).
  % This will show all combinations of fruit.

testFruitCombo() :-
  bagof(X, fruitCombo(X), Xs),
  writeLines(Xs), nl.
  % Results in a list of lists of possible combos in its entirety.

writeLines([]).
writeLines([H|T]) :-
  write(H), nl,
  writeLines([T]).

% rewriting member which checks if an element is in a list
member(X,[X|_]).   % Use underscore to avoid singular variable issue
member(X, [_|T]) :-  % Underscore was originally H, _ is more general
  member(X,T).

% Takes an element, a list, and instantiates its last arguments as a list
% which the first list with the element remove. (Basically it removes X)
select2(X,[X|T1],T1).
select2(X,[H|T1],[H|T2]) :-
  select2(X,T1,T2).

% Shows all possible permutations for a list
perm([],[]).
perm(List, [P|PTail]) :-
  select(P,List,Next),
  perm(Next, PTail).

same(X,X).
test(List) :-
  permutation([a,b,c,d], List),
  same(List, [_,_,_,a]).


sum_list([],0).
sum_list([H|T],Sum) :-
  sum_list(T,Sum2),
  Sum is H + Sum2.

prefix([],_).
prefix([X|Xs], [X|Ys]) :-
  prefix([Xs,Ys]).


suffix(List,List) :- list(List).
suffix(List,[_|List2]):-
  suffix(List,List2).

% Is a concatonation of the lists from left to rights
append([],Ys,Ys).
append([X|Xs], Ys, [Xs|Zs]) :-
  append(Xs,Ys,Zs).

sublist([],_).
sublist([List|T],List2):-
  sublist(T,List2),
  prefix(List,List2).

sublist2(List1,List2) :-
  prefix(List1,List3),
  suffix(List3,List2).

sublist3(List1,List2) :-
  append(Front,_,List2),
  append(_,List1,Front).
