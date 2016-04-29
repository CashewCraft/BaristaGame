var Mug : Transform;
var Mug_Coffee : Transform;

var Nozzel_Coffee : Transform;
var Nozzel_Coffee_Model : Transform;

var Plate : Transform;
var PScript;

var ButtonSound : AudioClip;

private var Quantity : int = 0;
var EjectButton : Transform; 
var FailSound : AudioClip;

function Start ()
{
	PScript = Plate.GetComponent("CoffeePlate_MainScript");	
}

function Update ()
{
	Quantity = Nozzel_Coffee.GetComponent("Coffee_Nozzel_MainScript").Amount;

	
	if ( Quantity >= 1 )
	{
		EjectButton.GetComponent.<Renderer>().material.color = Color.green;
	}
	else
	{
		EjectButton.GetComponent.<Renderer>().material.color = Color.red;
	}
}


function Interact ()
{	
	if (( PScript.HasMug == true && Nozzel_Coffee.GetComponent("Coffee_Nozzel_MainScript").HasFulled == false && Quantity >= 1 && Nozzel_Coffee.GetComponent("Coffee_Nozzel_MainScript").IsFilling == false ))
	{
		GetComponent.<AudioSource>().PlayOneShot(ButtonSound);
		Nozzel_Coffee.GetComponent("Coffee_Nozzel_MainScript").FillLatte();

	}
	else
	{
		GetComponent.<AudioSource>().PlayOneShot(FailSound);
	}
}