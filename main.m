
clear ; close all; clc;

Donnee = load('caesarian.txt');
X = Donnee(1:78, [1:5]);
Y = Donnee(1:78, 6);



%Normalisation des données
    for j=1:78 %Nombre d'échantillon à parcourir
        X(j,1)= (max(X(:,1))-X(j,1))/(max(X(:,1))-min(X(:,1)));
        X(j,2)= (max(X(:,2))-X(j,2))/(max(X(:,2))-min(X(:,2)));
        X(j,3)= (max(X(:,3))-X(j,3))/(max(X(:,3))-min(X(:,3)));
        X(j,4)= (max(X(:,4))-X(j,4))/(max(X(:,4))-min(X(:,4)));
        X(j,5)= (max(X(:,5))-X(j,5))/(max(X(:,5))-min(X(:,5)));
    end

% 70% Pour l'apprentissage des features
Xapprentissage = X(1:54, [1:5]);
Yapprentissage = Donnee(1:54, 6);
%15% pour le test
XTest = X(55:66, [1:5]);
YTest = Donnee(55:66, 6);
%15% pour la validation
XValidation = X(67:78, [1:5]);
YValidation = Donnee(67:78, 6);
nb_output=1;

nb_noeud=6;
couche1 = rand(1,nb_noeud); %tableau de la couche caché

poids1= rand(size(X,2),nb_noeud); %generer aleatoirement le tableau des poids de la premiere couche
poids2 = rand(nb_noeud,nb_output); %generer aleatoirement le tableau des poifs de la 2eme couche
cost=[];
nbrIteration = 100; 
%entrainement
for i=1:nbrIteration %nombre iterration
  erreur =[];%pour chaque instance du dataset
        for j=1:size(X,1)-22 %nombre dechantillon a parcourir 
          [couche1,output]= FeedForward(X(j,:),poids1,poids2); %caclule du output 'hypothese' avec les poid en entrer vd : Calcul de la sortie prévue ?
          
          erreur= [erreur; (Y(j)-output).^2];%fonction d'erreur
          
    
          [poids1,poids2]=BackPropagation(X(j,:),couche1,poids1,poids2,Y(j,:),output); %Mise à jour les poids en fonctions du output trouvÃ© vd : Mise à jour des poids et des biais
          

        end
cost=[cost;sum(erreur)]; %La somme de toutes les erreurs pour une interaction

end

cost=cost/(size(X,1)*2);%La moyenne de toutes les erreurs

k =min(cost(end:end));
l = ['Cost ',num2str(k),'.'];
disp(l);




figure('name','les Fonctions de coûts'); % titre de la figure cost Function
plot(cost(:,1), 'g','LineWidth', 2 );
legend('Coût apprentissage');
title('Fonction des coût'); 
xlabel('Nombre des itérations'); 
ylabel('Vecteur de coût'); 

PlotResultat(X,Y,poids1,poids2);



%La precision de l'apprentissage
Precisionn=Precision(Xapprentissage, Yapprentissage,couche1);
display(['La precision apprentissage= ', num2str(Precisionn),' % .']);
 %fprintf('Précision apprentissag: %f \n', Precisionn);


%La precision de tests
o=Precision(XTest, YTest,couche1);
display(['La precision des tests = ', num2str(o),' % .']);

%La precision de validation
PrecisionValidation=Precision(XValidation, YValidation,couche1);
display(['La precision de validation = ', num2str(PrecisionValidation),' % .']);



