include "globals.mzn";
int: TaillePlageDeTemps = 12;
int: MinTempsDeDeplacement = 1;
int: NombreDeReunions = 20;
int: MaxTempsDeDeplacement = 2;
int: NombreDAgents = 9;
int: NombreDeReunionsParAgent = 5;
array [1..NombreDeReunions, 1..NombreDeReunions] of 0..MaxTempsDeDeplacement: TempsDeDeplacement =
[|0,1,1,1,1,1,1,2,1,2,2,1,2,1,1,1,1,2,2,1,
|1,0,1,1,2,1,2,1,2,1,2,1,2,2,2,2,1,1,2,1,
|1,1,0,2,1,1,2,2,1,2,2,2,1,2,2,1,1,1,2,2,
|1,1,2,0,1,2,1,2,1,1,1,2,1,2,1,2,2,2,2,1,
|1,2,1,1,0,1,1,1,1,2,1,1,2,2,1,2,2,2,2,1,
|1,1,1,2,1,0,2,2,2,1,2,1,1,1,2,1,1,2,1,1,
|1,2,2,1,1,2,0,2,2,2,2,2,1,2,1,2,1,1,1,1,
|2,1,2,2,1,2,2,0,2,1,1,1,1,1,1,2,1,2,2,1,
|1,2,1,1,1,2,2,2,0,1,1,2,1,1,2,1,1,1,2,1,
|2,1,2,1,2,1,2,1,1,0,1,2,1,2,2,1,2,2,1,1,
|2,2,2,1,1,2,2,1,1,1,0,1,2,1,2,1,2,1,1,2,
|1,1,2,2,1,1,2,1,2,2,1,0,2,2,2,2,2,1,2,1,
|2,2,1,1,2,1,1,1,1,1,2,2,0,1,2,1,2,2,2,2,
|1,2,2,2,2,1,2,1,1,2,1,2,1,0,1,2,1,1,1,2,
|1,2,2,1,1,2,1,1,2,2,2,2,2,1,0,2,1,1,1,1,
|1,2,1,2,2,1,2,2,1,1,1,2,1,2,2,0,1,1,2,2,
|1,1,1,2,2,1,1,1,1,2,2,2,2,1,1,1,0,1,2,2,
|2,1,1,2,2,2,1,2,1,2,1,1,2,1,1,1,1,0,1,1,
|2,2,2,2,2,1,1,2,2,1,1,2,2,1,1,2,2,1,0,1,
|1,1,2,1,1,1,1,1,1,1,2,1,2,2,1,2,2,1,1,0|];
array [1..NombreDAgents, 1..NombreDeReunionsParAgent] of 0..NombreDeReunions: ReunionsParAgent =
[|6,12,13,14,15,
|1,4,11,18,19,
|2,5,6,7,8,
|1,4,5,6,10,
|5,12,14,15,18,
|3,5,6,11,17,
|3,5,7,8,14,
|1,3,8,10,17,
|0,1,6,9,12|];
