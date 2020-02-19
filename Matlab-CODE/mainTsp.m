%*************************************************************************%
%           R�ousdre le probl�me du voyageur de commerce (TSP)            %
%              en utilisant les algorithmes g�n�tiques (AG)               %
% ------------------------------------------------------------------------%
% Le probl�me du voyageur de commerce est un probl�me clasique tr�s       %
% utilis� dans les domaines industrielles et electroniques, l'objectif    %  
% est de trouver un cycle hamiltonien reliant n points (villes)           % 
% en minimiisant la distance parcourue du trajet.                         %             
% ------------------------------------------------------------------------%
% Par       : MEJDAOUI Soufiane                                           %
% Sous Le   : Projet de Fin d'Etude (PFE) SMI                             %
%                                                 						  %  
%*************************************************************************%


%% initialisation %%
global nbrville     %Nombre de Ville
global nbrpop       %Nombre de Population
global nbriter      %Nombre d'it�rations
global nbr_im       %Nombre d'imigration

nbrpop = 50;
nbriter = 1000;
nbrville = 51;
nbr_im  = 10000; % Nombre d'iteration que l'approche d'immigration soit appliqu�e

GenerationT = zeros(1,nbriter);     %Le vecteur dans lequel on stock la meilleure valeur pour chaque iteration
GenerationBest = zeros(nbriter,nbrville); %Matrice dans laquelle on stock le meilleur individu (solution/Trajet) pour chaque iteration

[popinit,distmat,Villes] = file_init(nbrpop); %Plus de  D�tails est dans la fonction

x = Villes(:,2)'; % x cooronate
y = Villes(:,3)'; % y cooronate
im = nbr_im;
for gen=1:nbriter
    
 %% Evalutaion %%
[vectfit,best,minVal,indxBest]=calcFitness(nbrpop ,nbrville,distmat ,popinit); %Plus de D�tails est  dans la fonction
GenerationT(gen) = minVal;
GenerationBest(gen,:) = best;
%% Selection pour le reproduction
matselec = rouletteSelect(vectfit,popinit); %Plus de D�tails est  dans la fonction

%% Croisement du population selectionn�e %%
popsuiv = croisementCX(matselec,popinit); %Plus de D�tails est  dans la fonction

%% Mutation %%
popsuivm = mutation_PSM(popsuiv); %Le D�tails est  dans la fonction

%% Insertion %%
popfinal = insertion(popsuivm,popinit,vectfit,nbrville); %Plus de D�tails dans la fonction
popinit = popfinal;

%% Aproche d'immigration %%
if im == gen 
        immigrate_pop = immigration(popinit,distmat);
        im = im + nbr_im;
        fprintf(' \n IMIGRATION \n');
      popinit = immigrate_pop;
end


%% Affichage du r�sutats

disp(['Generation :  ',num2str(gen)]); 
disp(['Meilleur Trajet : ',num2str(best)]);
disp(['Distance : ', num2str(minVal)]); 

figure(1);
plot([x(GenerationBest(gen,:)) x(GenerationBest(gen,1))],[y(GenerationBest(gen,:)) y(GenerationBest(gen,1))],x,y,'.');
for p=1:nbrville
x1 = Villes(p,2);
y1 = Villes(p,3);
txt1 = num2str(p);
text(x1,y1,txt1);
end
drawnow;

end

clear val 
clear idx
[val,idx] = min(GenerationT);

fprintf('\n################## Best target ################\n');
fprintf(num2str(GenerationBest(idx,:)))
fprintf('\n################## Distance ###################\n');
fprintf(num2str(val))
fprintf('\n\n');

figure(2)
iters=1:nbriter;
plot(iters,GenerationT,'-r','LineWidth',1.5);
xlabel('Generation');
ylabel('Fitness');

