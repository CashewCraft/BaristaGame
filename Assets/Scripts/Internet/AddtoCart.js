private var Price : float;
private var Contents : Transform;
var ThisObject : Transform;
var CartScript;
var _MainPage : Transform;
var HasAdded : boolean;
var TheItem : Transform;
var ItemScript;
var text : GUIText;



function Start ()
{
	CartScript = _MainPage.GetComponent("Cart");
	ItemScript = TheItem.GetComponent("item");
	Price = ItemScript.Price;
	Contents = ItemScript.Contents;
	
}


function OnMouseDown ()
{
	if ( !HasAdded )
	{
		CartScript.Cart.Push(ThisObject);
		HasAdded = true;
		CartScript.TotalPrice = CartScript.TotalPrice + ItemScript.Price;
	}
	else
	{
		CartScript.Cart.Remove(ThisObject);
		HasAdded = false;
		CartScript.TotalPrice = CartScript.TotalPrice - ItemScript.Price;
		
	}

	
}

function Update ()
{
	if ( HasAdded )
	{
		text.text = "Added";
	}
	else
	{
		text.text = "Add to Basket";
	}
}