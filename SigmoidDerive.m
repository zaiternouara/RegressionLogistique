function [HypDev] = SigmoidDerive(x)
  n = size(x,2);
  for i=1:n
    HypDev(1,i)=exp(-x(1,i))/((1+exp(-x(1,i)))^2);
  end
  
 
end
