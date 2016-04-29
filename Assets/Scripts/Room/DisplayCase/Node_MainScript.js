var IsOccupied : boolean;
var Child : Transform;
var ShelfCollider : BoxCollider;
var Refridgerator : Transform;
var FridgeScript;

function Start ()
{
	FridgeScript = Refridgerator.GetComponent("Refridgerator");
}

function Update ()
{
	if ( IsOccupied )
	{
		gameObject.tag = "Interactable";
		transform.GetComponent(BoxCollider).enabled = true;
		
	}
	else
	{
		gameObject.tag = "Untagged";
		transform.GetComponent(BoxCollider).enabled = false;
		
	}
	
	if( transform.childCount > 0 )
	{
		IsOccupied = true;
		Child = transform.GetChild(0);
		
	}
	else
	{
		IsOccupied = false;
		Child = null;
	}
	

}


function Interact ()
{
	if ( transform.childCount > 0 )
	{
		Child.transform.parent = null;
		Child.GetComponent.<Rigidbody>().isKinematic = false;
		Child.GetComponent.<Rigidbody>().detectCollisions = true;
		Child.GetComponent.<Rigidbody>().useGravity = true;
		FridgeScript.Contents.Remove(Child.GetComponent("food_Info").Contents);
		
	}
	ShelfCollider.enabled = false;
		
	yield WaitForSeconds (0.5);
		
	ShelfCollider.enabled = true;
}