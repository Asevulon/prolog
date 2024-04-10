prints(First,Second):-format('| ~s~t~18|| ~s~t~11+|~n', [First, Second]).
printline(Size):-format('~45t~*+~n',[Size]).
printHeaderBorder:-printline(30).
header(First,Second):-prints(First,Second),printHeaderBorder.
printlist([]):-!.
printlist([H|T]):-writeln(H),printlist(T).

%t1%
name1(петя).
name1(лена).
name1(таня).

pet1(собака).
pet1(кошка).
pet1(хомяк).


rule1(N,P):-
    name1(N),
    N = петя,
    pet1(P),
    not(P =  кошка),
    not(P = хомяк).
rule1(N,P):-
    name1(N),
    N = лена,
    pet1(P),
    not( P = кошка ).
rule1(таня,кошка).

answer1(N1,P1,N2,P2,N3,P3):-
    N1 = петя, rule1(N1,P1),
    N2 = лена, rule1(N2,P2),
    N3 = таня, rule1(N3,P3),
    P1 \= P2,
    P2 \= P3,
    P1 \= P3.

pets:-
    answer1(N1,P1,N2,P2,N3,P3),
    header('Владелец','Питомец'),
    prints(N1,P1),
    prints(N2,P2),
    prints(N3,P3),
    !.





%t2%
left2(юра,миша).
left2(витя,юра).

answer2(X,Y,Z):-left2(X,Y),left2(Y,Z).

bench:-
    answer2(X,Y,Z),
    write('Скамейка: '),
    write(X), write(', '),
    write(Y), write(', '),
    write(Z), write('. ').

%3%

neighbors(X,Y,List):-nextto(X,Y,List).
neighbors(X,Y,List):-nextto(Y,X,List).

einstein :-
   /* 0. Всего 5 домов */
    Houses = [_,_,_,_,_],
   /* 1. Норвежец живёт в первом доме. */
    nth1(1, Houses, [норвежец,_,_,_,_]),
   /* 2. Англичанин живёт в красном доме. */
    member([англичанин,_,_,_,красный], Houses),
   /* 3. Зелёный дом находится слева от белого, рядом с ним. */
    nextto([_,_,_,_,зеленый], [_,_,_,_,белый], Houses),
   /* 4. Датчанин пьёт чай. */
    member([датчанин,_,_,чай,_], Houses),
   /* 5. Тот, кто курит Marlboro, живёт рядом с тем, кто выращивает кошек. */
    neighbors([_,_,marlboro,_,_], [_,кошки,_,_,_], Houses),
   /* 6. Тот, кто живёт в жёлтом доме, курит Dunhill. */
    member([_,_,dunhill,_,желтый], Houses),
   /* 7. Немец курит Rothmans. */
    member([немец,_,rothmans,_,_], Houses),
   /* 8. Тот, кто живёт в центре, пьёт молоко. */
    nth1(3, Houses, [_,_,_,молоко,_]),
   /* 9. Сосед того, кто курит Marlboro, пьёт воду. */
    neighbors([_,_,marlboro,_,_], [_,_,_,вода,_], Houses),
   /* 10. Тот, кто курит Pall Mall, выращивает птиц. */
    member([_,птицы,pallmall,_,_], Houses),
   /* 11. Швед выращивает собак. */
    member([швед,собаки,_,_,_], Houses),
   /* 12. Норвежец живёт рядом с синим домом. */
    neighbors([норвежец,_,_,_,_], [_,_,_,_,синий], Houses),
   /* 13. Тот, кто выращивает лошадей, живёт в синем доме. */
    member([_,лошади,_,_,синий], Houses),
   /* 14. Тот, кто курит Winfield, пьет пиво. */
    member([_,_,winfield,пиво,_], Houses),
   /* 15. В зелёном доме пьют кофе. */
    member([_,_,_,кофе,зеленый], Houses),

   /* Внимание, вопрос: у кого рыба? */
    member([Owner,рыба,_,_,_], Houses),

    /* Печатаем решение */
    write('Владелец рыбы: '), write(Owner), nl,
    writeln('Все дома: '), printlist(Houses),
    !.

%t6%
name6(катя).
name6(егор).
name6(кира).
name6(захар).
name6(лера).

veg6(морковь).
veg6(капуста).

countM([],R,R).
countM([капуста|T],R,C):-countM(T,R,C).
countM([морковь|T],R,C):-CN is C + 1, countM(T,R,CN).
countK([],R,R).
countK([морковь| T],R,C):-countK(T,R,C).
countK([капуста|T],R,C):-CN is C + 1,countK(T,R,CN).

vegetables:-
    N1 = катя, veg6(V1),
    N2 = егор, veg6(V2), V2 \= V1,
    N3 = кира, veg6(V3), V3 \= V2,
    N4 = захар, veg6(V4), V4 \= V3,
    N5 = лера, veg6(V5), V5 = V4,
    Vegs = [V1,V2,V3,V4,V5],
    C is 0,
    countM(Vegs,M,C),
    M = 3,
    countK(Vegs,K,C),
    K = 2,
    Names = [N1,N2,N3,N4,N5],
    writeln(Names),
    writeln(Vegs),
    !.

mhelp:-
    writeln('pets - задание 5, пункт 1.'),
    writeln('bench - задание 5, пункт 2.'),
    writeln('einstein - задание 5, пункт 3.'),
    writeln('vegetables - задание 6').
