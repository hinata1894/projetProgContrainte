include "tests/probleme0.mzn";

set of int : REUNIONS = 1..NombreDeReunions;
set of int : AGENTS = 1..NombreDAgents;
set of int : REUNIONS_PAR_AGENTS = 1..NombreDeReunionsParAgent;
set of int : PLAGE_TEMPS = 1..TaillePlageDeTemps;

array [PLAGE_TEMPS] of var set of REUNIONS : reunions;

%array [1..NombreDeReunions, 1..NombreDeReunions] of 0..MaxTempsDeDeplacement: TempsDeDeplacement =
%array [1..NombreDAgents, 1..NombreDeReunionsParAgent] of 0..NombreDeReunions: ReunionsParAgent =

constraint partition_set(reunions, REUNIONS);

%briser les symétries
constraint forall(p in PLAGE_TEMPS where  p > 1)(reunions[p-1] < reunions[p]);

constraint sum(p in PLAGE_TEMPS where  p > 1)(TempsDeDeplacement[reunions[p-1],reunions[p]]+1 <= TaillePlageDeTemps);

solve satisfy;