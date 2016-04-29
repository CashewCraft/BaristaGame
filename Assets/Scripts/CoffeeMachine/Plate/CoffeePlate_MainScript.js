var col : Collision;
var StickPoint : Transform;
private var Mug : GameObject;
private var Mug_Coffee : Transform;

private var CoffeeScript;

var Nozzel : Transform;

var HasMug : boolean;

var Player : GameObject;
var RaycastScript;

var DoneSound : AudioClip;


function Start ()
{

	RaycastScript = Player.GetComponent("Player Raycast");

}

function Update ()
{

	if ( HasMug && Nozzel.GetComponent("Coffee_Nozzel_MainScript").IsAddingStuff == false )
	{
		transform.tag = "Interactable";
	}
	else
	{
		transform.tag = "Untagged";
	}
	
	if ( Mug == null )
	{
		HasMug = false;
		Mug_Coffee = null;
		CoffeeScript = null;
	}
	
}


function OnCollisionEnter ( col : Collision )
{
	if ( col.gameObject.name == "Mug" )
	{
		if ( HasMug == false )
		{
			Mug = col.gameObject;
		
			Mug_Coffee = col.transform.Find("Coffee");
		
			CoffeeScript = Mug_Coffee.GetComponent("Coffee_MainScript");
		
			Stick();
		}
	}
}


function Stick ()
{

	Mug.GetComponent.<Rigidbody>().isKinematic = true;
	Mug.GetComponent.<Rigidbody>().detectCollisions = false;
	
	Mug.transform.parent = StickPoint.transform;
	Mug.transform.position = StickPoint.transform.position;
	Mug.transform.localRotation = Quaternion.Euler ( 0,0,0 );
	
	HasMug = true;
	
	Mug.layer = 2;
	Mug.tag = "Untagged";
	
	RaycastScript.IsHolding = false;
	
	GetComponent.<AudioSource>().PlayOneShot( DoneSound );
	

}

function Interact ()
{
	if ( Nozzel.GetComponent("Coffee_Nozzel_MainScript").IsFilling == false )
	{
		Mug.transform.parent = null;
		
		Mug.layer = 0;
	
		HasMug = false;
		transform.GetComponent.<Collider>().enabled = false;
		Nozzel.GetComponent("Coffee_Nozzel_MainScript").UnParent();
		Nozzel.transform.GetComponent.<Collider>().enabled = false;
	
		Mug.GetComponent.<Rigidbody>().isKinematic = false;
		Mug.GetComponent.<Rigidbody>().detectCollisions = true;
		transform.GetComponent.<Collider>().enabled = false;
		Mug.tag = "Moveable";
	
		yield WaitForSeconds (0.025);
	
		transform.GetComponent.<Collider>().enabled = true;
		Nozzel.transform.GetComponent.<Collider>().enabled = true;
		transform.GetComponent.<Collider>().enabled = true;
	
		GetComponent.<AudioSource>().PlayOneShot( DoneSound );
	}

}