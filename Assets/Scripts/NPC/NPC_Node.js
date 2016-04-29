var Occupied : boolean;


function OnTriggerEnter ( col : Collider )
{
	if ( col.transform.gameObject.tag == "NPC")
	{
		if ( col.transform.GetComponent("NPC_Move") != null && col.transform.GetComponent("NPC_Move").HasGTFO == true )
		{
			Occupied = false;
		}
		else
		{
			Occupied = true;
		}
	}
}

function OnTriggerExit ( col : Collider )
{
	if ( col.transform.gameObject.tag == "NPC" )
	{
		Occupied = false;
	}
}