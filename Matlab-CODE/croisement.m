% popsuiv : contient l'ensemble du population obtenue par l'operateur de croisemet
% la fonction croisement(matselec,popinit) fait appel à une fonction d'aide crois(parent1,parent2)

function popsuiv = croisement(matselec,popinit)

[nbrpop,nbrville] = size(popinit);
popsuiv = zeros(floor(nbrpop/2),nbrville); %population des enfants

for k=1:2:length(matselec) % 50% individus va nous donner 50% 

r1 = randi([1 floor(nbrpop/2)]); %on choisi aléatoirement
r2 = randi([1 floor(nbrpop/2)]); %deux parents du pop_init

parent1 = matselec(r1,:);
parent2 = matselec(r2,:);

    [child1,child2] = crois(parent1,parent2); %fonction d'aide
    
    popsuiv(k,:) = child1;
    popsuiv(k+1,:) = child2;

end
end


           %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            
function [ch1,ch2] = crois(parent1,parent2)

    child1  = zeros(size(parent1));
    child2 = child1;
    point = randi([2, length(parent1) - 1]);

    % obtenir le premier point de corpure
    child1(:, 1:point) = parent1(:, 1:point);
    child2(:, 1:point) = parent2(:, 1:point);

    % PMX
    p1 = parent1;
    p2 = parent2;
    for j = 1 : point
        index = find(p2 == p1(j));
        p2(index) = p2(j);
        p2(j) = p1(j);
    end
    child1(1, point + 1:length(child1)) = p2(1, point + 1:length(child1));
    p1 = parent1;
    p2 = parent2;
    for j = 1 : point
        % permuter si les deux génes sont different
        if p1(j) ~= p2(j)
            index = find(p1 == p2(j));
            p1(index) = p1(j);
            p1(j) = p2(j);
        end
    end
    child2(1, point + 1:length(child2)) = p2(1, point + 1:length(child2));
    ch1 = child1; ch2 = child2;
end
