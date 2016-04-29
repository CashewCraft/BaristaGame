var Affect : Transform;

function OnTriggerEnter ( col : Collider )
{
	if ( col.transform.tag == "Player" )
	{
		Affect.GetComponent.<AudioSource>().volume = 1.0;
	}
}

function OnTriggerExit ( col : Collider )
{
	if ( col.transform.tag == "Player" )
	{
		Affect.GetComponent.<AudioSource>().volume = 0.25;
	}
}