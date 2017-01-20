include "tests/probleme0.mzn";

set of int : REUNIONS = 0..NombreDeReunions-1;
set of int : AGENTS = 1..NombreDAgents;
set of int : REUNIONS_PAR_AGENTS = 1..NombreDeReunionsParAgent;
set of int : PLAGE_TEMPS = 1..TaillePlageDeTemps;

%Réunions correspondant à une plage de temps
array [PLAGE_TEMPS] of var set of REUNIONS : reunionsParPlageDeTemps;

%Plage de temps sur laquel est placer une réunion
array[REUNIONS] of var PLAGE_TEMPS: plageDeTempsParReunions;
constraint int_set_channel(plageDeTempsParReunions, reunionsParPlageDeTemps);

constraint partition_set(reunionsParPlageDeTemps, REUNIONS);

%On ne met pas les réunions sur la même plage horaire si un même agent doit y assister
constraint forall(i in REUNIONS_PAR_AGENTS, agent in AGENTS, reuParAg in REUNIONS_PAR_AGENTS where reuParAg > i)
  (plageDeTempsParReunions[ReunionsParAgent[agent, i]] != plageDeTempsParReunions[ReunionsParAgent[agent, reuParAg]]);

%Contrainte sur les temps de déplacement
constraint forall(agent in AGENTS, r in REUNIONS_PAR_AGENTS, r2 in REUNIONS_PAR_AGENTS)(sum(reu1 in REUNIONS_PAR_AGENTS, reu2 in REUNIONS_PAR_AGENTS)
  (if(plageDeTempsParReunions[reu1] +1 = plageDeTempsParReunions[reu2]  % si la reunion 1 (reu1) est sur la plage qui suit celle de la réunion 2 (reu2)
  /\ reu1 = ReunionsParAgent[agent, r] /\ reu2 = ReunionsParAgent[agent, r2]) % et si reu1 et reu2 font partie des reunions que l'agent doit suivre
  then TempsDeDeplacement[reu2,reu1] else 0 endif) % alors on ajoute le temps de déplacement de reu2 vers reu1 à la somme
  +NombreDeReunionsParAgent <= TaillePlageDeTemps); % on ajoute 1h par réunion suivit par l'agent et on verifie que la somme est inférieure au temps maximum

solve satisfy;