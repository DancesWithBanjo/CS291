% Christian Wiemer
% Cameron Verinsky

% The dankest of code

color(red).
color(blue).

clicked(yes).
clicked(no).

change(yes,color(red),color(blue)).
change(yes,color(blue),color(red)).
change(no,color(red),color(red)).
change(no,color(blue),color(blue)).

click(red,blue).
click(blue,red).

bertsgame(0,[]).
bertsgame(Num,Sols) :-
  generate_board(Num,Board),
  generate_sols(Num, Sols),
  test_sols(Board,Sols).



%permutation()

% Make the good board
generate_board(1,[[color(blue)]]) .
generate_board(Num, Board) :-
  %Make a 2D array of blue, unclicked items based on Num.
  help_gen_board(Num,Num,Board).


help_gen_board(Rows,Cols,[[color(blue)|Tail1]|Tail2]):-
  Cols > 2,
  NextRow is Rows-1,
  help_gen_board(NextRow, 1, Tail1),
  NextCol is Cols-1,
  help_gen_board(Rows,NextCol,Tail2).

help_gen_board(Rows,2,[[color(blue)|Tail1]|[Tail2]]):-
  NextRow is Rows-1,
  help_gen_board(NextRow, 1, Tail1),
  help_gen_board(Rows,1,Tail2).

help_gen_board(1,1,[color(blue)]).

help_gen_board(Rows,1,[color(blue)|Tail]):-
  Rows > 1,
  Next is Rows-1,
  help_gen_board(Next,1,Tail).

% Make potential solutions
generate_sols(1,[clicked(no)]).
generate_sols(1,[clicked(yes)]).
generate_sols(Num,[clicked(no)|Tail]) :- %Sol is a list
  Num > 1,
  Next is Num -1,
  generate_sols(Next,Tail).
generate_sols(Num,[clicked(yes)|Tail]) :- %Sol is a list
  Num > 1,
  Next is Num -1,
  generate_sols(Next,Tail).
% Test those solutions

test_sols(Board, Sol) :-
  help_test(Board,Sol).

%Initiates the clicking
help_test(Board,Sol) :-
  click_help_start(Board,NewBoard,Sol),
  new_solns(NewBoard,NewSolns),
  next_row(NewBoard,NextNewBoard),
  help_test(NextNewBoard,NewSolns).

%Clicking for the last row
help_test([[X]|Tail],Sol) :-
  last_click_help_start([[X]|Tail],NewBoard,Sol),
  new_solns(NewBoard,NewSolns),
  last_check(NewSolns).

% Checks for last solutions
last_check([]).
last_check([clicked(no)|Tail]):-
  last_check(Tail).

next_row([[_|Tail]|Tail2],[Tail|Tail3]):-
  next_row(Tail2,Tail3).
next_row([],[]).


new_solns([],[]).
new_solns([[Color|_]|Tail],[clicked(Click)|Tail2]):-!,
  change(Click,Color,color(red)),
  new_solns(Tail,Tail2).
new_solns([[Color|_]],[clicked(Click)]):-
  change(Click,Color,color(red)).

%Bottom row, first case
last_click_help_start([[Curr],[Next]|Rest1],[[FinalCurr],[FinalNext]|Rest2], [clicked(IsClicked)|Tail]):-
    change(IsClicked,Curr,NewCurr),
    change(IsClicked,Next,NewNext),
    last_click_help([[NewCurr],[NewNext]|Rest1],[[FinalCurr],[FinalNext]|Rest2], Tail).
%Middle cases
last_click_help([[Prev],[Curr],[Next]|Rest1],[[NewPrev],[FinalCurr],[FinalNext]|Rest2], [clicked(IsClicked)|Tail]):-
    change(IsClicked,Prev,NewPrev),
    change(IsClicked,Curr,NewCurr),
    change(IsClicked,Next,NewNext),
    last_click_help([[NewCurr],[NewNext]|Rest1],[[FinalCurr],[FinalNext]|Rest2], Tail).
%2nd to last case
last_click_help([[Prev],[Curr],[Next]|Rest1],[[NewPrev],[FinalCurr],[FinalNext]|Rest2], [clicked(IsClicked),End]):-
    change(IsClicked,Prev,NewPrev),
    change(IsClicked,Curr,NewCurr),
    change(IsClicked,Next,NewNext),
    last_click_help_end([[NewCurr],[NewNext]|Rest1],[[FinalCurr],[FinalNext]|Rest2], End).
%(very) LastCase
last_click_help_end([[Prev],[Curr]],[[NewPrev],[NewCurr]], clicked(IsClicked)):-
    change(IsClicked,Prev,NewPrev),
    change(IsClicked,Curr,NewCurr).


%This covers every row until the last row which goes to last_click..
%First case (leftmost)
click_help_start([[Curr,Below|Y],[Next|Z1]|Rest1],[[FinalCurr,NewBelow|Y],[FinalNext|Z2]|Rest2], [clicked(IsClicked)|Tail]):-
    change(IsClicked,Curr,NewCurr),
    change(IsClicked,Below,NewBelow),
    change(IsClicked,Next,NewNext),
    click_help([[NewCurr,NewBelow|Y],[NewNext|Z1]|Rest1],[[FinalCurr,NewBelow|Y],[FinalNext|Z2]|Rest2], Tail).
%Middle cases
click_help([[Prev|_],[Curr,Below|Y],[Next|Z1]|Rest1],[[NewPrev|_],[FinalCurr,NewBelow|Y],[FinalNext|Z2]|Rest2], [clicked(IsClicked)|Tail]):-
    change(IsClicked,Prev,NewPrev),
    change(IsClicked,Curr,NewCurr),
    change(IsClicked,Below,NewBelow),
    change(IsClicked,Next,NewNext),
    click_help([[NewCurr,NewBelow|Y],[NewNext|Z1]|Rest1],[[FinalCurr,NewBelow|Y],[FinalNext|Z2]|Rest2], Tail).

%2nd to last case
click_help([[Prev|_],[Curr,Below|Y],[Next|Z1]|Rest1],[[NewPrev|_],[FinalCurr,NewBelow|Y],[FinalNext|Z2]|Rest2], [clicked(IsClicked),End]):-
    change(IsClicked,Prev,NewPrev),
    change(IsClicked,Curr,NewCurr),
    change(IsClicked,Below,NewBelow),
    change(IsClicked,Next,NewNext),
    click_help_end([[NewCurr,NewBelow|Y],[NewNext|Z1]|Rest1],[[FinalCurr,NewBelow|Y],[FinalNext|Z2]|Rest2], End).
%LastCase Right
click_help_end([[Prev|_],[Curr,Below|Y]],[[NewPrev|_],[NewCurr,NewBelow|Y]], clicked(IsClicked)):-
    change(IsClicked,Prev,NewPrev),
    change(IsClicked,Curr,NewCurr),
    change(IsClicked,Below,NewBelow).
