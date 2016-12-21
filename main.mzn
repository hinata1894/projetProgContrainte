include "tests/probleme0.mzn";

set of int : REUNIONS = 1..NombreDeReunions;
set of int : AGENTS = 1..NombreDAgents;
set of int : REUNIONS_PAR_AGENTS = 1..NombreDeReunionsParAgent;
set of int : PLAGE_TEMPS = 1..TaillePlageDeTemps;

array [PLAGE_TEMPS] of var set of 0..NombreDeReunions : reunionsParPlageDeTemps;

array[0..NombreDeReunions] of var PLAGE_TEMPS: plageDeTempsParReunions;
constraint int_set_channel(plageDeTempsParReunions, reunionsParPlageDeTemps);

%array [1..NombreDeReunions, 1..NombreDeReunions] of 0..MaxTempsDeDeplacement: TempsDeDeplacement =
%array [1..NombreDAgents, 1..NombreDeReunionsParAgent] of 0..NombreDeReunions: ReunionsParAgent =

constraint partition_set(reunionsParPlageDeTemps, 0..NombreDeReunions);

%On ne met pas les réunions sur la même plage horaire si un même agent doit y assister
constraint forall(agent in AGENTS, reuParAg in REUNIONS_PAR_AGENTS where reuParAg > 1)
  (plageDeTempsParReunions[ReunionsParAgent[agent, reuParAg-1]] != plageDeTempsParReunions[ReunionsParAgent[agent, reuParAg]]);

solve satisfy;