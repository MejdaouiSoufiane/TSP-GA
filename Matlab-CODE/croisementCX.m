% popsuiv : contient l'ensemble du population obtenue par l'operateur de croisemet
% la fonction croisement(matselec,popinit) fait appel à une fonction d'CRS_CX crois(parent1,parent2)

function popsuiv = croisementCX(matselec,popinit)

[nbrpop,nbrville] = size(popinit);
[ligne,~] = size(matselec);
 pc = 0.55;
popsuiv = zeros(ligne,nbrville); %population des enfants


k = 1;
while sum(popsuiv(end,:)) == 0     % 50% individus va nous donner 50 enfants

    r1 = randi([1 ligne]); %on choisi aléatoirement
    r2 = randi([1  ligne]); %deux parents du pop_init
    parent1 = matselec(r1,:);
    parent2 = matselec(r2,:);
    
    if rand <= pc

    [child1,child2] = CRS_CX(parent1,parent2); %fonction d'aide ci-dessus
    popsuiv(k,:) = child1;
    popsuiv(k+1,:) = child2;
    k = k + 2;
    
    end
    
end

end



           %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            
function [ch1,ch2] = CRS_CX(parent1,parent2)

    L = length(parent1);
    ch1=zeros(1,L);
    ch2=zeros(1,L);
    
pt=find(parent1==1); %le point de départ du cycle, Je choisi 1

% On commence par remplire les cases vides du premier fils
while (ch1(pt)==0)
  ch1(pt)=parent1(pt);
  pt=find(parent1==parent2(pt));
end

% On cherche s'il reste des cases vides
% Si oui, on les remplies par celles du paraent 2
vide = find(ch1==0);
ch1(vide) = parent2(vide);

% La méme chose pour le deuxiéme fils
pt=find(parent2==1);
while (ch2(pt)==0)
  ch2(pt)=parent2(pt);
  pt=find(parent2==parent1(pt));
end
vide=find(ch2==0);
ch2(vide)=parent1(vide);
end
