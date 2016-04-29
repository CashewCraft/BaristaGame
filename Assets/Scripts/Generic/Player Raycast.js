var Cam : Transform;

var reticle_idle : GUITexture;
var reticle_interact : GUITexture;
var reticle_pickup : GUITexture;

var Internet : Transform;
var InternetScript;

private var fwd : Vector3;
private var RayPos : Vector3;
var RayLength : float;
var hit : RaycastHit;
private var CanMoveObject : boolean;

private var IsInRange : boolean;

var HandBone : Transform;
var ToolBone : Transform;

var IsHolding : boolean;

var PUObject : Transform;
var FPCam : Transform;

var CanItPickup : boolean;

function Start ()
{
	InternetScript = Internet.GetComponent("Internet");
}


function Update () 
{
	if (!IsMoveable() && !IsInteractable() && InternetScript.IsInUse == false )
	{
		reticle_idle.gameObject.SetActive(true);
	}
	
	if ( Inrange() && IsInteractable() )
		{
			reticle_interact.gameObject.SetActive(true);
			reticle_idle.gameObject.SetActive(false);
			IsInRange = true;
		}
			
	else if ( !Inrange() || !IsInteractable() )
		{

			reticle_interact.gameObject.SetActive(false);
			IsInRange = false;
		}
		
	
	if ( Inrange() && IsMoveable() )
		{

			reticle_pickup.gameObject.SetActive(true);
			reticle_idle.gameObject.SetActive(false);
			CanMoveObject = true;
		}
		
			
	else if ( !Inrange() || !IsMoveable() )
		{
			
			reticle_pickup.gameObject.SetActive(false);
			CanMoveObject = false;
		}
		
		

		if ( IsHolding )
		{
			reticle_idle.gameObject.SetActive(false); 
			reticle_interact.gameObject.SetActive(false);
			reticle_pickup.gameObject.SetActive(false);
		}
		
		if (Input.GetButton("Interact"))
		{
			if ( CanPickUp() && IsHolding == false )
			{
				PickUpObject();
			}
			
			else if ( IsHolding == true )
			{
				Drop();
			}
			
		}

			
		if ( Input.GetButtonDown("Interact") )
		{
			if (Physics.Raycast (RayPos, fwd, hit, RayLength))
			{
				if ( hit.transform.gameObject.tag == "Interactable" )
				{
					if (hit.transform.GetComponent ( hit.transform.gameObject.name + "_MainScript" ).IsTool == true )
					{
						hit.transform.GetComponent ( hit.transform.gameObject.name + "_MainScript" ).Interact(ToolBone.transform);
					}
					else
					{
						hit.transform.GetComponent ( hit.transform.gameObject.name + "_MainScript" ).Interact();
					}
					
				}
				else if ( hit.transform.gameObject.tag == "NPC" && hit.transform.GetComponent ( "Human_MainScript" ) != null )
				{
					hit.transform.GetComponent ( "Human_MainScript" ).Interact();
				}
			}
		}
	
		
		if ( IsHolding == true )
		{
		
			if ( Input.GetButtonDown("Fire1") )
			{
				Throw();
			}
		
		}
		
		
		
		
		
		fwd = Cam.TransformDirection (Vector3.forward);
		
		Debug.DrawRay (RayPos, fwd * RayLength, Color.green);
		
		RayPos = Cam.transform.position;
}



function CanPickUp ()
{
	if ( CanMoveObject == true )
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
	if ( CanItPickup )
	{
		PUObject = hit.transform;
	
		PUObject.transform.position = HandBone.transform.position;
		PUObject.transform.parent = HandBone.transform;
		PUObject.transform.localRotation = Quaternion.Euler( 0 ,0 ,0 ); 
	
	
		PUObject.GetComponent.<Rigidbody>().isKinematic = true;
    	PUObject.GetComponent.<Rigidbody>().detectCollisions = false;
    
	
		yield WaitForSeconds (0.25);
		
		IsHolding = true;
	}
}


function Inrange ()
{
	
	
	if (Physics.Raycast (RayPos, fwd, RayLength))
	{
		return true;
	}
	else
	{
		return false;
	}
	
	
}

function IsInteractable ()
{	
	if (Physics.Raycast (RayPos, fwd, hit, RayLength))
		
		if ( hit.transform.gameObject.tag == "Interactable"  )
	
	{
		return true;
	}
	else
	{
		return false;
	}
}



function IsMoveable ()
{
	if (Physics.Raycast (RayPos, fwd, hit, RayLength))
		
		if ( hit.transform.gameObject.tag == "Moveable" )
	
	{
		return true;
	}
	else
	{
		return false;
	}
}



function Drop ()
{
	if ( PUObject != null )
	{	
		PUObject.transform.parent = null;
	
		PUObject.GetComponent.<Rigidbody>().isKinematic = false;
   		PUObject.GetComponent.<Rigidbody>().detectCollisions = true;
   		
   		PUObject.GetComponent.<Rigidbody>().AddForce (Cam.transform.forward * 75);
    	
   	 	IsHolding = false;
   	 }
   	 IsHolding = false;
   	 CoolDown();

}

function CoolDown ()
{
	CanItPickup = false;
	yield WaitForSeconds (1);
	CanItPickup = true;
	
}

function Throw ()
{
	if ( PUObject != null )
	{
		PUObject.transform.parent = null;
	
		PUObject.GetComponent.<Rigidbody>().isKinematic = false;
    	PUObject.GetComponent.<Rigidbody>().detectCollisions = true;
	
		PUObject.GetComponent.<Rigidbody>().AddForce (Cam.transform.forward * 600);
	
		IsHolding = false;
	
	}
	IsHolding = false;
}
