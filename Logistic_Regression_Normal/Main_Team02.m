dataset = load('caesarian.txt')';

X = dataset(1:5,:);
X = [ones(1,size(X,2));X];
Y = dataset(6,:);

X_train = X(:,1:62);
Y_train = Y(1,1:62);

X_test = X(:,63:76);
Y_test = Y(1,63:76);

X_validation = X(:,77:88);
Y_validation = Y(1,77:88);

theta = ones(size(X,1), 1) * -1;

alpha = 0.0001;
iterations = 40;

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
%La precision de l'apprentissage
Precisionn=Precision(X_train, Y_train, theta);
display(['La precision apprentissage= ', num2str(Precisionn),' % .']);
 

%La precision de tests
PrecisionTest=Precision(X_test, Y_test, theta);
display(['La precision des tests = ', num2str(PrecisionTest),' % .']);


%La precision de validation
PrecisionValidation=Precision(X_validation, Y_validation, theta);
display(['La precision de validation = ', num2str(PrecisionValidation),' % .']);
