function [poids21,poids22] = BackPropagation(Input,couche1,poids1,poids2,y,Output)
    
    d_poids1=Input'*(((2*(y(1,:)-Output).*SigmoidDerive(Output))*poids2').*SigmoidDerive(couche1)); 
    d_poids2=couche1'*(2*(y(1,:)-Output).*SigmoidDerive(Output))  ;
    
    Alpha = 0.4;
    poids22=poids2+d_poids2*Alpha;%Alpha 
    poids21=poids1+d_poids1*Alpha;
end
