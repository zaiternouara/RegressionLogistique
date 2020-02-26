function [theta, J_trainOut, J_validationOut, J_testOut] = GradientDescent_team02(X_train, X_validation, X_test, Y_train, Y_validation, Y_test, theta, alpha, iterations)
n = size(X_train, 1);
m = size(X_train, 2);

J_train = CostFunction_team02(X_train, Y_train, theta);
J_validation = CostFunction_team02(X_validation, Y_validation, theta);
J_test = CostFunction_team02(X_test, Y_test, theta);
for iter = 1:iterations
    for j = 1:n
        sum = 0;
        for i = 1:m
            sum = sum + (Hypothesis_team02(X_train, theta, i) - Y_train(1,i)) * X_train(j,i);
        end
        theta(j,1) = theta(j,1) - alpha * sum;
    end
    J_train = [J_train; CostFunction_team02(X_train, Y_train, theta)];
    J_validation = [J_validation; CostFunction_team02(X_validation, Y_validation, theta)];
    J_test = [J_test; CostFunction_team02(X_test, Y_test, theta)];
end
J_trainOut = J_train;
J_validationOut = J_validation;
J_testOut = J_test;
end

