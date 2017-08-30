% Christian Wiemer

% Exercise 1

% 1. X = 3*4
% 2. X = 12
% 3. Args not sufficiently instantiated
% 4. X = Y
% 5. true
% 6. true
% 7. Args not sufficiently instantiated
% 8. X = 3
% 9. false (curious)
% 10. X = 3
% 11. true
% 12. true
% 13. true
% 14. false
% 15. false

% Exercise 2

mathmaze([H1,H2,H3,H4,H5,H6,H7,H8,H9]) :-
  permutation([1,2,3,4,5,6,7,8,9], [H1,H2,H3,H4,H5,H6,H7,H8,H9]),
  66 is 13 + H1 * H2 / H3 + H4 + 12 * H5 - H6 - 11 + H7 * H8 / H9 - 10.



% Exercise 3

double([],[]).
double([H|T1], [H,H|T2]) :-
  double(T1,T2).

% Exercise 4

orderedTriples([],[],[],[]).
orderedTriples([H1|T1],[H2|T2],[H3|T3],X) :-
  sort([H1,H2,H3],S),
  X = [S|A],
  orderedTriples(T1,T2,T3,A).

% Exercise 5

no_doubles([],[]).
no_doubles([H1|T1], X) :-
  delete([H1|T1],H1,T2),
  X = [H1|A],
  no_doubles(T2,A).
