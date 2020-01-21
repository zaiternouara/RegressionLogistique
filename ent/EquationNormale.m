function  [theta ,vect_cost]  = EquationNormale(X,Y,lambda,n,NbIteration)

Mat= eye(n);%renvoie une matrice d'identit� n par n avec des �l�ments sur la diagonale principale et par des z�ros le rest.
t=zeros(n,1);%Matrice initialis� par z�ro tel que le nombre n de ligne et avec une seul colonne
Matt=horzcat(t,Mat);%Concat�ner deux vecteur

Matt = [zeros(1,n+1) ; Matt];

 


 
  for i = 1 : NbIteration
     %La formule de l'equation Normale 
    theta = inv(X'*X + lambda.*Matt )*(X'*Y);
    
    vect_cost(i,1) = Cost(X, Y , theta,lambda) ;
    
  end



end