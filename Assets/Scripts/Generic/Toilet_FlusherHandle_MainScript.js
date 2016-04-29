
var Toilet : Transform;
var CanFlush : boolean;
var FlushFail : AudioClip;
var FlushDelay : int;

function Interact ()
{
	if (CanFlush)
	{
		Toilet.BroadcastMessage("Flush");
		Delay();
	}
	else
	{
		GetComponent.<AudioSource>().PlayOneShot(FlushFail);
	}
}

function Delay ()
{
	CanFlush = false;
	yield WaitForSeconds (FlushDelay);
	CanFlush = true;
}