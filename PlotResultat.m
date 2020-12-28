
function PlotResultat (input,y,poids1,poids2)
  ResultatTest=[];
  resultatValidation=[];
  
 
  
   for i=55:66
        [couche,output]= FeedForward(input(i,:),poids1,poids2);
        ResultatTest=[ResultatTest;y(i),round(output)];
       
   end
   figure('name','les resultats des tests');
   subplot(2,2,1);
   plot(ResultatTest(:,1),'r','LineWidth', 1 );
   legend('Y test');
   title('Y test');
   xlabel('Échantillons'); 
   ylabel('Les classes'); 
   subplot(2,2,2);
   plot(ResultatTest(:,2),'b','LineWidth', 1 );
   title('Output');
   legend('Y Output');
   xlabel('Échantillons'); 
   ylabel('Les classes'); 
   
   for i=67:78
        [couche,output]= FeedForward(input(i,:),poids1,poids2);
        resultatValidation=[resultatValidation;y(i),round(output)];
   end 
   
   
   figure('name','les resultats de validation');
   subplot(2,2,1);
   plot(resultatValidation(:,1),'r','LineWidth', 1 );
   title('Y validation');
   legend('Y validation');
   xlabel('Échantillons'); 
   ylabel('Les classes'); 
   subplot(2,2,2);
   plot(resultatValidation(:,2),'b','LineWidth', 1 );
   title('Output');
   legend('Y Output');
   xlabel('Échantillons'); 
   ylabel('Les classes'); 
  
end
