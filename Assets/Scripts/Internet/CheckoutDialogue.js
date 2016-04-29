var CartScript;
var _MainScript : Transform;
var SubTotal : GUIText;
var ChosenDeliveryTime : int;

var _TheOrder : GUIText;

private var SlowMultiplyer : float = 0.0;
private var FastMultiplyer : float = 0.75;
private var NormalMultiplyer : float = 0.35;

var SubTotalF : float;


function Start ()
{
	CartScript = _MainScript.GetComponent("Cart");
}

function Update ()
{
	SubTotalF = GetSubTotal();
	SubTotal.text = "Sub-Total: £" + GetSubTotal();
	
	_TheOrder.text = GetText();
}

function GetText ()
{
	var NewText : String;
	
	for ( var i = 0; i < CartScript.Cart.length; i++ )
	{
		NewText = NewText + "\n" + CartScript.Cart[i].GetComponent("item").Name;
	}
	return NewText;
}


function GetSubTotal ()
{
	var ToAdd = CartScript.TotalPrice * GetDeliveryMulti();
	
	return CartScript.TotalPrice + ToAdd;
}

function GetDeliveryMulti ()
{
	if ( ChosenDeliveryTime == 0 )
	{
		return SlowMultiplyer;
	}
	else if ( ChosenDeliveryTime == 1 )
	{
		return NormalMultiplyer;
	}
	else if ( ChosenDeliveryTime == 2 )
	{
		return FastMultiplyer;
	}
}