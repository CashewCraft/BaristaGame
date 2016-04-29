private var IsOpen : boolean;

var OpenCloseSound : AudioClip;

var Refridgerator : Transform;
var FridgeScript;

var Spaces : Transform[];

private var ChosenPos : Transform;

function Start ()
{
	FridgeScript = Refridgerator.GetComponent("Refridgerator");
}

function Interact ()
{
	if ( IsOpen == false )
	{
		GetComponent.<AudioSource>().PlayOneShot( OpenCloseSound );
		
		transform.localPosition.x = transform.localPosition.x + 0.6;
		
		IsOpen = true;
	}
	else if ( IsOpen == true )
	{
		GetComponent.<AudioSource>().PlayOneShot( OpenCloseSound );
		
		transform.localPosition.x = transform.localPosition.x - 0.6;
		
		IsOpen = false;
	}	
}

function OnTriggerEnter ( col : Collider )
{
	if ( col.transform.GetComponent("food_Info") != null )
	{
		GetFreePos();
		
		if ( ChosenPos != null  )
		{
			col.transform.position = ChosenPos.transform.position;
			col.transform.rotation = ChosenPos.transform.rotation;
			col.transform.parent = ChosenPos.transform;
			col.GetComponent.<Rigidbody>().isKinematic = true;
			col.GetComponent.<Rigidbody>().detectCollisions = false;
			FridgeScript.Contents.push(col.transform.GetComponent("food_Info").Contents);
		}
		
	}
}




function GetFreePos ()
{

	for ( i = 0; i < Spaces.length; i++ )
	{
		if ( Spaces[i].GetComponent("Node_MainScript").IsOccupied == false )
		{
			ChosenPos = Spaces[i];
			break;
		}
		else if ( Spaces[Spaces.length -1].GetComponent("Node_MainScript").IsOccupied == true )
		{
			ChosenPos = null;
			break;
		}
	}

}

