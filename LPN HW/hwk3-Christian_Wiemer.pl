% Christian Wiemer
% Exercise 1
word(astante, a,s,t,a,n,t,e).
word(astoria, a,s,t,o,r,i,a).
word(baratto, b,a,r,a,t,t,o,).
word(cobalto, c,o,b,a,l,t,o).
word(pistola, p,i,s,t,o,l,a).
word(statale, s,t,a,t,a,l,e).

crossword(A,B,C,D,E,F) :-
  word(A, a,s,t,a,n,t,e),
  word(B, c,o,b,a,l,t,o),
  word(C, p,i,s,t,o,l,a),
  word(D, a,s,t,o,r,i,a),
  word(E, b,a,r,a,t,t,o),
  word(F, s,t,a,t,a,l,e).

% Exercise 2

object(clip).
object(scissors).
object(clock).
object(rocket).
object(guitar).
object(phone).

adjacent_left(clip,scissors).
adjacent_left(clock,rocket).
adjacent_left(rocket,guitar).
adjacent_left(guitar,phone).

on_top_of(clip,clock).
on_top_of(scissors,guitar).

adjacent_right(X,Y) :-
  adjacent_left(Y,X).

underneath(X,Y) :-
  on_top_of(Y,X).

right_of(X,Y) :-
  adjacent_right(X,Y).

right_of(X,Y) :-
  adjacent_right(X,A),
  right_of(A,X).

left_of(X,Y) :-
  adjacent_left(X,Y).

left_of(X,Y) :-
  adjacent_left(X,A),
  left_of(A,Y).
% For some reason this gives the items out of order
% left_of(X,phone) gives:
% guitar, phone, rocket. In that order. Not sure why.
% Yet left_of(X, guitar) yields rocket...
% This is the only rule like this.

above(X,Y) :-
  on_top_of(X,Y).

above(X,Y) :-
  on_top_of(X,A),
  above(A,Y).

below(X,Y) :-
  underneath(X,Y).

below(X,Y) :-
  underneath(X,A),
  below(A,Y).

% Exercise 3
natural_number(0).
natural_number(s(X)):-
  natural_number(X).

plus(0, X, X) :- natural_number(X).
plus(s(X), Y, s(Z)) :-
  plus(X, Y, Z).

times(0, _, 0).
times(s(X), Y, Product) :-
  plus(Previous, Y, Product),
  times(Y, X, Previous).

factorial(0,s(0)).
factorial(s(X), Y) :-
  factorial(X,A),
  times(A,s(X),Y).
  %IT WORKS!!!!
