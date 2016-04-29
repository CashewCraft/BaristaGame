var Mounts : Transform[];
var Open : boolean;
var SwitchSound : AudioClip;
var OpenPos = Vector3 (0,0,0);
var ClosePos = Vector3 (0,0,-0.045);

function Interact ()
{
	GetComponent.<AudioSource>().PlayOneShot(SwitchSound);
	
	if ( Open )
	{
		CloseTubes();
		Open = false;
	}
	else if ( !Open )
	{
		OpenTubes();
		Open = true;
	}
	
}

function OpenTubes ()
{
	for ( var o = 0; o < Mounts.Length; o++ )
	{
		Mounts[o].BroadcastMessage("Open");
	}
}

function CloseTubes ()
{
	for (var i = 0; i < Mounts.length; i++)
	{
		Mounts[i].BroadcastMessage("Close");
	}
}

function Update ()
{
	if ( Open )
	{
		transform.localPosition = OpenPos;
	}
	else
	{
		transform.localPosition = ClosePos;
	}
	
}