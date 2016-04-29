var Spawn1 : Transform;


function OnTriggerEnter ( col : Collider )
{
	if ( col.transform.tag == "Car" )
	{
		Destroy(col.gameObject);
		Spawn1.GetComponent("NPC_InstantiateCar").NPC_CurCarCount = Spawn1.GetComponent("NPC_InstantiateCar").NPC_CurCarCount - 1;
	}
}