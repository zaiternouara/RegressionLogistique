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


 
% m=Taille de tuples x et n = Nombre de colonnes 
m = size(X, 1);
n = size(X, 2);

alpha = 0.01;
NbIteration = 6000;
lambda = 0.009;


X=[ones(m,1) X];
u = size(XValidation, 1);
XValidation=[ones(u,1) XValidation];
v = size(XTest, 1);
XTest=[ones(v,1) XTest];

theta_initial = zeros(n+1,1);
vecteur=zeros(NbIteration,1);
VecteurTest=zeros(NbIteration,1);
VecteurValidation=zeros(NbIteration,1);

[theta ,vecteur(:,1) , VecteurTest(:,1) ,VecteurValidation(:,1) ] = GradientDescent(X, Y, theta_initial, alpha, NbIteration,lambda, XTest , YTest , XValidation , YValidation);



  

  k =min(vecteur(end:end));
  
  l = ['Cost ',num2str(k),'.'];
  disp(l);
 
 

 

figure('name','les Fonctions de coûts'); % titre de la figure cost Function
plot(1:NbIteration, vecteur, 'b','LineWidth', 2 ); % plot de cost 
hold on 
plot(1:NbIteration, VecteurTest,'r','LineWidth', 2 );
hold on
plot(1:NbIteration, VecteurValidation,'g','LineWidth', 2);
hold on
legend('Coût apprentissage','Coût des tests','Coût de validation');
title('Fonctions des coûts'); 
xlabel('Nombre des itérations'); 
ylabel('Vecteur de coût'); 

%La precision de l'apprentissage
Precisionn=Precision(X, Y, theta);
display(['La precision apprentissage= ', num2str(Precisionn),' % .']);
 

%La precision de tests
PrecisionTest=Precision(XTest, YTest, theta);
display(['La precision des tests = ', num2str(PrecisionTest),' % .']);


%La precision de validation
PrecisionValidation=Precision(XValidation, YValidation, theta);
display(['La precision de validation = ', num2str(PrecisionValidation),' % .']);



