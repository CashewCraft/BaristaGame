var Car : Transform[];
var Truck : Transform;

var NPC_MaxCarCount : int;
var NPC_CurCarCount : int;

var CanSpawn : boolean;
var isSpawning : boolean;

//
var MinWait : int;
var MaxWait : int;

var SpawnRot : int;

private var CarRot : Quaternion;

private var SpawnPos : Vector3;

 
function Start ()
{
	SpawnPos = new Vector3 ( transform.position.x, transform.position.y, transform.position.z );
	CarRot = new Quaternion.Euler(0, SpawnRot, 0);
}


function Update ()
{

	if ( NPC_CurCarCount < NPC_MaxCarCount )
	{
		CanSpawn = true;
	}
	else
	{
		CanSpawn = false;
	}
	
	if ( CanSpawn == true && isSpawning == false )
	{
		Spawn();
	}


}


function Spawn ()
{
	
	isSpawning = true;
	
	yield WaitForSeconds ( Random.RandomRange( MinWait, MaxWait ) );
	
	Instantiate(Car[Random.Range(0,Car.Length)], SpawnPos, CarRot);
	
	isSpawning = false;
	
	NPC_CurCarCount = NPC_CurCarCount + 1;
		
}


function DispatchTruck ( DTime : int, Order : Array )
{
	yield WaitForSeconds ( 0 );
	
	var TheTruck = Instantiate( Truck, SpawnPos, Truck.transform.rotation );
	
	TheTruck.transform.GetComponent("NPC_Truck").Delivery = Order;
}