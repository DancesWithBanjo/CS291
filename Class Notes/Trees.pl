
% Calling it tree is arbitrary, not built in.
% A normal compound term.
% Leaves can be trees themselves to have ever growing trees.

% tree(Element,Left,Right).

binary_tree(void).
binary_tree(tree(Element,Left,Right)) :-  % Element should be _
  binary_tree(Left),
  binary_tree(Right).

tree_member(X, tree(X,_Left,_Right)).
tree_member(X, tree(_, Left, _Right)) :- tree_member(X, Left).
tree_member(X, tree(_, _Left, Right)) :- tree_member(X,Right).

%isotree(tree(X,Y,Z),tree(X,Y,Z)).
isotree(void,void).
isotree(tree(Node,L1,R1),tree(Node,L2,R2)) :-
  isotree(L1,L2),
  isotree(R1,R2).

isotree(tree(Node,L1,R1),tree(Node,L2,R2)) :-
  isotree(L1,R2),
  isotree(R1,L2).

test1 :- isotree(tree(a,tree(b,tree(d,void,void),tree(e,void,void)),tree(a,tree(c,void,void),tree(b,tree(d,void,void)))),X).
test2 :- isotree(tree(a,tree(b,void,void),tree(c,void,void)),_).
