clear ; close all; clc;
Donnee = load('caesarian.txt');

% 70% Pour l'apprentissage et 30% pour le test
% 70% Pour l'apprentissage des features
X = Donnee(1:54, [1:5]);
Y = Donnee(1:54, 6);

%15% pour le test
XTest = Donnee(56:66, [1:5]);
YTest = Donnee(56:66, 6);
%15% pour la validation
XValidation = Donnee(67:78, [1:5]);
YValidation = Donnee(67:78, 6);
% m =Taille de tuples x et n = Nombre de colonnes 
m = size(X, 1);
n = size(X, 2);
labels = size(unique(Y),1);%nombre de classes cad 2
all_theta = zeros(labels, n + 1);



NbIteration = 1000;

lambda = 0.002;


X=[ones(m,1) X];
theta_initial = zeros(n+1,1);

vecteur=zeros(NbIteration,labels);

 
  for c = 1 :labels
    
	  [theta ,vecteur(:,c)] = EquationNormale(X,Y,lambda,n,NbIteration) ;
	  
       all_theta(c,:) = theta';
  end
  

  
  
  vect_cost = min(vecteur');
  vect_cost(:);
  k =min(vect_cost);
  
  l = ['Cost ',num2str(k),'.'];
  disp(l);
  
figure('name','Cost function'); % titre de la figure cost Function
plot(1:NbIteration,vect_cost,'LineWidth', 2); % plot de cost 
hold on 
title('Cost Fuction'); 
xlabel('Nombre iteration'); 
ylabel('Vecteur de cost'); 

Precisionn=Precision(X, Y, all_theta);
display(['La precision  = ', num2str(Precisionn),' %.']);

XValidation=[ones(size(XValidation,1),1) XValidation];
PrecisionValidation=Precision(XValidation, YValidation, all_theta);
display(['La precision de Validation = ', num2str(PrecisionValidation),' %.']);

XTest=[ones(size(XTest,1),1) XTest];
PrecisionTest=Precision(XTest, YTest, all_theta);
display(['La precision de tests = ', num2str(PrecisionTest),' %.']);





