//Nodes\\
var Spawn1 : GameObject;
var KillArea : int;
var Places : Transform[];

var FindingSeat : boolean;

var FrontPos : int;

var CurPos : int = 0;
var DoorPos : int;

private var Player : GameObject;
private var LookAtPos : Vector3;

var NPCModel : Transform;

var IsInfront : boolean;

var HasServed : boolean;

var CanMove : boolean;

var NextPos : Transform;

var CanStay : boolean;

var IsMoving : boolean;

//Chance of staying\\
var IsStay : boolean;

public var ListOPlaces : GameObject[];

var Nospace : int;

private var agent : NavMeshAgent;

var TargetSeat : Transform;

private var Tray : Transform;
var TrayScript;

var HasGTFO : boolean;

var FoundSeat : boolean;

var SelectedItem : Transform;
var SelectedItemIsFood : boolean;

var CanNom : boolean;
var Chair : Transform;
var MouthPos : Transform;

function Start ()
{
	ListOPlaces = GameObject.FindGameObjectsWithTag("Seat");

	CanMove = true;
	
	agent = GetComponent.<NavMeshAgent>();
	
	Tray = transform.Find ("Tray");
	TrayScript = Tray.GetComponent("Tray_MainScript");
	MouthPos = transform.Find("FoodPos");
	
	HasServed = false;
	HasGTFO = false;
	
	Spawn1 = GameObject.Find("NPC_node_Spawn1");
	
	Places = Spawn1.transform.GetComponent("NPC_Instantiate").Places;
	
	NextPos = Places[0];
	FrontPos = Spawn1.transform.GetComponent("NPC_Instantiate").FrontPos;
	KillArea = Spawn1.transform.GetComponent("NPC_Instantiate").KillArea;
	DoorPos = Spawn1.transform.GetComponent("NPC_Instantiate").DoorPos;
	CanStay = Spawn1.transform.GetComponent("NPC_Instantiate").CanStay;

}


function OnTriggerEnter ( col : Collider  )
{
		if ( TargetSeat != null && col.gameObject == TargetSeat.gameObject && !HasGTFO )
		{
			SitDown(col.transform);
		}
		
		
		if ( NextPos != null && col.gameObject.name == NextPos.transform.name)
		{
			CurPos = CurPos + 1;
			
			if ( CurPos == FrontPos && IsStay )
			{
				NextPos = null;
			}
			else
			{
				if ( col.gameObject.name != Places[KillArea] )
				{	
					try
					{
						NextPos = Places[CurPos+1].transform;
					}
					catch (err)
					{
						NextPos = Places[(Places.Length)-1].transform;
					}
				}
			}
		}
		
		
		
		if ( col.name == Places[FrontPos].transform.name && !HasServed )
		{
			IsInfront = true;
			CanMove = false;
		}
}



function Update ()
{				
	if ( FindingSeat )
	{
		NextPos = null;
	}
	
	if ( CurPos == KillArea )
	{
		Spawn1.transform.GetComponent("NPC_Instantiate").NPC_CurCount = Spawn1.transform.GetComponent("NPC_Instantiate").NPC_CurCount -1;
		Destroy(transform.gameObject);
	}
	
	if ( HasGTFO == true )
	{		
		CanMove = true;
	}
		
		if ( NextPos != null && NextPos.transform.GetComponent("NPC_Node").Occupied == true )
		{
			if ( HasGTFO == true )
			{
				CanMove = true;
			}
			else
			{
				CanMove = false;
			}	
		}
		
		if ( NextPos != null && NextPos.GetComponent("NPC_Node").Occupied == false && !IsInfront)	
		{
			CanMove = true;
		}
		
		if ( CanMove == true )
		{	
			if ( !FindingSeat )
			{	
				GetDestination();
			}
			
			IsMoving = true;
		}
		
		
		
		if ( IsInfront == true && HasServed == false  )
		{
			Tray.gameObject.SetActive(true);
			transform.rotation.eulerAngles.y = ( Spawn1.transform.GetComponent("NPC_Instantiate").CounterRotationY );
		}
		
		if ( HasServed == true && HasGTFO == false )
		{
			if (!IsStay)
			{
				GTFO();
			}
			else if ( IsStay && !FoundSeat )
			{
				FindSeat();
			}
		}
		
		if ( IsMoving == false )
		{
			agent.updateRotation = false;
		}
		else
		{
			agent.updateRotation = true;
		}
		
		
	if ( SelectedItem != null && SelectedItem.GetComponent(SelectedItem.name + "_Info").IsFull == true && CanNom)
	{
		Nom();
	}
	if (SelectedItem != null && SelectedItem.GetComponent(SelectedItem.name + "_Info").IsFull == false && HasGTFO == false)
	{
		GetUp();
	}
		
		
}

