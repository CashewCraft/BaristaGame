#pragma strict
var broken : AudioClip;
var working : AudioClip;
var fuelgage : Transform;
var isbroken = false;
var fuelremaining = 400;
var thingstobreak : Transform[];

//Note: fuel = -0.005 scale means move -0.0025 X

function Start () 
{
	DelayTheInevitable();
	PingVampireFuel();
}

function VampireFuel()
{
	if (fuelremaining != 0)
	{
		yield WaitForSeconds(Random.Range(2,5));
		fuelgage.localScale -= new Vector3(0.0025f, 0, 0);
		fuelgage.localPosition -= new Vector3(0.00125f, 0, 0);
		fuelremaining -= 1;
		PingVampireFuel();
	}
	else
	{
		//turnstuffoff
		GetComponent.<AudioSource>().clip = broken;
		GetComponent.<AudioSource>().Play();
		transform.FindChild("Exaust").GetComponent(ParticleSystem).Stop();
		BreakShit();
	}
}

function PingVampireFuel()
{
	VampireFuel();
}

function DelayTheInevitable()
{
	yield WaitForSeconds(Random.Range(120,300));
	GetComponent.<AudioSource>().clip = broken;
	GetComponent.<AudioSource>().Play();
	transform.FindChild("Exaust").GetComponent(ParticleSystem).Stop();
	BreakShit();
}

function BreakShit()
{
	for (var thing in thingstobreak) {
		thing.BroadcastMessage("StopWorking");
	}
}

function FixShit()
{
	for (var thing in thingstobreak) {
		thing.BroadcastMessage("UpAndRunning");
	}
}

function Interact ()
{
	if (!isbroken)
	{
		GetComponent.<AudioSource>().clip = working;
		GetComponent.<AudioSource>().Play();
		transform.FindChild("Exaust").GetComponent(ParticleSystem).Play();
		DelayTheInevitable();
		FixShit();
	}
	if (fuelremaining == 0)
	{
		fuelgage.localScale.x = 1;
		fuelgage.localPosition.x = 0;
		fuelremaining = 400;
		FixShit();
		VampireFuel();
	}
}