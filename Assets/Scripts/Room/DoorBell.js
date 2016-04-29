var BellSound : AudioClip;


function OnTriggerEnter ( col : Collider )
{
	if ( col.gameObject.tag == "NPC" )
	{
		GetComponent.<AudioSource>().PlayOneShot( BellSound );
	}
}