include "globals.mzn";
int: TaillePlageDeTemps = 12;
int: MinTempsDeDeplacement = 1;
int: NombreDeReunions = 20;
int: MaxTempsDeDeplacement = 2;
int: NombreDAgents = 9;
int: NombreDeReunionsParAgent = 6;
array [1..NombreDeReunions, 1..NombreDeReunions] of 0..MaxTempsDeDeplacement: TempsDeDeplacement =
[|0,2,1,2,1,2,2,2,2,2,2,1,1,1,2,1,1,1,1,2,
|2,0,1,2,2,2,2,1,2,1,2,2,1,2,1,1,2,1,1,2,
|1,1,0,2,2,1,1,1,1,2,2,1,1,2,1,2,1,2,2,1,
|2,2,2,0,1,1,1,2,2,1,1,1,2,1,1,1,2,2,2,1,
|1,2,2,1,0,2,2,2,2,2,1,2,1,2,1,2,2,1,2,2,
|2,2,1,1,2,0,1,1,2,2,1,2,2,1,2,1,2,1,2,2,
|2,2,1,1,2,1,0,1,1,2,2,2,2,1,1,2,2,2,1,1,
|2,1,1,2,2,1,1,0,2,2,1,1,1,2,2,1,1,2,2,2,
|2,2,1,2,2,2,1,2,0,2,2,2,1,1,1,2,2,1,2,1,
|2,1,2,1,2,2,2,2,2,0,1,2,2,1,2,2,1,1,1,2,
|2,2,2,1,1,1,2,1,2,1,0,2,1,1,1,1,1,2,1,1,
|1,2,1,1,2,2,2,1,2,2,2,0,2,2,2,1,1,1,2,1,
|1,1,1,2,1,2,2,1,1,2,1,2,0,1,1,2,1,2,2,1,
|1,2,2,1,2,1,1,2,1,1,1,2,1,0,2,1,2,1,2,2,
|2,1,1,1,1,2,1,2,1,2,1,2,1,2,0,1,2,1,1,1,
|1,1,2,1,2,1,2,1,2,2,1,1,2,1,1,0,2,2,1,1,
|1,2,1,2,2,2,2,1,2,1,1,1,1,2,2,2,0,1,2,2,
|1,1,2,2,1,1,2,2,1,1,2,1,2,1,1,2,1,0,1,1,
|1,1,2,2,2,2,1,2,2,1,1,2,2,2,1,1,2,1,0,1,
|2,2,1,1,2,2,1,2,1,2,1,1,1,2,1,1,2,1,1,0|];
array [1..NombreDAgents, 1..NombreDeReunionsParAgent] of 0..NombreDeReunions: ReunionsParAgent =
[|1,2,6,15,18,19,
|0,2,5,9,15,16,
|0,7,10,11,14,19,
|1,7,8,10,12,17,
|0,2,10,11,13,14,
|1,3,5,12,14,17,
|9,10,13,15,17,19,
|4,7,10,11,12,18,
|0,2,7,8,11,18|];
