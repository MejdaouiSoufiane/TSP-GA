
% Nous compl�tons la population obtenue par les Op�rateurs de croisement et
% de Mutaion, en ins�rant des individus de la population initiale avec le
% meilleur de cette population 

function popfinal = insertion(popsuivm,popinit,vectfit,nbrville)
[ligne,~] = size(popsuivm);
[ligneP,~] = size(popinit);

popfinal = zeros(ligneP,nbrville);
popfinal(1:ligne,:) = popsuivm;
fit = sort(vectfit);

for i= ligne+1 : ligneP-1
r = randi([1 ligneP]);
popfinal(i,:) = popinit(r,:);
end
   
% ELitisme
index = find(vectfit == fit(1));
popfinal(end,:) = popinit(index(1),:);

end
