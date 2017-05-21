queens(Qs,N):-
    incrementated_list(N,Rs),
    permutation(Rs,Cs),
    safe(Rs,Cs),
    pairs_keys_values(Qs,Cs,Rs).

chess(Qs,N) :- queens(Qs,N),
  pairs_keys_values(Qs,Cs,Rs),
  field(Cs,N).


incrementated_list(0,[]).
incrementated_list(Length, List) :-
List = [H|_],
H=1,
length(List,Length),
incrementated_list_(Length, List).
incrementated_list_(1, [_]).
incrementated_list_(Length, [F,S|T]):-S is F + 1,L is Length - 1,
incrementated_list_(L,[S|T]).


list(0,[]).
list(C,N,List):-
  List = [H|T],
  (C == 1 -> H is 1;H is 0),
  length(List,N),
  create_list(N,List,C).

create_list(0,[]).
create_list(Length,List):-
  length(List,Length).

field([],_).
field([C|Cs],N):-
  create_list(N,Ls),
  nth1(C,Ls,1),
  maplist(setzero,Ls),
  write(Ls),
  write("\n"),
  field(Cs,N).

setzero(0).
setzero(_).

maplist(_,[]).
maplist(Is, [H|T]):-call(Is,H),maplist(T).






safe([],[]).

safe([R1|RT],[C1|CT]):-
    safe(R1,C1,RT,CT),
    safe(RT,CT).

safe(_,_,[],[]).
safe(R1,C1,[R2|RT],[C2|CT]):-
    R1-R2=\=C1-C2 ,
    R1-R2=\=C2-C1 ,
    safe(R1,C1,RT,CT).
