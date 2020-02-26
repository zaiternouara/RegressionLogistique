clear ; close all; clc;
Donnee = load('caesarian.txt');


% 70% Pour l'apprentissage des features
X = Donnee(1:54, [1:5]);
Y = Donnee(1:54, 6);

%15% pour le test
XTest = Donnee(55:66, [1:5]);
YTest = Donnee(55:66, 6);
%15% pour la validation
XValidation = Donnee(67:78, [1:5]);
YValidation = Donnee(67:78, 6);
% m =Taille de tuples x et n = Nombre de colonnes 
m = size(X, 1);
n = size(X, 2);



lambda = 0.009;


X=[ones(m,1) X];
theta_initial = zeros(n+1,1);

[theta ,cost] = EquationNormale(X,Y,lambda,n) ;
  

  

  l = ['Cost ',num2str(cost),'.'];
  disp(l);
figure('name','les Fonction de coût'); % titre de la figure cost Function
plot(cost, 'r*'); % plot de cost 

legend('Coût apprentissage')
title('Fonction de coût'); 
ylabel('Vecteur de coût'); 

  
  
  
Precisionn=PrecisionForNE(X, Y, theta);
display(['La precision apprentissage  = ', num2str(Precisionn),' %.']);

XTest=[ones(size(XTest,1),1) XTest];
PrecisionTest=PrecisionForNE(XTest, YTest, theta);
display(['La precision des tests = ', num2str(PrecisionTest),' %.']);

XValidation=[ones(size(XValidation,1),1) XValidation];
PrecisionValidation=PrecisionForNE(XValidation, YValidation, theta);
display(['La precision de Validation = ', num2str(PrecisionValidation),' %.']);







