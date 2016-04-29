
var IsOccupied : boolean;
var Objects = new Array ();
var Water : Transform;
var FlushSound : AudioClip;


function OnTriggerEnter (col : Collider)
{
	if (col.transform.tag == "Moveable")
	{
		Objects.Push(col.transform);
	}
}

function OnTriggerExit (col : Collider)
{
	if (col.transform.tag == "Moveable")
	{
		Objects.Remove(col.transform);
	}
}

function Flush ()
{
	GetComponent.<AudioSource>().PlayOneShot(FlushSound);
	Water.GetComponent.<Animation>().Play("Toilet_water_flush");
	
	for ( i = 0; i < Objects.length; i++ )
	{
		Destroy(Objects[i].transform);
	}
}