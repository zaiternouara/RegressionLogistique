function hyp = Sigmoid(x)
    n =size(x,2) ;  
       for i=1:n
            hyp(1,i)=1/(1+exp(-x(1,i)));
        end
end
