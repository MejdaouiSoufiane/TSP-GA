
% matselec : la matrice qui contient les individus choisis pour la reproduction

function matselec = rouletteSelect(vectfit,popinit)

 Ps = 0.5;
 [nbrpop,nbrville] = size(popinit);
 nbrpopS = floor(nbrpop*Ps);            % nous s�l�ctionnons Ps*100% des individus
 matselec = zeros(nbrpopS,nbrville);
cumProb = zeros(1,length(vectfit));     % vecteur qui contient la fitness cumul�e
 s = 0;
         
 
  % calcule de probabilit� cumul�e
 for j=1:length(vectfit)
     cumProb(j) = s + vectfit(j);
     s = cumProb(j);
 end
  
 % Remplir la matrice de selecetion pour la reproduction
 for i=1:nbrpopS
 r = (max(cumProb)-min(cumProb))*rand() + min(cumProb); %  min(cumProb) <= r <= max(cumProb)
 
 for j=1:length(cumProb)
    if r <= cumProb(j)
        matselec(i,:) = popinit(j,:);
        break;
    end
    
 end
 
 end
 
 end