function FindSeat ()
{
	print("Go");
	FindingSeat = true;
	
	for (var i = 0; i < ListOPlaces.length; i++)
	{
		if (ListOPlaces[i].GetComponent("ChairScript").IsOccupied == false && !FoundSeat)
		{
			TargetSeat = ListOPlaces[i].transform;
			FoundSeat = true;
			GoToSeat();
			break;
		}
	}
}


function SetChair (TheSeat : Transform)
{
	Chair = TheSeat.transform;
}

function GetDestination ()
{
	agent.SetDestination(NextPos.transform.position);
}


function SetCarKillArea (KillPlace : Transform)
{
	Start();
	yield WaitForSeconds (5);
	Places[KillArea] = KillPlace.transform;
}


function GTFO ()
{
	HasServed = false;
	NextPos = Places[DoorPos];
	TargetSeat = null;
	HasGTFO = true;
	CanMove = true;
	IsInfront = false;
	

}

function GoToSeat ()
{
	IsInfront = false;
	IsMoving = true;
	CanMove = true;
	
	agent.SetDestination(TargetSeat.transform.position);

}

function SitDown ( TheChair : Transform )
{
	transform.position = TheChair.transform.Find("Seat").transform.position;
	transform.position.y = 0.5;
	TheChair.BroadcastMessage("GetIn");
	transform.rotation = Quaternion.Euler(0, TheChair.GetComponent("ChairScript").CharRot, 0);
	GetComponent.<Rigidbody>().detectCollisions = false;
	GetComponent.<Rigidbody>().isKinematic = true;
	Sitting(TheChair);
	SetChair(TheChair);
	
}

function Sitting (TheChair : Transform)
{	
	CanMove = false;
	IsMoving = false;
	Tray.transform.gameObject.SetActive(true);
	SelectItem();
	SelectedItem.transform.parent = MouthPos.transform;
	SelectedItem.localPosition = Vector3(0,0,0);
	SelectedItem.localRotation = Quaternion.Euler(0,0,0);
	CanNom = true;
	
}


function Nom()
{
	CanNom = false;
	yield WaitForSeconds (Random.Range(5,10));
	MouthPos.localPosition = Vector3(0,2.154693,0.6521144);
	MouthPos.localRotation = Quaternion.Euler(-30,0,0);
	SelectedItem.GetComponent(SelectedItem.name + "_Info").Empty(Random.Range(5,30));
	CanNom = true;
	yield WaitForSeconds (1);
	MouthPos.localPosition = Vector3(0,1.678184,1.202413);
	MouthPos.localRotation = Quaternion.Euler(0,0,0);
}

function SelectItem ()
{
	var LoopCheck = 0;
	
	for (var u = 0; u < TrayScript.OrderArray.length; u++)
	{	
		if (TrayScript.OrderArray[u] != null )
		{
			SelectedItem = TrayScript.OrderArray[u].transform;
		}
		LoopCheck = LoopCheck + 1;
	}
	if ( LoopCheck == TrayScript.OrderArray.length )
	{
		var DisableCheck = 0;
		
		for (var a = 0; a < TrayScript.OrderArray.length; a++ )
		{
			TrayScript.OrderArray[a].transform.gameObject.SetActive(false);
			DisableCheck = DisableCheck + 1;
		}
		if ( DisableCheck == TrayScript.OrderArray.length )
		{
			SelectedItem.gameObject.SetActive(true);
			if ( SelectedItem.name == "Mug" )
			{
				SelectedItemIsFood = false;
			}
			else if ( SelectedItem.name == "food" )
			{
				SelectedItemIsFood = true;
			}
		} 
	}
}

function GetUp ()
{
	FindingSeat = false;
	IsMoving = true;
	CanMove = true;
	Tray.gameObject.SetActive(false);
	
	transform.position = Chair.Find("ExitPoint").transform.position;
	GetComponent.<Rigidbody>().detectCollisions = true;
	GetComponent.<Rigidbody>().isKinematic = false;
	Chair.BroadcastMessage("Eject");
	Chair = null;
	GTFO();
}

