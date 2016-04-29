var CheckoutScript;
var Checkout : Transform;

function Start ()
{	
	CheckoutScript = Checkout.GetComponent("Checkout");
}


function OnMouseDown ()
{
	CheckoutScript.Clicked();
}