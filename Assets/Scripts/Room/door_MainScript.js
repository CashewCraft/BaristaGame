var IsOpen : boolean;
var OpenSound : AudioClip;
var CloseSound : AudioClip;

function Start ()
{

	IsOpen = false;
	Close();

}

function Interact ()
{
	if ( IsOpen == false )
	{
		Open();
	}
	else 
	{
		Close();
	}
}


function Open ()
{
	GetComponent.<Animation>().CrossFade("Open");
	
	GetComponent.<AudioSource>().PlayOneShot( OpenSound );
			
	IsOpen = true;
}

function Close ()
{
	GetComponent.<Animation>().CrossFade("Close");
	
	GetComponent.<AudioSource>().PlayOneShot( CloseSound );
	
	IsOpen = false;
}