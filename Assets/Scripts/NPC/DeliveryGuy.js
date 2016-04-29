var Truck : Transform;

var HasDelivered : boolean;

private var agent : NavMeshAgent;

var SpawnPos : Transform;

var Pos0 : GameObject;
var Pos1 : GameObject;
var Pos2 : GameObject;
var Order : Array;
var NextPos : Transform;

var Delivered : int = 0;

var IsGTFO : boolean = false;

function SetReturn ( TheCab : Transform )
{
	Truck = TheCab;
}

function Start ()
{
	AssignPositions();
	
	NextPos = Pos0.transform;
	agent = transform.GetComponent.<NavMeshAgent>();
	
	
}

function AssignPositions ()
{
	Pos0 = GameObject.Find("DeliveryGuyNode_0");
	Pos1 = GameObject.Find("DeliveryGuyNode_1");
	Pos2 = GameObject.Find("DeliveryGuyNode_2");
}

function Update ()
{
	agent.destination = NextPos.transform.position;
	
	if ( Delivered == Order.length && !HasDelivered )
	{
		HasDelivered = true;
		GTFO();
	}
}

function OnTriggerEnter ( col : Collider )
{
	if ( col.gameObject.name == "DeliveryGuyNode_0" )
	{
		if ( !IsGTFO )
		{
			NextPos = Pos1.transform;
		}
		else
		{
			NextPos = Truck;
		}
	}
	else if ( col.gameObject.name == "DeliveryGuyNode_1" )
	{
		if ( !IsGTFO )
		{
			NextPos = Pos2.transform;
		}
		else
		{
			NextPos = Pos0.transform;
		}
	}
	else if ( col.gameObject.name == "DeliveryGuyNode_2" )
	{
		if ( !IsGTFO && !HasDelivered )
		{
			Deliver();
		}
	}
	
	if ( col.gameObject == Truck.gameObject && IsGTFO)
	{
		Truck.transform.parent.GetComponent("NPC_Truck").Leave();
		Destroy( transform.gameObject );
	}
}

function Deliver ()
{
	for ( var i = 0; i < Order.length; i++ )
	{
		var box = Instantiate ( Order[i].GetComponent("item").Contents, SpawnPos.transform.position, SpawnPos.transform.rotation  );
		
		box.name = "box";
		
		Delivered = Delivered + 1;
		
	}
	
	
}

function GTFO ()
{
	IsGTFO = true;
	
	NextPos = Pos1.transform;
}
