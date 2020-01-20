function  [theta ,vect_cost]  = EquationNormale(X,Y,lambda,n,NbIteration)

Mat= eye(n);
t=zeros(n,1);
Matt=horzcat(t,Mat);

Matt = [zeros(1,n+1) ; Matt];

 


 
  for i = 1 : NbIteration
      
    theta = inv(X'*X + lambda.*Matt )*(X'*Y);
    
    vect_cost(i,1) = Cost(X, Y , theta,lambda) ;
    
  end



end