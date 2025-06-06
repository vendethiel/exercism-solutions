select([A|As],S) :-
    select(A,S,S1),
    select(As,S1).
select([],_). 

left_of(A,B,C) :-
    append(_,[A,B|_],C).

next_to(A,B,C) :-
    left_of(A,B,C);
    left_of(B,A,C).
 
zebra_water(ZebraOwner, WaterDrinker) :-  % color,nation,pet,drink,smokes       % #1
      HS =    [h(_,norwegian,_,_,_), _,   h(_,_,_,milk,_), _, _],               % #9, #10
      select( [h(red,englishman,_,_,_),   h(_,spaniard,dog,_,_),                % #2, #3
               h(_,ukrainian,_,tea,_),    h(_,japanese,_,_,parliaments) ], HS), % #5, #14
      select( [h(_,_,snail,_,oldgold),    h(yellow,_,_,_,kools),                % #7, #8
               h(_,_,_,orangejuice,luckystrike) ],                         HS), % #13
      left_of( h(ivory,_,_,_,_),          h(green,_,_,coffee,_),           HS), % #4, #6
      next_to( h(_,_,_,_,chersterfields), h(_,_,fox,_,_),                  HS), % #11
      next_to( h(_,_,_,_,kools),          h(_,_,horse, _,_),               HS), % #12
      next_to( h(_,norwegian,_,_,_),      h(blue,_,_,_,_),                 HS), % #15

      member(  h(_,ZebraOwner,zebra,_,_),   HS),
      member(  h(_,WaterDrinker,_,water,_), HS).

zebra_owner(Owner) :- zebra_water(Owner, _).
water_drinker(Drinker) :- zebra_water(_, Drinker).