
var Reel0 : Transform;
var Reel1 : Transform;
var Crank : Transform;
var StartSound : AudioClip;
var Idle : AudioClip;
var Proj : Light;
var isPlaying : boolean;
var CanPlaySound : boolean;

var BlendOnSpeed : float;

function startSeq()
{
	transform.GetComponent.<AudioSource>().PlayOneShot(StartSound);
	Proj.gameObject.SetActive(true);
	yield WaitForSeconds (0.644);
	BlendProjectorON();
	CanPlaySound = true;
}

function BlendProjectorON()
{
	for (i = 0.0; i < 1.1; i += 0.01)
	{
		yield WaitForSeconds(BlendOnSpeed);
		Proj.intensity = i;
	}
	Proj.GetComponent("ProjectorAnimate").GO = true;
}

function Update ()
{
	LoopIdle();
}

function LoopIdle ()
{
	if (!isPlaying && CanPlaySound) 
	{
		Reel0.GetComponent.<Animation>().Play("projector_reel_spin");
		Reel1.GetComponent.<Animation>().Play("projector_reel_spin");
		transform.GetComponent.<AudioSource>().PlayOneShot(Idle);
		isPlaying = true;
		yield WaitForSeconds(5);
		isPlaying = false;
		
	}
}