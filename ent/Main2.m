clear ; close all; clc;
Donnee = load('caesarian.txt');
Validation =load('Validation.txt');
% 70% Pour l'apprentissage et 30% pour le test
X = Donnee(1:55, [1:5]);
Y = Donnee(1:55, 6);
XTest = Donnee(56:78, [1:5]);
YTest = Donnee(56:78, 6);

 XValidation = Validation(1:17, [1:5]);
YValidation = Validation(1:17, 6);
% n =Taille de tuples x et m = Nombre de colonnes 
m = size(X, 1);
n = size(X, 2);
labels = size(unique(Y),1);%nombre de classes cad 2
all_theta = zeros(labels, n + 1);



NbIteration = 1000;

lambda = 0.001;


X=[ones(m,1) X];
theta_initial = zeros(n+1,1);

vecteur=zeros(NbIteration,labels);

 
  for c = 1 :labels
    
	  [theta ,vecteur(:,c)] = EquationNormale(X,Y,lambda,n,NbIteration) ;
	  
       all_theta(c,:) = theta';
  end
  

  
  
  vect_cost = min(vecteur');
  vect_cost(:);
 display(vect_cost);
 display(all_theta);
plot(1:NbIteration,vect_cost,'-b');  

PrecisionTest=Precision(XTest, YTest, all_theta);
PrecisionValidation=Precision(XValidation, YValidation, all_theta);
display(['La precision de tests = ', num2str(PrecisionTest),' %']);

display(['La precision de Validation = ', num2str(PrecisionValidation),' %']);


