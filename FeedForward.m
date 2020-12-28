function [couche1,Output] = FeedForward (Input,poids1,poids2)
    
    couche1 = Sigmoid(Input*poids1);
    
    Output= Sigmoid(couche1*poids2);
    
end
