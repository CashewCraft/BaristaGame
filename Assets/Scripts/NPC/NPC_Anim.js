var NPCScript;

function Start ()
{
	NPCScript = transform.parent.GetComponent("NPC_Move");
}

function Update ()
{
	if ( NPCScript.IsMoving == true )
	{
		GetComponent.<Animation>().Play("walk");
	}
	else
	{
		GetComponent.<Animation>().Stop();
	}
}