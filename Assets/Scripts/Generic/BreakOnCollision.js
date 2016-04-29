var BreakMesh : Transform;
var ObjectStrength : float;
var HasBroken : boolean;
private var IsCupFull : boolean = false;
var Decal : Transform;

function OnCollisionEnter (Collided : Collision)
{
	var Contact : ContactPoint = Collided.contacts[0];
	
	if ( transform.GetComponent.<Rigidbody>().velocity.magnitude > ObjectStrength && HasBroken == false && Collided.collider.material != "Cushion")
	{
		BreakObj(Collided, Contact);
	}
}

function BreakObj (Obj : Collision, Cont : ContactPoint)
{
	transform.parent = null;
	Instantiate(BreakMesh, transform.position, transform.rotation);
	
	if (Decal != null)
	{
		Instantiate(Decal, transform.position, Quaternion.FromToRotation(Vector3.up, Cont.normal ) );
	}
	
	HasBroken = true;
	Destroy(transform.gameObject);
}
