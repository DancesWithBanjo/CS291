% Christian Wiemer
% Exercise 1

% green states
state(a,green).
state(f,green).
state(g,green).
state(h,green).
state(e,green).
state(j,green).

% red states
state(c,red).
state(b,red).
state(d,red).
state(i,red).
state(k,red).

% transitions trans(X,Y,Col). transition from X to Y.
% green transitions
trans(a,c,green).
trans(a,f,green).
trans(a,d,green).
trans(b,d,green).
trans(d,f,green).
trans(e,i,green).
trans(f,g,green).
trans(g,h,green).
trans(h,j,green).

% red transitions
trans(b,d,red).
trans(d,e,red).
trans(d,f,red).
trans(d,i,red).
trans(f,h,red).
trans(g,j,red).
trans(h,i,red).
trans(h,k,red).
trans(i,k,red).

% start and end states
top(a).
top(b).

end(j).
end(k).

% Red

red_help([X,Y]) :- end(Y), trans(X,Y,red).
red_help([H1,H2|List]) :-
  trans(H1,H2,red),
  red_help([H2|List]).

red_edge_sequence([H|List]) :-  top(H), red_help([H|List]).

% Alternate

% I'm so close I'm so close!
swap_color(green,red).
swap_color(red,green).

alt_help([X,Y]) :- end(Y),trans(_,X,C1),swap_color(C1,C2),trans(X,Y,C2).
alt_help([H1,H2|List]) :-
  state(H1,C1),
  swap_color(C1,C2),
  trans(H1,H2,C2),
  alt_help([H2|List]).

alternating_edge_sequence([H1,H2|List]) :- top(H1), state(H2,C1), swap_color(C1,C2),trans(H1,H2,C2), alt_help([H2|List]).

% Matching

match_help([X,Y]) :- end(Y), state(X,C), trans(X,Y,C).
match_help([H1,H2|List]) :-
  state(H1,C),
  trans(H1,H2,C),
  state(H2,C),
  match_help([H2|List]).

matching_edge_state_sequence([H1,H2|List]) :- top(H1), state(H2,C), trans(H1,H2,C), match_help([H2|List]).


% Given testing program
test :-
  write("Red edge sequences:"), nl,
  bagof(X, red_edge_sequence(X), Xs),
  writeOut(Xs), nl,
  write("Alternating edge sequences:"), nl,
  bagof(Y, alternating_edge_sequence(Y), Ys),
  writeOut(Ys), nl,
  write("Matching edge/state sequences:"), nl,
  bagof(Z, matching_edge_state_sequence(Z), Zs),
  writeOut(Zs), nl.

writeOut([]).
  writeOut([H|T]) :-
  write(H), nl,
  writeOut(T).
