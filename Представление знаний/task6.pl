prints(First,Second):-format('| ~s~t~18|| ~s~t~11+|~n', [First, Second]).
printline(Size):-format('~45t~*+~n',[Size]).
printHeaderBorder:-printline(30).
header(First,Second):-prints(First,Second),printHeaderBorder.
printlist([]):-!.
printlist([H|T]):-writeln(H),printlist(T).

%t1%
name1(����).
name1(����).
name1(����).

pet1(������).
pet1(�����).
pet1(�����).


rule1(N,P):-
    name1(N),
    N = ����,
    pet1(P),
    not(P =  �����),
    not(P = �����).
rule1(N,P):-
    name1(N),
    N = ����,
    pet1(P),
    not( P = ����� ).
rule1(����,�����).

answer1(N1,P1,N2,P2,N3,P3):-
    N1 = ����, rule1(N1,P1),
    N2 = ����, rule1(N2,P2),
    N3 = ����, rule1(N3,P3),
    P1 \= P2,
    P2 \= P3,
    P1 \= P3.

pets:-
    answer1(N1,P1,N2,P2,N3,P3),
    header('��������','�������'),
    prints(N1,P1),
    prints(N2,P2),
    prints(N3,P3),
    !.





%t2%
left2(���,����).
left2(����,���).

answer2(X,Y,Z):-left2(X,Y),left2(Y,Z).

bench:-
    answer2(X,Y,Z),
    write('��������: '),
    write(X), write(', '),
    write(Y), write(', '),
    write(Z), write('. ').

%3%

neighbors(X,Y,List):-nextto(X,Y,List).
neighbors(X,Y,List):-nextto(Y,X,List).

einstein :-
   /* 0. ����� 5 ����� */
    Houses = [_,_,_,_,_],
   /* 1. �������� ���� � ������ ����. */
    nth1(1, Houses, [��������,_,_,_,_]),
   /* 2. ���������� ���� � ������� ����. */
    member([����������,_,_,_,�������], Houses),
   /* 3. ������ ��� ��������� ����� �� ������, ����� � ���. */
    nextto([_,_,_,_,�������], [_,_,_,_,�����], Houses),
   /* 4. �������� ���� ���. */
    member([��������,_,_,���,_], Houses),
   /* 5. ���, ��� ����� Marlboro, ���� ����� � ���, ��� ���������� �����. */
    neighbors([_,_,marlboro,_,_], [_,�����,_,_,_], Houses),
   /* 6. ���, ��� ���� � ����� ����, ����� Dunhill. */
    member([_,_,dunhill,_,������], Houses),
   /* 7. ����� ����� Rothmans. */
    member([�����,_,rothmans,_,_], Houses),
   /* 8. ���, ��� ���� � ������, ���� ������. */
    nth1(3, Houses, [_,_,_,������,_]),
   /* 9. ����� ����, ��� ����� Marlboro, ���� ����. */
    neighbors([_,_,marlboro,_,_], [_,_,_,����,_], Houses),
   /* 10. ���, ��� ����� Pall Mall, ���������� ����. */
    member([_,�����,pallmall,_,_], Houses),
   /* 11. ���� ���������� �����. */
    member([����,������,_,_,_], Houses),
   /* 12. �������� ���� ����� � ����� �����. */
    neighbors([��������,_,_,_,_], [_,_,_,_,�����], Houses),
   /* 13. ���, ��� ���������� �������, ���� � ����� ����. */
    member([_,������,_,_,�����], Houses),
   /* 14. ���, ��� ����� Winfield, ���� ����. */
    member([_,_,winfield,����,_], Houses),
   /* 15. � ������ ���� ���� ����. */
    member([_,_,_,����,�������], Houses),

   /* ��������, ������: � ���� ����? */
    member([Owner,����,_,_,_], Houses),

    /* �������� ������� */
    write('�������� ����: '), write(Owner), nl,
    writeln('��� ����: '), printlist(Houses),
    !.

%t6%
name6(����).
name6(����).
name6(����).
name6(�����).
name6(����).

veg6(�������).
veg6(�������).

countM([],R,R).
countM([�������|T],R,C):-countM(T,R,C).
countM([�������|T],R,C):-CN is C + 1, countM(T,R,CN).
countK([],R,R).
countK([�������| T],R,C):-countK(T,R,C).
countK([�������|T],R,C):-CN is C + 1,countK(T,R,CN).

vegetables:-
    N1 = ����, veg6(V1),
    N2 = ����, veg6(V2), V2 \= V1,
    N3 = ����, veg6(V3), V3 \= V2,
    N4 = �����, veg6(V4), V4 \= V3,
    N5 = ����, veg6(V5), V5 = V4,
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
    writeln('pets - ������� 5, ����� 1.'),
    writeln('bench - ������� 5, ����� 2.'),
    writeln('einstein - ������� 5, ����� 3.'),
    writeln('vegetables - ������� 6').
