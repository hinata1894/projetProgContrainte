include "globals.mzn";
int: TaillePlageDeTemps = 12;
int: MinTempsDeDeplacement = 1;
int: NombreDeReunions = 20;
int: MaxTempsDeDeplacement = 3;
int: NombreDAgents = 14;
int: NombreDeReunionsParAgent = 4;
array [1..NombreDeReunions, 1..NombreDeReunions] of 0..MaxTempsDeDeplacement: TempsDeDeplacement =
[|0,2,3,3,2,3,1,2,2,3,3,2,2,1,3,2,3,1,2,2,
|2,0,1,1,3,2,3,3,3,2,2,3,1,3,2,3,2,3,3,1,
|3,1,0,2,3,1,2,1,2,1,1,3,3,2,2,3,2,3,1,3,
|3,1,2,0,3,1,2,3,3,1,2,2,1,1,3,2,2,2,3,3,
|2,3,3,3,0,3,3,2,1,2,2,1,3,2,3,3,3,1,3,3,
|3,2,1,1,3,0,2,1,3,2,1,1,2,3,3,2,1,1,3,2,
|1,3,2,2,3,2,0,1,3,3,3,1,3,3,1,3,2,2,1,2,
|2,3,1,3,2,1,1,0,1,3,2,2,2,3,2,1,2,1,1,3,
|2,3,2,3,1,3,3,1,0,2,3,2,3,1,2,3,1,1,2,2,
|3,2,1,1,2,2,3,3,2,0,2,3,3,2,1,1,1,2,1,3,
|3,2,1,2,2,1,3,2,3,2,0,2,3,3,2,3,3,2,3,2,
|2,3,3,2,1,1,1,2,2,3,2,0,2,3,3,3,1,2,2,1,
|2,1,3,1,3,2,3,2,3,3,3,2,0,2,3,3,2,2,3,1,
|1,3,2,1,2,3,3,3,1,2,3,3,2,0,2,2,2,2,3,1,
|3,2,2,3,3,3,1,2,2,1,2,3,3,2,0,2,3,2,2,2,
|2,3,3,2,3,2,3,1,3,1,3,3,3,2,2,0,2,2,1,3,
|3,2,2,2,3,1,2,2,1,1,3,1,2,2,3,2,0,1,2,3,
|1,3,3,2,1,1,2,1,1,2,2,2,2,2,2,2,1,0,1,1,
|2,3,1,3,3,3,1,1,2,1,3,2,3,3,2,1,2,1,0,2,
|2,1,3,3,3,2,2,3,2,3,2,1,1,1,2,3,3,1,2,0|];
array [1..NombreDAgents, 1..NombreDeReunionsParAgent] of 0..NombreDeReunions: ReunionsParAgent =
[|1,2,7,18,
|3,5,15,17,
|1,10,12,18,
|6,11,15,19,
|7,14,18,19,
|0,1,15,18,
|2,4,9,17,
|3,4,8,17,
|4,8,13,17,
|6,7,9,10,
|7,10,12,18,
|2,8,9,12,
|7,14,17,18,
|5,6,12,17|];
