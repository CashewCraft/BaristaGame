var Cart : Transform;
var CartScript;

var StuffToHide : Transform[];

function Start ()
{
	CartScript = Cart.GetComponent("Cart");
}

function OnMouseDown ()
{
	CartScript.ShowExtras();
	
	for ( var i = 0; i < StuffToHide.length; i++ )
	{
		StuffToHide[i].gameObject.SetActive(false);
	}
	
}