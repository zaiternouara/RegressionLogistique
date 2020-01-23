function  [theta ,cost]  = EquationNormale(X,Y,lambda,n)

Mat= eye(n);%renvoie une matrice d'identité n par n avec des éléments sur la diagonale principale et par des zéros le rest.
t=zeros(n,1);%Matrice initialisé par zéro tel que le nombre n de ligne et avec une seul colonne
Matt=horzcat(t,Mat);%Concaténer deux vecteur

Matt = [zeros(1,n+1) ; Matt];

theta = inv(X'*X + lambda.*Matt )*(X'*Y);
cost = Cost(X, Y , theta,lambda) ;



end