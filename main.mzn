include "tests/probleme0.mzn";

set of int : REUNIONS = 0..NombreDeReunions-1;
set of int : AGENTS = 1..NombreDAgents;
set of int : REUNIONS_PAR_AGENTS = 1..NombreDeReunionsParAgent;
set of int : PLAGE_TEMPS = 1..TaillePlageDeTemps;

array [PLAGE_TEMPS] of var set of REUNIONS : reunionsParPlageDeTemps;

array[REUNIONS] of var PLAGE_TEMPS: plageDeTempsParReunions;
constraint int_set_channel(plageDeTempsParReunions, reunionsParPlageDeTemps);

%array [1..NombreDeReunions, 1..NombreDeReunions] of 0..MaxTempsDeDeplacement: TempsDeDeplacement =
%array [1..NombreDAgents, 1..NombreDeReunionsParAgent] of 0..NombreDeReunions: ReunionsParAgent =

constraint partition_set(reunionsParPlageDeTemps, REUNIONS);

%On ne met pas les réunions sur la même plage horaire si un même agent doit y assister
constraint forall(i in 1..NombreDeReunions-1, agent in AGENTS, reuParAg in REUNIONS_PAR_AGENTS where reuParAg > i)
  (plageDeTempsParReunions[ReunionsParAgent[agent, i]] != plageDeTempsParReunions[ReunionsParAgent[agent, reuParAg]]);

%Contrainte sur les temps de déplacement
constraint forall(agent in AGENTS)(sum(reuParAg in REUNIONS_PAR_AGENTS where reuParAg > 1)
  (TempsDeDeplacement[plageDeTempsParReunions[ReunionsParAgent[agent, reuParAg-1]], plageDeTempsParReunions[ReunionsParAgent[agent, reuParAg]]]+1) <= TaillePlageDeTemps);

solve satisfy;