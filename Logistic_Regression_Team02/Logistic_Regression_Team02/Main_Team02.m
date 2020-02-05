dataset = load('caesarian.txt')';

X = [dataset(1:5,:);dataset(1:5,:).^2];
X = [ones(1,size(X,2));X];
Y = dataset(6,:);

X_train = X(:,1:62);
Y_train = Y(1,1:62);

X_validation = X(:,63:76);
Y_validation = Y(1,63:76);

X_test = X(:,77:88);
Y_test = Y(1,77:88);

theta = ones(size(X,1), 1) * -1;

alpha = 0.0000003;
iterations = 250;

[theta, J_train, J_validation, J_test] = GradientDescent_team02(X_train, X_validation, X_test, Y_train, Y_validation, Y_test, theta, alpha, iterations);
figure('name','les Fonctions de coûts'); % titre de la figure cost Function
plot(1:iterations+1, J_train, 'b','LineWidth', 2);
hold on;
plot(1:iterations+1, J_validation,'r','LineWidth', 2);
hold on;
plot(1:iterations+1, J_test,'g','LineWidth', 2);
hold on;
legend('Coût apprentissage','Coût des tests','Coût de validation');
title('Fonctions des coûts'); 
xlabel('Nombre des itérations'); 
ylabel('Vecteur de coût'); 
precisionTrain = Precision(X_train, Y_train, theta)
precisionValidation = Precision(X_validation, Y_validation, theta)
precisionTest = Precision(X_test, Y_test, theta)
