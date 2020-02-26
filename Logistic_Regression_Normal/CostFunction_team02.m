function J = CostFunction_team02(X, Y, theta)
m = size(X,2);
sum = 0;
for i = 1:m
    sum = Y(1,i) * log(Hypothesis_team02(X, theta, i)) + (1 - Y(1,i)) * log(Hypothesis_team02(X, theta, i));
end
J = -sum / m;
end

