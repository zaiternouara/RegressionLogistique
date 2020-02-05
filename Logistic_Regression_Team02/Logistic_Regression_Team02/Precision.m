function preci = Precision(X, Y, theta)
z=[];
for i = 1:size(X,2);
    z = [z,round(Hypothesis_team02(X, theta, i))];
end

right = 0;
for i = 1:size(z,2)
    if(Y(1,i)==z(1,i))
        right = right +1;
    end
end
preci = right / size(Y,2) * 100;
end