
% On applique l'opérateur de mutation sur la population obtenue par Croisement 
% Le type de mutation utilisé : " Reverse Sequence Mutation RSM" 

function popsuivm = mutation_RSM(popsuiv)

p_mut = 0.01;  % la probalité de mutation
[ligne,~] = size(popsuiv);

for i = 1 : ligne
    child = popsuiv(i, :);
    
            if rand <= p_mut
                point=randsample(length(child),2); % deux points de courpures aléatoires
                p1=min(point);                     % premier point de courpure
                p2=max(point);                     % deuxieme point de courpure
                k = child(p1:p2);                  % On extrait le partie entre les deux points
                k = fliplr(k);                     % On inverse cette partie
                child = [child(1:p1-1) k child(p2+1:end) ];
            end
       
end
popsuivm = popsuiv;
end