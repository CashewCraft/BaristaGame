var Mug : Transform;
var Mug_Coffee : Transform;
var CoffeeScript;

var Nozzel_Coffee : Transform;
var Nozzel_Coffee_Model : Transform;

var Plate : Transform;
var PScript;


var ButtonSound : AudioClip;

function Start ()
{
	PScript = Plate.GetComponent("CoffeePlate_MainScript");
	
}



function Interact ()
{

	GetComponent.<AudioSource>().PlayOneShot(ButtonSound);
		
	if ( PScript.HasMug == true )
	{
		Nozzel_Coffee.GetComponent("Coffee_Nozzel_MainScript").FillCream();
	}
	
}