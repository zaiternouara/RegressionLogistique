clear ; close all; clc;
Donnee = load('caesarian.txt');


% 70% Pour l'apprentissage et 30% pour le test
X = Donnee(1:55, [1:5]);
Y = Donnee([1:55], 6);
display (X);
X = [ones(size(X,1),1), X ];
display (X);
vec= zeros(5,1);

display (vec);