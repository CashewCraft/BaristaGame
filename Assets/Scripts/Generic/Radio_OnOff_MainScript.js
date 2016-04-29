
var On : boolean;
var InteractSound : AudioClip;
var OnSound : AudioClip;
var OffSound : AudioClip;
var Songs : AudioClip[];

function Start ()
{
	On = true;
	Play();
}

function Interact ()
{
	if ( On )
	{
		Stop();
		On = false;
	}
	else if ( !On )
	{
		Play();
		On = true;
	}
}

function Play ()
{	
	if ( GetComponent.<AudioSource>().isPlaying == false )
	{
		GetComponent.<AudioSource>().PlayOneShot(OnSound);
		yield WaitForSeconds (2.5);
		GetComponent.<AudioSource>().clip = Songs[Random.Range(0, Songs.Length)];
		GetComponent.<AudioSource>().Play();
	}
}

function Stop ()
{
	GetComponent.<AudioSource>().PlayOneShot(OffSound);
	yield WaitForSeconds(1);
	GetComponent.<AudioSource>().Stop();
}