private var Order1OBJ : Transform;
private var Order2OBJ : Transform;
private var Order3OBJ : Transform;

var Order1 : String;
var Order2 : String;
var Order3 : String;

var StayChance : int;
var IsStay : boolean;

var Order1Sat : boolean;
var Order2Sat : boolean;
var Order3Sat : boolean;

private var HasServed : boolean;

var TrayHeight : float; //1.34 for Map_01

var OrderArray = new Array();

var StayNum : int;
var Spawn : GameObject;

function Start ()
{
	Order1OBJ = transform.Find("Order1OBJ");
	Order2OBJ = transform.Find("Order2OBJ");
	Order3OBJ = transform.Find("Order3OBJ");
	StayChance = GameObject.Find("Master Script Container").GetComponent("SeatingController").stayC;
	Spawn = GameObject.Find("NPC_node_Spawn1");
	TrayHeight = Spawn.GetComponent("NPC_Instantiate").GlobalTrayHeight;
	
	GetStayChance();
	
}

function GetStayChance ()
{
	StayNum = Random.Range(1, StayChance);
	
	if (StayNum == 1 && transform.parent.GetComponent("NPC_Move").CanStay == true)
	{
		IsStay = true;
		transform.parent.GetComponent("NPC_Move").IsStay = true;
		transform.parent.GetComponent("Human_MainScript").IsStay = true;
	}
	else
	{
		IsStay = false;
		transform.parent.GetComponent("NPC_Move").IsStay = false;
		transform.parent.GetComponent("Human_MainScript").IsStay = false;
	}
}

function Attatch ( Obj : Transform, OrderPos : Transform )
{
	Obj.transform.parent = OrderPos.transform;
	Obj.transform.localPosition = Vector3(0,0,0);
				
	Obj.transform.rotation = Quaternion.identity;
			
	Obj.GetComponent.<Rigidbody>().isKinematic = true;
	Obj.GetComponent.<Rigidbody>().detectCollisions = false;
	Obj.gameObject.tag = "Untagged";
}

function OnTriggerEnter ( col : Collider )
{
	if ( col.GetComponent(( col.gameObject.name + "_Info")) != null )	
	{	
		var OBJ = col.transform.GetComponent( col.gameObject.name + "_Info" );
		if (OBJ.Contents != "")
		{
		
			if ( !IsStay )
			{
				if ( OBJ.Contents == Order1 && Order1Sat == false)
				{
					if ( OBJ.IsTakeAway == true || OBJ.IsFood )
					{
						
						Attatch(col.transform, Order1OBJ);
						OrderArray.Push(col.transform);
						Order1Sat = true;
					
						if ( OBJ.IsFood == false )
						{
							OBJ.AddLid();
						}
					}
				}
				else if (OBJ.Contents == Order2 && Order2Sat == false )
				{
					if ( OBJ.IsTakeAway == true || OBJ.IsFood )
					{
						Attatch(col.transform, Order2OBJ);
						OrderArray.Push(col.transform);
						Order2Sat = true;
					
						if ( OBJ.IsFood == false )
						{
							OBJ.AddLid();
						}
					}
				}
				
				else if (OBJ.Contents == Order3 && Order3Sat == false )
				{
					if ( OBJ.IsTakeAway == true || OBJ.IsFood )
					{
						Attatch(col.transform, Order3OBJ);
						OrderArray.Push(col.transform);
						Order3Sat = true;
					
						if ( OBJ.IsFood == false )
						{
							OBJ.AddLid();
						}
					}
				}
			}
			
			else if ( IsStay )
			{
				if (OBJ.Contents == Order1 && Order1Sat == false )
				{
					if ( OBJ.IsTakeAway == false || OBJ.IsFood )
					{
						col.transform.parent = Order1OBJ.transform;
						col.transform.localPosition = Vector3(0,0,0);
						
						col.transform.rotation = Quaternion.identity;
			
						col.GetComponent.<Rigidbody>().isKinematic = true;
						col.GetComponent.<Rigidbody>().detectCollisions = false;
						col.gameObject.tag = "Untagged";
						OrderArray.Push(col.transform);
						Order1Sat = true;
					}
				}
				
				else if (OBJ.Contents == Order2 && Order2Sat == false )
				{
					if ( OBJ.IsTakeAway == false || OBJ.IsFood )
					{
						col.transform.parent = Order2OBJ.transform;
						col.transform.localPosition = Vector3(0,0,0);
						
						col.transform.rotation = Quaternion.identity;
			
						col.GetComponent.<Rigidbody>().isKinematic = true;
						col.GetComponent.<Rigidbody>().detectCollisions = false;
						col.gameObject.tag = "Untagged";
						OrderArray.Push(col.transform);
						Order2Sat = true;
					}
				}
				
				else if (OBJ.Contents == Order3 && Order3Sat == false )
				{
					if ( OBJ.IsTakeAway == false || OBJ.IsFood )
					{
						col.transform.parent = Order3OBJ.transform;
						col.transform.localPosition = Vector3(0,0,0);
						
						col.transform.rotation = Quaternion.identity;
			
						col.GetComponent.<Rigidbody>().isKinematic = true;
						col.GetComponent.<Rigidbody>().detectCollisions = false;
						col.gameObject.tag = "Untagged";
						OrderArray.Push(col.transform);
						Order3Sat = true;
					}
				}
			}
		}
	}
}

function Update ()
{
	if ( Order1Sat == true )
	{
		if ( Order2Sat == true )
		{
			if ( Order3Sat == true )
			{
				if (transform.parent.GetComponent("Human_MainScript").HasPaid ==  false)
				{
					transform.parent.GetComponent("Human_MainScript").Pay();
				}

			}
		}
	}
	
	if ( HasServed == true )
	{
		transform.parent.GetComponent("NPC_Move").HasServed = true;
	}
	
	if ( Order1 == " " )
	{
		Order1Sat = true;
	}
	if ( Order2 == " " )
	{
		Order2Sat = true;
	}
	if ( Order3 == " " )
	{
		Order3Sat = true;
	}
	
	transform.localPosition.y = TrayHeight;
	
}

