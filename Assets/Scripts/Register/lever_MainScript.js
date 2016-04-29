var IsOpen : boolean;

var hatch : Transform;

var CanUse : boolean;

var WaitTimer : float;

var Register : Transform;

var OpenSound : AudioClip;

var CloseSound : AudioClip;




function Start ()
{
	CanUse = true;
	
}



function Update ()
{
	if ( IsOpen == true )
	{
		hatch.GetComponent.<Collider>().enabled = true;
	}
	else
	{
		hatch.GetComponent.<Collider>().enabled = false;
	}
}


function Interact ()
{
	if ( IsOpen == true && CanUse == true )
	{
		Close();
		GetComponent.<Animation>().Play("Lever_Pull");
	}
	else if ( IsOpen == false && CanUse == true )
	{
		Open();
		GetComponent.<Animation>().Play("Lever_Pull");
	}


}



function Open ()
{
	
	CanUse = false;
	
	hatch.transform.localPosition.z = hatch.transform.localPosition.z + 0.15;
	
	IsOpen = true;
	
	GetComponent.<AudioSource>().PlayOneShot(OpenSound);
	
	yield WaitForSeconds ( WaitTimer );
	
	CanUse = true;
	
	hatch.GetComponent("Hatch").IsOpen = true;
	
}

function Close ()
{
	CanUse = false;
	
	hatch.transform.localPosition.z = hatch.transform.localPosition.z - 0.15;
	
	IsOpen = false;
	
	GetComponent.<AudioSource>().PlayOneShot(CloseSound);
	
	yield WaitForSeconds ( WaitTimer );
	
	CanUse = true;
	
	hatch.GetComponent("Hatch").IsOpen = false;
}