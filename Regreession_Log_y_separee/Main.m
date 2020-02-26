clear ;
close all ;
clc ;

Donnee = load('caesarian.txt');
X = Donnee(1:54, [1:5]);
Y = Donnee(1:54, 6);

%15% pour le test
XTest = Donnee(55:66, [1:5]);
YTest = Donnee(55:66, 6);
%15% pour la validation
XValidation = Donnee(67:78, [1:5]);
YValidation = Donnee(67:78, 6);

[a,b] = size(X); % a = nombre de lignes de x et b = nombre de colones

X=[ones(a,1) X];
u = size(XValidation, 1);
XValidation=[ones(u,1) XValidation];
v = size(XTest, 1);
XTest=[ones(v,1) XTest];


NbIteration = 6000;
alpha = 0.01;

lambda = 0.009;
vect_cost=zeros(NbIteration,1);
VecteurTest=zeros(NbIteration,1);
VecteurValidation=zeros(NbIteration,1);

apt = find(Y == 1); %des indexs ou y = 1
inapt = find(Y == 0); %des indexs ou y = 0 
theta = zeros(b+1 , 1); % Initialisation de theta par des zeros selon le nombre des features le + 1 est pour theta(0)


alpha = 0.01;

lambda = 0.009;


[theta ,vect_cost(:,1) , VecteurTest(:,1) ,VecteurValidation(:,1) ] = GradientDescent(X, Y, theta, alpha, NbIteration,lambda, XTest , YTest , XValidation , YValidation);
display(theta);
display(vect_cost);



aptt = X(apt ,:); % le collect des lignes de x ou y = 1
inaptt = X(inapt,:); % le collect des lignes de x ou y = 0

AptH = sort(Hypothesis_Sigmoid(aptt * theta)); % calcule de hypothes pour y = 1 et l'ordonner
InpatH = sort(Hypothesis_Sigmoid(inaptt *theta)); % calcule de hypothes pour y = 0 et l'ordonner





% les plots

figure('name','Fonctions de coût'); % titre de la figure 1
plot(InpatH, -log(1-InpatH),'LineWidth', 2); % plot de cost en fonction de h
hold on 
title('Fonction du coût (y = 0)'); % titre du plot 1
xlabel('H(x)'); % label des X
ylabel('-log(1-h)'); % label des Y
legend('Fonction du coût (y = 0)');

figure('name','Fonction de coût'); % titre de la figure 1
plot(AptH, -log(AptH),'r','LineWidth', 2); % plot de cost en fonction de h
hold on 
title('Fonction du coût  (y = 1)'); % titre du plot 2
xlabel('H(x)'); % label des X
ylabel('-log(h)'); % label des Y
legend('Fonction du coût (y = 1)');

%La precision de l'apprentissage
Precisionn=Precision(X, Y, theta);
display(['La precision apprentissage= ', num2str(Precisionn),' % .']);
 

%La precision de tests
PrecisionTest=Precision(XTest, YTest, theta);
display(['La precision des tests = ', num2str(PrecisionTest),' % .']);


%La precision de validation
PrecisionValidation=Precision(XValidation, YValidation, theta);
display(['La precision de validation = ', num2str(PrecisionValidation),' % .']);
