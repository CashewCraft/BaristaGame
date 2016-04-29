var TrashAdd : AudioClip;

function OnTriggerEnter ( col : Collider )
{
	if ( col.gameObject.tag == "Moveable" )
	{
		Destroy( col.gameObject );
		GetComponent.<AudioSource>().PlayOneShot(TrashAdd);
	}
}