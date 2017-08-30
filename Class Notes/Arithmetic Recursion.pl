natural_number(0).

natural_number(s(X)) :-
  natural_number(X).
%  s(s(s(0))) = 3
%  Don't use arabic numberals!!!
%  s(0) = 1

%  This (completeness) is provable via proof by induction.

plus(0,X,X) :-
  natural_number(X).

plus(s(X), Y , s(Z)) :-
  plus(X,Y,Z).
%  Strip off successors until the base case is true
%  example call: plus(s(s(s(0))), s(s(0)), X).
%  3+2=5
%  2+2=4
%  1+2=3
%  0+2=2
%  X = s(s(s(s(s(0))))).
%  The storage variable for Y will not change asked what its value is.
%  Use trace to see how this all moves out

times(0, _, 0).
% _ means anything to avoid singleton variable problem
times(s(X), Y, Product) :-
  times(X, Y, Previous),
  plus(Previous, Y, Product).

equals(0,0).
equals(s(X),s(Y)) :-
  equals(X,Y).

even(0).
even(s(s(X))) :-
  even(X).

odd(s(0)).
odd(s(s(X))) :-
  odd(X).

% Arithmetic with actual numbers!!

% use is to assign number values to an variable
% everything after is must be instantiated!
% you can use variables but they must be instantiated
X is 1 + 2.
X is 1/2.
X is mod(7,3).
X is cos(pi).

subtractionPred1(X,Y,Z) :-
  Z is X-Y.

minusSignPred1(X,Y,Z) :-
  Z = X-Y.
  %minusSignPred(5,3,Out), write(Out), nl. returns true with 5-3
  %minusSignPred(marge,homer,Out), write(Out), nl. returns marge-homer
  % = just instantiats a variable to a values

test1() :- X is 7,
           X is 3+4+1.
  % the first is will set X to 7.
  % the second is will check if what's on the right of is is equal to X
