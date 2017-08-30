% Christian Wiemer Homework 6

% trees are a real struggle and I don't think I have a grasp of them

% Exercise 1
substitute(X,Y,[X],[Y]).
substitute(X,Y,[_|List1], [_|List2]) :-
  substitute(X,Y, [X|List1], [Y|List2]).

substitute(X,Y,[_|List1], [_|List2]) :-
  substitute(X,Y,[_|List1],[_|List2]).

  % base case is the issue here

% Exercise 2
sublist(List1,List2) :-
  append(Front,_,List2),
  append(_,List1,Front).

% If two items in a list are adjacent to eachother, they are therefore a sublist of the list
% Thus, our sublist definition whichs asks for sublists provides the same answer as asking for adjacent elements

adjacent(X,Y,[X,Y]).
adjacent(X,Y,List) :-
  sublist([X,Y],List).

% Exercise 3
% This binary_tree code is taken from our lectures. 
binary_tree(void).
binary_tree(tree(_,Left,Right)) :-
  binary_tree(Left),
  binary_tree(Right).

swap(binary_tree(void),binary_tree(void)).
swap(binary_tree(tree(_,L1,R1)),binary_tree(tree(_,L2,R2)) :-
  swap(binary_tree(L1),binary_tree(L2)),
  swap(binary_tree(R1),binary_tree(R2)).

% Exercise 4
subTree(S,T).
% Yeah I'm gonna opt out of this one I don't have a clue here.

% Exercise 5
path(X,_,[X]).
path(X,tree(_,L1,R1),Path) :-
  path(X,L1,[L1|Path]),
  path(X,R1,[R1|Path]).
