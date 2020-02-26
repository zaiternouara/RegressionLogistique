function H = Hypothesis_team02(X, theta, i)
z = theta' * X(:,i);
H = 1 ./ (1 + exp(-z));
end

