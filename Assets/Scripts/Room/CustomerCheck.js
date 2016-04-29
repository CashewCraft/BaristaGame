var NumberOfCustomers : int;

function OnTriggerEnter (col : Collider)
{
	if (col.GetComponent("NPC_Move") != null )
	{
		if (col.GetComponent("NPC_Move").HasServed == false)
		{
			NumberOfCustomers = NumberOfCustomers + 1;
		}
		else if (col.GetComponent("NPC_Move").HasServed == true)
		{
			NumberOfCustomers = NumberOfCustomers - 1;
		}
	}
}