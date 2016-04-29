var NPC : Transform[];
private var TheNPC : Transform;
var KillArea : int;

var DoorPos : int;

var Places : Transform[];
var FrontPos : int;

var CanStay : boolean;

var NPC_MaxCount : int;
var NPC_CurCount : int;

var CanSpawn : boolean;
var isSpawning : boolean;

//
var MinWait : int;
var MaxWait : int;

var VehicleSpawn : boolean;
var VehicleSpawner : Transform;
var CounterRotationY : float;

private var SpawnPos : Vector3;
var GlobalTrayHeight : float;

 
function Start ()
{
	SpawnPos = new Vector3 ( transform.position.x, 2, transform.position.z );
}


function Update ()
{

	if ( NPC_CurCount < NPC_MaxCount )
	{
		CanSpawn = true;
	}
	else
	{
		CanSpawn = false;
	}
	
	if ( CanSpawn == true && isSpawning == false)
	{
		if (!VehicleSpawn)
		{
			Spawn(SpawnPos, this.transform);
		}
		else
		{
			SpawnCar();
		}
	}
	

}


function SpawnCar ()
{
	isSpawning = true;
	yield WaitForSeconds (Random.Range(VehicleSpawner.GetComponent("CustomerCarSpawner").MinWait, VehicleSpawner.GetComponent("CustomerCarSpawner").MaxWait));
	VehicleSpawner.GetComponent("CustomerCarSpawner").SpawnCar();
	isSpawning = false;
}

function Spawn (pos : Vector3, StartingPosition : Transform)
{
	
	isSpawning = true;
	
	yield WaitForSeconds ( Random.RandomRange( MinWait, MaxWait ) );
	
	var Human = Instantiate( SelectNPC() , pos, TheNPC.transform.rotation);
	
	Human.name = "Human";
	
	if (VehicleSpawn)
	{
		Human.GetComponent("NPC_Move").SetCarKillArea(StartingPosition.transform);
	}
	
	isSpawning = false;
	
	NPC_CurCount = NPC_CurCount + 1;
	

}


function SelectNPC ()
{
	TheNPC = NPC[ Random.Range( 0, NPC.Length ) ];
	
	return TheNPC;
}