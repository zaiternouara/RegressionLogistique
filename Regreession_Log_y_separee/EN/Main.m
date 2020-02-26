clear ;
close all ;
clc ;

Donnee = load('caesarian.txt');
X = Donnee(:, [1:5]);
Y = Donnee(:, 6);

m = size(X, 1);
n = size(X, 2); % m = nombre de lignes de x et n = nombre de colones
labels = size(unique(Y),1);
X=[ones(m,1) X];


apt = find(Y == 1); %des indexs ou y = 1
inapt = find(Y == 0); %des indexs ou y = 0 
theta = zeros(labels, n + 1); % Initialisation de theta par des zeros selon le nombre des features le + 1 est pour theta(0)



NbIteration = 1000;

lambda = 0.001;

vecteur=zeros(NbIteration,labels);
[theta ,vecteur_cost] = EquationNormale(X,Y,lambda,n);
display(theta);
display(vecteur_cost);



aptt = X(apt ,:); % le collect des lignes de x ou y = 1
inaptt = X(inapt,:); % le collect des lignes de x ou y = 0

AptH = sort(Hypothesis_Sigmoid(aptt * theta)); % calcule de hypothes pour y = 1 et l'ordonner
InpatH = sort(Hypothesis_Sigmoid(inaptt *theta)); % calcule de hypothes pour y = 0 et l'ordonner





% les plots
figure('name','Cost Fuction 1'); % titre de la figure 1
plot(InpatH, -log(1-InpatH),'LineWidth', 2); % plot de cost en fonction de h
hold on 
title('Cost Fuction (y = 0)'); % titre du plot 1
xlabel('H(x)'); % label des X
ylabel('-log(1-h)'); % label des Y

figure('name','cost function 2'); % titre de la figure 2
plot(AptH, -log(AptH),'LineWidth', 2); % plot de cost en fonction de h
hold on 
title('Cost Fuction (y = 1)'); % titre du plot 2
xlabel('H(x)'); % label des X
ylabel('-log(h)'); % label des Y



