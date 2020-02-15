
% vectfit : vecteur contient la distance totale (cout) de chaque trajet
% best : vecteur contient le meilleur trajet obtenue dans l'itération
% courrante
% minVal : la meilleure valeur correspond a ce trajet (best)

function [vectfit,best,minVal,indxBest]=calcFitness (nbrpop ,nbrville, distmat ,popinit)

vectfit = zeros(1,nbrpop);

%Calcule de vecteur de fitness
 for i=1:nbrpop
    tmp = popinit(i,:);
    for j=1:nbrville
        if j==length(tmp)
            vectfit(i) = vectfit(i) + distmat(tmp(j),tmp(1));
            break;
        end
          vectfit(i) = vectfit(i) + distmat(tmp(j),tmp(j+1));
    end
 end
 
[minVal,indxBest]=min(vectfit) ; %min() nous donne deux valeurs : la valeur minimale et l'indice de cette valeur
best=popinit(indxBest , : ) ;

end