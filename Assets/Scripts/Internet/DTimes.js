var SlowTick : GUITexture;
var NormalTick : GUITexture;
var FastTick : GUITexture;
var CheckoutDialogue : Transform;
var CheckoutDialogueScript;
var DTime : int;


function Start ()
{
	CheckoutDialogueScript = CheckoutDialogue.GetComponent("CheckoutDialogue");
}

function Update ()
{
	if ( DTime == 0 )
	{
		SlowTick.GetComponent("DTimeSlow").IsTicked = true;
		NormalTick.GetComponent("DTimeNormal").IsTicked = false;
		FastTick.GetComponent("DTimeFast").IsTicked = false;
	}
	else if ( DTime == 1 )
	{
		SlowTick.GetComponent("DTimeSlow").IsTicked = false;
		NormalTick.GetComponent("DTimeNormal").IsTicked = true;
		FastTick.GetComponent("DTimeFast").IsTicked = false;
	}
	else if ( DTime == 2 )
	{
		SlowTick.GetComponent("DTimeSlow").IsTicked = false;
		NormalTick.GetComponent("DTimeNormal").IsTicked = false;
		FastTick.GetComponent("DTimeFast").IsTicked = true;
	}
	
	CheckoutDialogueScript.ChosenDeliveryTime = DTime;
}