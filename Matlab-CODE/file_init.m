% Cette fonction sert à extraire les coordonées des villes du fichier de
% TSPLIB utilisé, puis créer une population initiale aléaatoire.
% Si l'istance fichier utilise la distance Euclidienne ou Géographique,
% vous devez mettre en commentaire les partie de code initule.

function [popinit,distmat,Villes] = file_init(nbrpop)
%Lire le fichier qui contient les coordonnées des villes
[FileName,~] = uigetfile('*.txt','sélectionnez le fichier texte');

  fid = fopen(FileName,'r');
  Villes = dlmread(FileName,'%d%10.4f%10.4f'); %Stocker les valeurs du fichier dans la matrice Villes
  [nbrville,~] = size(Villes);
  fclose(fid);
 
distmat = zeros(nbrville,nbrville); %La matrice de Distance
popinit = zeros(nbrpop,nbrville);   %La matrice du population initilae

%Creation du population initiale (Aléatoiremment)
for i=1:nbrpop
    popinit(i,:) = randperm(nbrville);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                          % Distance Euclidienne %
%Remplire la matrice de distance 
for i=1:nbrville
    for j=1:nbrville
        distmat(i,j) = sqrt( (Villes(i,2)-Villes(j,2))^2 + (Villes(i,3)-Villes(j,3))^2 );
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Uncomment this part if you're gonig to use GEO ditance (Burma14 ..) %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                         % Distance Geographique %
%       latitude =[ 0 0 ];
%       longitude =[ 0 0 ];
%       pi = 3.141592;
%       r = 6378.388;
% 
% for i=1:nbrville
%     for j=1:nbrville
% 
% deg = round( Villes(i,2));
% min = Villes(i,2) - deg;
% latitude(1) = pi * (deg + 5.0 * min / 3.0 ) / 180.0 ;
% deg = round( Villes(i,3));
% min  = Villes(i,3) - deg;
% longitude(1)  = pi*(deg + 5.0*min/3.0)/180.0;
% deg = round( Villes(j,2));
% min = Villes(j,2) - deg;
% latitude(2) = pi * (deg + 5.0 * min / 3.0 ) / 180.0 ;
% deg = round( Villes(j,3));
% min  = Villes(j,3) - deg;
% longitude(2)  = pi*(deg + 5.0*min/3.0)/180.0;
% q1 = cos(longitude(1) - longitude(2));
% q2 = cos(latitude(1) - latitude(2));
% q3 = cos(latitude(1) + latitude(2));
% 
% distmat(i,j) = fix((r*acos(0.5*(1.0+q1)*q2 - (1.0-q1)*q3) +1.0));
% 
%     end
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end