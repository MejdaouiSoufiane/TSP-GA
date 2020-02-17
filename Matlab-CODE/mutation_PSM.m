%  on applique l'operateur de mutation sur la population obtenue par celui du croisement 
%  le type de mutation utilisé : 'Reverse Shuffle Mutation PSM'

function popsuivm = mutation_PSM(popsuiv)

p_mut = 0.02;  % la probalité de mutation
[ligne,~] = size(popsuiv);

for i = 1 : ligne
    child = popsuiv(i, :);
    len = length(child);
        for j = 1 : len
            if rand <= p_mut
                prev = child(j);
                index = randi(len);
                child(j) = child(index);
                child(index) = prev;
                popsuiv(i, :) = child;
            end
        end
end
popsuivm = popsuiv;
end