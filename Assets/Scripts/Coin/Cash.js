var Value : float;

function Destroyz ()
{
	transform.parent = null;
	Destroy( transform.gameObject );
}