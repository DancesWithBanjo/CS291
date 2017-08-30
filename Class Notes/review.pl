% Fails if lists are of different length.
sum_lists1([],[],[]).
sum_lists1([H1|T1], [H2|T2], [H3|T3]) :-
  H3 is H1 + H2,
  sum_lists1(T1,T2,T3).

sum_lists2([],List2,List2).
sum_lists2(List1,[],List1).
sum_lists2([H1|T1], [H2|T2], [H3|T3]) :-
  H3 is H1 + H2,
  sum_lists2(T1,T2,T3).

substitute(_,_, void,void).
substitute(X,Y,tree(X,L1,R1),tree(Y,L2,R2)) :-
  substitute(X,Y,L1,L2),
  substitute(X,Y,R1,R2).

substitute(X,Y,tree(N,L1,R1),tree(N,L2,R2)) :-
  N \= X,
  substitute(X,Y,L1,L2),
  substitute(X,Y,R1,R2).
