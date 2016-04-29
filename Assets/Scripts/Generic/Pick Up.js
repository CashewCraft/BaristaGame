var CanPickUpBool : boolean;
var RayCast;

var HitObject : RaycastHit;

var Arm : Transform;
var HandBone : Transform;

var GrabAnim : AnimationClip;


function Start ()
{

	RayCast = transform.GetComponent("Player Raycast");
	HitObject = RayCast.hit;

}


function Update ()
{

	if (Input.GetButton("Interact"))
	{
		if ( CanPickUp() )
		{
			PickUpObject();
		}
	}

}


function CanPickUp ()
{

	if ( RayCast.CanPickUp == true )
	{
		return true;
		
	}
	else
	{
		return false;
	}
	

}


function PickUpObject ()
{
	
	Arm.GetComponent.<Animation>().Play( "grab" );
	
	
	
	HitObject.parent = HandBone.transform;
	
	
}