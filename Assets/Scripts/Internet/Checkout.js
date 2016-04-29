var CartScript;
var _MainPage : Transform;
var ButtonBG : GUITexture;
var Tick : GUITexture;
var Text : GUIText; 
var CanClick : boolean;

function Start ()
{
	CartScript = _MainPage.GetComponent("Cart");
}

function Update ()
{
	if ( CartScript.Cart.length > 0 )
	{
		CanClick = true;
		
		ButtonBG.gameObject.SetActive(true);
		Tick.gameObject.SetActive(true);
		Text.gameObject.SetActive(true);
		
	}
	else
	{
		CanClick = false;
		
		ButtonBG.gameObject.SetActive(false);
		Tick.gameObject.SetActive(false);
		Text.gameObject.SetActive(false);
		
	}
}


function Clicked ()
{
	if ( CanClick )
	{
		CartScript.ProceedtoCheckout();
	}
}