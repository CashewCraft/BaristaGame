var Quantity : int;
var Contents : String;
private var ParentOBJ : Transform;
var IsAttatched : boolean;
private var Coffee : Transform;


function Start ()
{
	Coffee = transform.Find("Coffee");
	SetLidColor();
}

function SetLidColor ()
{
	if ( Contents == "Latte" )
	{
		transform.Find("CoffeeTube").GetComponent.<Renderer>().materials[2].color = Color32(111,84,28,255);
	}
	else if ( Contents == "Cappuccino" )
	{
		transform.Find("CoffeeTube").GetComponent.<Renderer>().materials[2].color = Color32(58,41,4,255);
	}
	else if ( Contents == "Mocha" )
	{
		transform.Find("CoffeeTube").GetComponent.<Renderer>().materials[2].color = Color32(38,28,9,255);
	}
}

function SetParent(Mount : Transform)
{
	ParentOBJ = Mount;
}

function Interact ()
{
	IsAttatched = false;
	transform.tag = "Moveable";
	transform.GetComponent.<Rigidbody>().detectCollisions = true;
	ParentOBJ.transform.BroadcastMessage("Detatch", transform);
	ParentOBJ = null;
}

function Attatch ()
{
	IsAttatched = true;
} 

function Update ()
{
	if ( ParentOBJ != null )
	{
		transform.parent = ParentOBJ.transform;
	}
	if ( IsAttatched )
	{
		transform.GetComponent.<Rigidbody>().isKinematic = true;
		transform.GetComponent.<Rigidbody>().detectCollisions = false;
	}
	if ( Quantity == 0 )
	{
		Coffee.active = false;
	}
}

function GetQuantity ()
{
	return Quantity;
}