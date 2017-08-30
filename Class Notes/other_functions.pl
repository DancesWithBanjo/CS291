% Cut (!) tells prolog to not consider something when backtracking
% Allows program to run faster and even use less memory

\+P :- call(P),!,fail.
\+P.

% if call(P) succeeds, we get to the cut and then fail, so \+P fails
% Otherwise it succeeds (by second rule)

is_integer(0).
is_integer(X) :-
  is_integer(Y),
  X is Y + 1.

% Once this finds the solution, it will keep going and going
% The cut (!) stops it once the inequalities are satisfied.
divide(N1,N2,Result) :-
  is_integer(Result),
  Product1 is Result * N2,
  Product2 is (Result + 1) *N2,
  Product1 =< N1, Product2 > N1,
  !.
