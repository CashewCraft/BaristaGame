var IsOpen : boolean;
var SpecifiedObejct : String;

private var AttatchedTube : Transform;

var OpenPos =  Vector3();
var ClosePos = Vector3 ();
var DefRot = new Quaternion.Euler( 0, 0, 0);

var Quantity : int;
var PopUpSound : AudioClip;
var CorrespondingButton : Transform;

var OpenSpeed : float;
var IsOpening : boolean;

function OnTriggerEnter ( Tube : Collider )
{
		if ( Tube.GetComponent("CoffeeTube_MainScript") != null && Tube.GetComponent("CoffeeTube_MainScript").Contents == SpecifiedObejct )
		{
			if ( IsOpen )
			{
				Attatch(Tube.transform);
			}
		}	
}

function Update ()
{
	if ( AttatchedTube != null )
	{		
		if ( IsOpening || !IsOpen )
		{
			AttatchedTube.gameObject.tag = "Untagged";
		}
		else
		{
			AttatchedTube.gameObject.tag = "Interactable";
			CorrespondingButton.BroadcastMessage("ZeroCoffee");
		}
		
		if ( !IsOpening && !IsOpen )
		{
			Quantity = AttatchedTube.GetComponent("CoffeeTube_MainScript").Quantity;
			CorrespondingButton.BroadcastMessage("UpdateQuantities", Quantity);
		}
		
	}
}

function MinusOne()
{
	AttatchedTube.GetComponent("CoffeeTube_MainScript").Quantity = AttatchedTube.GetComponent("CoffeeTube_MainScript").Quantity - 1;
}

function Attatch (TheTube : Transform)
{
	AttatchedTube = TheTube;
	AttatchedTube.BroadcastMessage("Attatch");
	AttatchedTube.BroadcastMessage("SetParent", transform);
	AttatchedTube.transform.rotation = DefRot;
	AttatchedTube.position = OpenPos;
	GetComponent.<AudioSource>().PlayOneShot(PopUpSound);
	
}

function Detatch (TheTube : Transform)
{
	transform.GetComponent.<Collider>().enabled = false;
	TheTube.transform.parent = null;
	TheTube.GetComponent.<Rigidbody>().detectCollisions = true;
	TheTube.GetComponent.<Rigidbody>().isKinematic = false;
	AttatchedTube = null;
	GetComponent.<AudioSource>().PlayOneShot(PopUpSound);
	yield WaitForSeconds (2.5);
	transform.GetComponent.<Collider>().enabled = true;
}

function Open ()
{
	IsOpening = true;
	
	if ( AttatchedTube != null )
	{
		AttatchedTube.transform.position = OpenPos;
	}
	IsOpen = true;
	IsOpening = false;
}

function Close ()
{	
	IsOpening = true;
	
	if ( AttatchedTube != null )
	{
		AttatchedTube.transform.position = ClosePos;
	}
	IsOpen = false;
	IsOpening = false;
}