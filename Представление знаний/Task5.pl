printline(Size):-format('~45t~*+~n',[Size]).
pl:-nl,printline(30),nl.
printtilda(Size):-format('~126t~*+~n',[Size]).
pt:-printtilda(20).
header(Title):-nl,pl,writeln(Title),pl.
source(List):-nl,pt,write('Источник: '),writeln(List),pt.
multisource(List):-nl,pt,msource(List),pt.
msource([]):-!.
msource([H|T]):-write('Источник: '),writeln(H),msource(T).

getlists(FIRST,SECOND):-
    header('1.1 Ввод списков'),
    writeln('Введите первый список, из него будут взяты нечетные элементы'),nl, read(FIRST),
    writeln('Введите второй список, из него будут взяты четные элементы'),nl, read(SECOND),
    header('1.2 Введенные списки'),
    write('Первый список (для нечетных): '),writeln(FIRST),
    write('Второй список (для четных): '),writeln(SECOND).



getnc(IN,RES):-
    mgetnc(IN,RES),
    header('2.1 Нечетные элементы'),
    write('Нечетные элементы первого списка: '),writeln(RES),
    source(IN).
mgetnc([],[]).
mgetnc([H],[H]):-!.
mgetnc([H,_|TAIL],[H|NewTAIL]):-mgetnc(TAIL,NewTAIL).



getc(IN,RES):-
    mgetc(IN,RES),
    header('2.2 Четные элементы'),
    write('Четные элементы второго списка: '),writeln(RES),
    source(IN).
mgetc([],[]).
mgetc([_],[]).
mgetc([_,H|T],[H|NT]):-mgetc(T,NT).


multiply(F,S,RES):-
    header('3. Умножение'),
    mmultiply(F,S,RES),
    write('Результат умножения: '), writeln(RES),
    multisource([F,S]).
mmultiply([],[],[]):-!.
mmultiply([H1|T1],[],[H1|RT]):-mmultiply(T1,[],RT).
mmultiply([],[H2|T2],[H2|RT]):-mmultiply([],T2,RT).
mmultiply([H1|T1],[H2|T2],[RH|RT]):-RH is H1 * H2, mmultiply(T1,T2,RT).



inv(S,R):-
    header('4. Инвертирование'),
    minv(S,R,[]),
    write('Инвертированный список'), writeln(R),
    source(S).
minv([],R, R):-!.
minv([H|T],R, Acc):-minv(T,R, [H|Acc]).



get_add_a(Targ,RES):-geta(A),adda(A,Targ,RES).
geta(RES):-
    nl,writeln('Введите А'), read(RES).
adda(A,Targ,RES):-
    header('5. Прибавить А к списку'),
    madda(Targ,RES,A),
    write('Список с прибавленным А: '),writeln(RES),
    multisource([Targ,A]).
madda([],[],_):-!.
madda([H|T],[RH|RT],A):-RH is H + A,madda(T,RT,A).


lmin(S,R):-
    header('6. Минимальное значение'),
    S = [H|T],
    mmin(T,R,H),
    write('Минималыеьное значение в списке: '), writeln(R),
    source(S).
mmin([],R,R):-!.
mmin([H|T],R ,Acc):-Temp is min(Acc,H),mmin(T,R,Temp).

start:-
    header('0. Начало'),
    getlists(FIRST,SECOND),
    getnc(FIRST,ODD),
    getc(SECOND,EVEN),
    multiply(ODD,EVEN, MP),
    inv(MP, IMP),
    get_add_a(IMP,IMPA),
    lmin(IMPA,_),
    header('7. Конец').



debugger:-mmin([2,3],RES, 1),writeln(RES).
