% popsuiv : contient l'ensemble du population obtenue par l'operateur de
% croisemet ( Enfants)
% la fonction croisementPMX(matselec,popinit) fait appel à une fonction
% d'aide CRS_PMX(parent1,parent2) 

function popsuiv = croisementPMX(matselec,popinit)

[nbrpop,nbrville] = size(popinit);
[ligne,~] = size(matselec);
 
p_x = 0.7;
popsuiv = zeros(ligne,nbrville); %population des enfants

k=1;
%for k=1:2:ligne % 50% individus va nous donner 50% 
while(sum(popsuiv(end,:)==0))
    
r1 = randi([1 ligne]); %on choisi aléatoirement
r2 = randi([1 ligne]); %deux parents du pop_init

parent1 = matselec(r1,:);
parent2 = matselec(r2,:);

     if rand <= p_x
    [child1,child2] = CRS_PMX(parent1,parent2); %fonction d'aide ci-dessus
    
    popsuiv(k,:) = child1;
    popsuiv(k+1,:) = child2;
    k = k+2;
     end
    

end
end


           %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            
function [ch1,ch2] = CRS_PMX(parent1,parent2)

nbrville=length(parent1);
    point=randsample(nbrville,2); %deux points de courpures aléaatoires
    pt1=min(point); %premier point de courpure
    pt2=max(point); %deuxieme point de courpure

    %Je vais diviser chaque chromosome en 3 parties :        
    %P : partie premiere
    %M : partie medium
    %F : partie  Fin
    
    P1=parent1(1:pt1);
    P2=parent2(1:pt1);
    
    M1=parent2(pt1+1:pt2);
    M2=parent1(pt1+1:pt2);

    nVar1=length(M1);
    nVar2=length(M2);
    
    F1=parent1(pt2+1:end);
    F2=parent2(pt2+1:end);
    
for j=1:nbrville   
    for i=1:nVar1
       [a,loc1]=ismember(M1(i),P1);
       if a==1
           P1(loc1)=M2(i);
           break;
       end    
    end
    for i=1:nVar1
       [b,loc2]=ismember(M1(i),F1);
       if b==1
           F1(loc2)=M2(i);
           
       end     
    end    
end    
    ch1=[P1,M1,F1];
    
for n=1:nbrville
    for i=1:nVar2
       [point,loc3]=ismember(M2(i),P2);
       if point==1
           P2(loc3)=M1(i);
       end
    end    
    for i=1:nVar2
       [d,loc4]=ismember(M2(i),F2);
       if d==1
           F2(loc4)=M1(i);
       end      
    end
end    
    ch2=[P2,M2,F2];
end
