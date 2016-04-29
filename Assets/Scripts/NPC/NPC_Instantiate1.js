var NPC : Transform[];
private var TheNPC : Transform;

var NPC_MaxCount : int;
var NPC_CurCount : int;

var CanSpawn : boolean;
var isSpawning : boolean;

//
var MinWait : int;
var MaxWait : int;


private var SpawnPos : Vector3;

 
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
	
	if ( CanSpawn == true && isSpawning == false )
	{
		Spawn();
	}

}


function Spawn ()
{
	
	isSpawning = true;
	
	yield WaitForSeconds ( Random.RandomRange( MinWait, MaxWait ) );
	
	var Human = Instantiate( SelectNPC() , SpawnPos, TheNPC.transform.rotation);
	
	Human.name = "Human";
	
	isSpawning = false;
	
	NPC_CurCount = NPC_CurCount + 1;
	

}


function SelectNPC ()
{
	TheNPC = NPC[ Random.Range( 0, NPC.Length ) ];
	
	return TheNPC;
}