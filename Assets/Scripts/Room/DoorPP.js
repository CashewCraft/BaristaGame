var Door : Transform;

var IsOpen : boolean;

function OnTriggerEnter ( col : Collider )
{
	if ( col.gameObject.tag == "NPC" && col.GetComponent("Human_MainScript") != null )
	{
		if ( col.GetComponent("Human_MainScript").HasServed == false )
		{
			Open();
		}	
	}
	else if ( col.GetComponent("DeliveryGuy") != null )
	{
		if ( col.GetComponent("DeliveryGuy").IsGTFO == false )
		{
			Open();
		}	
	}
}


function Open ()
{
	Door.GetComponent.<Animation>().CrossFade("Close");
	
	yield WaitForSeconds(1);
	
	Close();
}


function Close ()
{
	Door.GetComponent.<Animation>().CrossFade("Open");
}