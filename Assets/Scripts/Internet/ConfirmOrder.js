var HasConfirmed : boolean;
var MainContainer : Transform;
var MainScript;
var Checkout : Transform;
var CheckoutScript;
private var ShopCash : float;
private var OrderCost : float;
var TruckSpawn : Transform;
var TruckSpawnScript;
var Thanks : Transform;

private var Dslow = 1440;
private var Dnormal = 360;
private var Dfast = 60;

var Cart : Transform;
var CartScript;

function Start ()
{
	MainScript = MainContainer.GetComponent("ShopData");
	ShopCash = MainScript.Balence;
	CheckoutScript = Checkout.GetComponent("CheckoutDialogue");
	TruckSpawnScript = TruckSpawn.GetComponent("NPC_InstantiateTruck");
	CartScript = Cart.GetComponent("Cart");
}

function Update ()
{
	OrderCost = CheckoutScript.SubTotalF;
}


function OnMouseDown ()
{
	if ( ShopCash >= OrderCost)
	{
		MainScript.Balence = MainScript.Balence - OrderCost;
		Confirm();
	}
}

function GetDeliveryTimeSecs ()
{
	if ( CheckoutScript.ChosenDeliveryTime == 0 )
	{
		return Dslow;
	}
	else if ( CheckoutScript.ChosenDeliveryTime == 1 )
	{
		return Dnormal;
	}
	else if ( CheckoutScript.ChosenDeliveryTime == 2 )
	{
		return Dfast;
	}
}

function Confirm ()
{
	var DeliveryTime = GetDeliveryTimeSecs();
	var Order = CartScript.Cart;
	
	TruckSpawnScript.DispatchTruck(DeliveryTime, Order);
	Thanks.gameObject.SetActive(true);
	Checkout.gameObject.SetActive(false);

}