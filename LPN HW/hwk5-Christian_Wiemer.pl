% Exercise 1

pie_eater(PieEater) :-
  intl_hobbyists(Street),
  member(house(PieEater, _,_,_,pie),Street).

intl_hobbyists(Street) :-
  Street = [H1,H2,H3,H4,H5],

  %Known constraints
  Nat1 = irish,
  H1 = house(Nat1, Col1, Mus1, Hob1, Food1),

  Col2 = yellow,
  H2 = house(Nat2, Col2, Mus2, Hob2, Food2),

  Mus3 = grunge,
  H3 = house(Nat3, Col3, Mus3, Hob3, Food3),

  Col4 = pink,
  H4 = house(Nat4, Col4, Mus4, Hob4, Food4),

  Col5 = orange,
  H5 = house(Nat5, Col5, Mus5, Hob5, Food5),

  %proximity
  left_of(H1,H2,[H1,H2|T]),
  left_of(house(irish,_,_,_,_),house(_,yellow,_,_,_), [house(irish,_,_,_,_),house(_,yellow,_,_,_)|T]),
  left_of(house(_,pink,_,_,_),house(_,orange,_,_,_), [house(_,pink,_,_,_),house(_,orange,_,_,_)|T]),
  next_to(house(_,_,_,train_spot,_),house(_,_,jazz,_,_), [house(_,_,_,train_spot,_),house(_,_,jazz,_,_)|T]),
  next_to(house(_,_,_,train_spot,_),house(_,_,_,_,pizza), [house(_,_,_,train_spot,_),house(_,_,_,_,pizza)|T]),

  %combo specification
  member(house(_,_,_,pachinko,beets),Street),
  member(house(_,_,hip_hip,glassblowing,_),Street),
  member(house(czech,purple,_,_,_),Street),
  member(house(american,_,_,_,tofu),Street),
  member(house(dutch,_,jpop,_,_),Street),
  member(house(_,pink,country,_,_),Street),
  member(house(_,green,_,embroidery,_),Street),
  member(house(japanese,_,_,gardening,_),Street),

  %permutations
  permutation([irish,czech,american,dutch,japanese],[Nat1,Nat2,Nat3,Nat4,Nat5]),
  permutation([yellow,pink,green,orange,purple],[Col1,Col2,Col3,Col4,Col5]),
  permutation([grunge,hip_hip,jpop,country,jazz],[Mus1,Mus2,Mus3,Mus4,Mus5]),
  permutation([embroidery,train_spot,pachinko,glassblowing,gardening],[Hob1,Hob2,Hob3,Hob4,Hob5]),
  permutation([donuts,pizza,beets,tofu,pie],[Food1,Food2,Food3,Food4,Food5]).


left_of(X,Y,[X,Y|_]).
left_of(X,Y,[_|Z]) :-
  left_of(X,Y,Z).

% just write right_of as left_of(Y,X,List)

next_to(X,Y, [X,Y|_]) :- left_of(X,Y, [X,Y|_]).
next_to(X,Y,[X,Y|_]) :- left_of(Y,X, [Y,X|_]).
