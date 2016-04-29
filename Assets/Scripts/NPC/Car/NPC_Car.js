//Nodes\\
private var Spawn1 : Transform;

var PosPrefix : String;

private var P1 : Transform;
private var P2 : Transform;
private var P3 : Transform;
private var P4 : Transform;
private var Headlights : Transform;
private var TOD : GameObject;
var TODScript;

private var KillZone_1 : Transform;

var DriveBySound : AudioClip;


var CarModel : Transform;

var NextPos : Transform;

private var agent : NavMeshAgent;


function Start ()
{
	
	Spawn1 = GameObject.Find ("Car" + PosPrefix + "Spawn").transform;

	Headlights = transform.Find("Headlight");
	
	P1 = GameObject.Find ("Car" + PosPrefix + "Node1").transform;
	P2 = GameObject.Find ("Car" + PosPrefix + "Node2").transform;
	P3 = GameObject.Find ("Car" + PosPrefix + "Node3").transform;
	P4 = GameObject.Find ("Car" + PosPrefix + "Node4").transform;
	KillZone_1 = GameObject.Find ("Car" + PosPrefix + "NodeKillZone").transform;
	
	TOD = GameObject.Find("TOD");
	TODScript = TOD.GetComponent("TOD");
	
	agent = GetComponent.<NavMeshAgent>();
	
}


function PlayDriveBy ()
{
	GetComponent.<AudioSource>().PlayOneShot( DriveBySound );
}


function OnTriggerEnter ( col : Collider  )
{
		
		if ( col.gameObject.name == "Car" + PosPrefix + "Spawn" )
		{
			NextPos = P1;

		}
		
		if ( col.gameObject.name == "Car" + PosPrefix + "Node1" )
		{
			NextPos = P2;
			
		}
		if ( col.gameObject.name == "Car" + PosPrefix + "Node2" )
		{
			NextPos = P3;
			
		}
		if ( col.gameObject.name == "Car" + PosPrefix + "Node3" )
		{
			NextPos = P4;
			
		}
		
		if ( col.gameObject.name == "Car" + PosPrefix + "Node4" )
		{
			NextPos = KillZone_1;
			
		}
		
		
		if ( col.gameObject.name == "Car" + PosPrefix + "NodeKillZone" )
		{
			Spawn1.GetComponent("NPC_InstantiateCar").NPC_CurCarCount = Spawn1.GetComponent("NPC_InstantiateCar").NPC_CurCarCount -1;
			Destroy ( transform.gameObject );
			
		}
	
	
}


function Update ()
{
	GetDestination();
	
	if ( TODScript.Hour >= 19 || TODScript.Hour <= 5 )
	{
		Headlights.gameObject.SetActive(true);
	}
	else
	{
		Headlights.gameObject.SetActive(false);
	}
}




function GetDestination ()
{
		if ( NextPos == P1 )
		{
			agent.SetDestination ( P1.transform.position );
			
		}
		if ( NextPos == P2 )
		{
			agent.SetDestination ( P2.transform.position );
			
		}
		if ( NextPos == P3 )
		{
			agent.SetDestination ( P3.transform.position );
			
		}
		if ( NextPos == P4 )
		{
			agent.SetDestination ( P4.transform.position );
	
		}
		if ( NextPos == KillZone_1 )
		{
			agent.SetDestination ( KillZone_1.transform.position );
	
		}
}


