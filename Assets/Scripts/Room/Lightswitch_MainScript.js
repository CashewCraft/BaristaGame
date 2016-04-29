var Lights : Transform[];
var State : boolean;

var Click : AudioClip;

function Interact ()
{
	if ( State == false )
	{
		State = true;
	} 
	else if ( State == true )
	{
		State = false;
	}
	
	GetComponent.<AudioSource>().PlayOneShot( Click );
}


function Update ()
{
	if ( State == false )
	{
		for ( var i = 0; i < Lights.Length; i++ )
		{
			Lights[i].gameObject.SetActive(false);
		}
		
	}
	else if ( State == true )
	{
		for ( var o = 0; o < Lights.Length; o++ )
		{
			Lights[o].gameObject.SetActive(true);
		}
	
	}
}