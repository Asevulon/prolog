country(russia, 17125191).
country(canada, 9984670).
country(china, 9525067).
country(brazil, 8510346).
country(australia, 7741220).

river(amazon, 7100).
river(nil, 6670).
river(ob, 5410).
river(enisey, 5238).
river(lena, 5100).

lake(baykal, 1642).
lake(tanganika, 1470).
lake(vostok, 1200).
lake(kaspiyskoe_more, 1025).
lake(niasa, 706).

printss(First,Second):-format('| ~s~t~18|| ~s~t~11+|~n', [First, Second]).
printsd(First,Second):-format('| ~s~t~18|| ~d~t~11+|~n', [First, Second]).
printline(Size):-format('~45t~*+~n',[Size]).

printHeaderBorder:-printline(30).

countryHeader:-printss('Название', 'Площадь'),printHeaderBorder.
ctries:-country(N,S),printsd(N,S),fail.
ctries.
countries:-countryHeader,ctries.
countryN(CountryName):-country(CountryName,X),countryHeader,printsd(CountryName,X).
countryS(Square):-country(X,Square),countryHeader,printsd(X,Square).
ct(Min,Max):- Max > Min, country(X,Y),Y > Min, Y < Max,printsd(X,Y), fail.
countryT(Min,Max):-countryHeader, not(ct(Min,Max)).


riversHeader:-printss('Название','Длина'),printHeaderBorder.
rs:- river(N,S),printsd(N,S),fail.
rs.
rivers:-riversHeader, rs.
riverN(N):-river(N,S), riversHeader,printsd(N,S).
riverS(S):-river(N,S), riversHeader,printsd(N,S).
rt(Min,Max):-Max > Min,river(N,Y),Y > Min,Y<Max,printsd(N,Y), fail.
riverT(Min,Max):-riversHeader,not(rt(Min,Max)).


lakeHeader:-printss('Название','Глубина'),printHeaderBorder.
ls:-lake(N,S),printsd(N,S),fail.
ls.
lakes:-lakeHeader, ls.

lakeN(N):-lake(N,S),lakeHeader,printsd(N,S).
lakeS(S):-lake(N,S),lakeHeader,printsd(N,S).
lt(Min,Max):- Max > Min,lake(N,S), S > Min,S < Max, printsd(N,S), fail.
lakeT(Min,Max):-lakeHeader, not(lt(Min,Max)).

print:-countries,nl, rivers,nl, lakes.



dir('C:\\Users\\asevu\\OneDrive\\Документы\\GitHub\\prolog\\Представление знаний\\output.txt').
defaultdir('output.txt').

printF:-dir(Dir),tell(Dir),print,told.

countriesF:-dir(Dir),tell(Dir),countries,told.
countryNF(N):-dir(Dir),tell(Dir),countryN(N),told.
countrySF(S):-dir(Dir),tell(Dir),countryS(S),told.
countryTF(Min,Max):-dir(Dir),tell(Dir),countryT(Min,Max),told.

riversF:-dir(Dir),tell(Dir),rivers,told.
riverNF(N):-dir(Dir),tell(Dir),riverN(N),told.
riverSF(S):-dir(Dir),tell(Dir),riverS(S),told.
riverTF(Min,Max):-dir(Dir),tell(Dir),riverT(Min,Max),told.

lakesF:-dir(Dir),tell(Dir),lakes,told.
lakeNF(N):-dir(Dir),tell(Dir),lakeN(N),told.
lakeSF(S):-dir(Dir),tell(Dir),lakeS(S),told.
lakeTF(Min,Max):-dir(Dir),tell(Dir),lakeT(Min,Max),told.
