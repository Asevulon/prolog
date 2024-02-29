%%родитель(ребенок, родитель)

parent(игорь, петя).
parent(игорь, маша).
parent(филя, игорь).
parent(степа, игорь).
parent(лена, петя).
parent(лена, маша).
parent(юля, лена).
parent(сеня, лена).
parent(катя, лена).
parent(денис, вова).
parent(денис, надя).
parent(юля, денис).
parent(сеня, денис).
parent(катя, денис).
parent(стас, вова).
parent(стас, надя).
parent(настя, стас).
parent(люба, вова).
parent(люба, надя).
parent(филя, оля).
parent(степа, оля).
parent(настя, аня).

male(петя).
male(игорь).
male(филя).
male(степа).
male(вова).
male(денис).
male(стас).
male(сеня).

female(маша).
female(лена).
female(юля).
female(катя).
female(надя).
female(люба).
female(настя).

mother(C, P):- female(P), parent(C,P).
father(C,P):- male(P), parent(C,P).

sister(A, B):- female(B),
    parent(A,Y), parent(B,Y), male(Y),
    parent(A,Z), parent(B,Z), female(Z),
    A\=B.
brother(A, B):- male(B),
    parent(A,Y), parent(B,Y), male(Y),
    parent(A,Z), parent(B,Z), female(Z),
    A\=B.

%племянница
niece(A,B):- female(B),
    parent(B,X),(sister(X,A);brother(X,A)).
%племянник
nephew(A,B):- male(B),
    parent(B,X),(sister(X,A);brother(X,A)).
%тетя
aunt(A,B):- female(B),
    (niece(B,A);nephew(B,A)).
%дядя
uncle(A,B):- male(B),
    (niece(B,A);nephew(B,A)).

granddaughter(A,B):- female(B),
    parent(B,X),parent(X,A).
grandson(A,B):- male(B),
    parent(B,X),parent(X,A).

grandmother(A,B):- female(B),
    (granddaughter(B,A);grandson(B,A)).
grandfather(A,B):- male(B),
    (granddaughter(B,A);grandson(B,A)).

cousinf(A,B):- female(B),
    parent(B,X),(aunt(A,X);uncle(A,X)).
cousinm(A,B):- male(B),
    parent(B,X),(aunt(A,X);uncle(A,X)).
