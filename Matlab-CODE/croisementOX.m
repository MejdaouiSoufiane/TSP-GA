% popsuiv : contient l'ensemble du population obtenue par l'operateur de croisemet
% la fonction croisementOX(matselec,popinit) fait appel à une fonction d'aide CRS_OX(parent1,parent2)

function popsuiv = croisementOX(matselec,popinit)

[nbrpop,nbrville] = size(popinit);
[ligne,~] = size(matselec);
 p_x = 0.55;
popsuiv = zeros(ligne,nbrville); %population des enfants

k = 1;
while sum(popsuiv(end,:)) == 0
%for k=1:2:ligne % 50% individus va nous donner 50% 

r1 = randi([1 ligne]); %on choisi aléatoirement
r2 = randi([1 ligne]); %deux parents du pop_init

parent1 = matselec(r1,:);
parent2 = matselec(r2,:);

    if rand <= p_x

    [child1,child2] = CRS_OX(parent1,parent2); %fonction d'aide ci-dessus
    popsuiv(k,:) = child1;
    popsuiv(k+1,:) = child2;
    k = k + 2;
    
    end
end
end



           %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            
function [ch1,ch2] = CRS_OX(parent1,parent2)

    nVar=length(parent1);
    
    c=randsample(nVar-1,2); % Retourner deux point de courpures
    point1=min(c);
    point2=max(c);
    
    ch1=parent1(point1+1:point2);
    [~,loc]=ismember(ch1,parent2);% ex: ch1=(1 3),parent2=(2 3 1 4 5 6). Donc loc=(3 2)
    loc=sort(loc);
    ch1=[parent1(1:point1) parent2(loc) parent1(point2+1:end)];
    
        
    ch2=parent2(point1+1:point2);
    [~,loc1]=ismember(ch2,parent1);
    loc1=sort(loc1);
    ch2=[parent2(1:point1) parent1(loc1) parent2(point2+1:end)];  
end
