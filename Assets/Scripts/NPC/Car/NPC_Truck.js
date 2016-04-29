//Nodes\\
private var Spawn1 : Transform;

private var P1 : Transform;
private var P2 : Transform;
private var P3 : Transform;
private var P4 : Transform;
private var Headlights : Transform;
private var TOD : GameObject;
var TODScript;

var StartSound : AudioClip;

var Door : Transform;

var DeliveryGuy : Transform;
var Delivery : Array;

private var KillZone_1 : Transform;

var DeliveryGuyOut : boolean;
var IsDone : boolean;

var CarModel : Transform;

var NextPos : Transform;

var LeaveSound : AudioClip;

private var agent : NavMeshAgent;

var HasStopped : boolean;


function Start ()
{
	
	Spawn1 = GameObject.Find ("Car1Spawn").transform;

	//Headlights = transform.Find("Headlight");
	
	P1 = GameObject.Find ("Truck_Node_1").transform;
	P2 = GameObject.Find ("Truck_Node_2").transform;
	P3 = GameObject.Find ("Truck_Node_3").transform;

	KillZone_1 = GameObject.Find ("Truck_Node_4").transform;
	
	TOD = GameObject.Find("TOD");
	TODScript = TOD.GetComponent("TOD");
	
	agent = GetComponent.<NavMeshAgent>();
	
	GetComponent.<AudioSource>().PlayOneShot(StartSound);

	
}

function OnTriggerEnter ( col : Collider  )
{
		
		if ( col.gameObject.name == "Car1Spawn" )
		{
			NextPos = P1;

		}
		
		if ( col.gameObject.name == "Truck_Node_1" )
		{
			NextPos = P2;
			
		}
		if ( col.gameObject.name == "Truck_Node_2" )
		{
			if ( !HasStopped )
			{
				NextPos = null;
				Stop();
			}
		}
		if ( col.gameObject.name == "Truck_Node_3" )
		{
		
			NextPos = KillZone_1;
			
		}
		
		
		if ( col.gameObject.name == "Truck_Node_4" )
		{
			
			Destroy ( transform.gameObject );
			
		}
	
	
}

function Leave ()
{
	
	agent.speed = 12;
	
	transform.GetComponent.<Rigidbody>().constraints = RigidbodyConstraints.None;

	NextPos = P3;
	
	GetComponent.<AudioSource>().PlayOneShot(LeaveSound);
}

function Stop ()
{	
	
	agent.speed = 0;
	
	transform.GetComponent.<Rigidbody>().constraints = RigidbodyConstraints.FreezeRotation;
	
	HasStopped = true;
	
	if ( !DeliveryGuyOut )
	{
		yield WaitForSeconds (1.5);
		var TheDeliveryGuy = Instantiate ( DeliveryGuy, Door.transform.position, Door.transform.rotation );
		TheDeliveryGuy.GetComponent("DeliveryGuy").SetReturn(Door.transform);
		TheDeliveryGuy.GetComponent("DeliveryGuy").Order = Delivery;
		DeliveryGuyOut = true;
	}
	
}


function Update ()
{
	GetDestination();
	
	/*if ( TODScript.Hour >= 19 || TODScript.Hour <= 5 )
	{
		Headlights.gameObject.SetActive(true);
	}
	else
	{
		Headlights.gameObject.SetActive(false);
	}
	*/
	
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
		if ( NextPos == KillZone_1 )
		{
			agent.SetDestination ( KillZone_1.transform.position );
	
		}
}


