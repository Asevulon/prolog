%%��������(�������, ��������)

parent(�����, ����).
parent(�����, ����).
parent(����, �����).
parent(�����, �����).
parent(����, ����).
parent(����, ����).
parent(���, ����).
parent(����, ����).
parent(����, ����).
parent(�����, ����).
parent(�����, ����).
parent(���, �����).
parent(����, �����).
parent(����, �����).
parent(����, ����).
parent(����, ����).
parent(�����, ����).
parent(����, ����).
parent(����, ����).
parent(����, ���).
parent(�����, ���).
parent(�����, ���).

male(����).
male(�����).
male(����).
male(�����).
male(����).
male(�����).
male(����).
male(����).

female(����).
female(����).
female(���).
female(����).
female(����).
female(����).
female(�����).

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

%����������
niece(A,B):- female(B),
    parent(B,X),(sister(X,A);brother(X,A)).
%���������
nephew(A,B):- male(B),
    parent(B,X),(sister(X,A);brother(X,A)).
%����
aunt(A,B):- female(B),
    (niece(B,A);nephew(B,A)).
%����
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
