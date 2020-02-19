
function immigrate_pop = immigration(pop_finale,distmat)

[nbrpop,nbrville] = size(pop_finale);
[fitness,~,~,~] = calcFitness(nbrpop ,nbrville, distmat ,pop_finale);

for i=1:floor(nbrpop/2)

[~,index] = max(fitness);
    
pop_finale(index,:) = randperm(nbrville);
    
fitness(index) = 0; %pour conserver l'ordre des chromosomes
end
immigrate_pop = pop_finale;
end
