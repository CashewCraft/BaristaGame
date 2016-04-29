

function OnTriggerEnter ( col : Collider )
{
	if ( col.gameObject.tag == "Car" )
	{
		col.transform.GetComponent("NPC_Car").PlayDriveBy();
	}
}