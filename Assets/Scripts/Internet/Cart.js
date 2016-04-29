var Cart = new Array ();
var TotalPrice : float;
var PName : GUIText;
var MasterTransform : Transform;
var MasterScript;
var SubTotal : GUIText;

var Checkout : Transform;
var Items : Transform[];
var CartTransform : Transform;
var CheckoutDialogue : Transform;

var CurrentPage : int;
var Pages : Transform[];
var BackPage : GUIText;
var NextPage : GUIText;

var PageMovement : Transform[];
var AtCheckout : boolean;

function Start ()
{
	MasterScript = MasterTransform.GetComponent("ShopData");
	PageRefresh();
}

function PageRefresh ()
{
	var LoopCheck = 0;
	
	for ( var i = 0; i < Pages.Length; i++ )
	{
		Pages[i].gameObject.SetActive(false);
		LoopCheck = LoopCheck + 1;
	}
	
	if ( LoopCheck == Pages.Length )
	{
		LoopCheck = 0;
		Pages[CurrentPage].gameObject.SetActive(true);
	}
	
}

function Update ()
{	
	SubTotal.text = "£" + TotalPrice.ToString();
	PName.text = "Welcome back, " + (MasterScript.PlayerName) + "!";
	
	if (!AtCheckout)
	{
		if ( CurrentPage >= 1 )
		{
			BackPage.gameObject.SetActive(true);
		}
		else if (CurrentPage < 1 )
		{
			BackPage.gameObject.SetActive(false);	
		}
		if ( CurrentPage < Pages.Length && CurrentPage != Pages.Length -1 )
		{
			NextPage.gameObject.SetActive(true);
		}
		else if ( CurrentPage == Pages.Length - 1 )
		{
			NextPage.gameObject.SetActive(false);
		}
	}
}

function Reset ()
{
	TotalPrice = 0;
	Cart.length = 0;
	AtCheckout = false;
	
}

function ProceedtoCheckout ()
{
	CheckoutDialogue.gameObject.SetActive(true);
	HideExtras();
	AtCheckout = true;
	
}

function ShowExtras ()
{
	Checkout.gameObject.SetActive(true);
	PageRefresh();
	CartTransform.gameObject.SetActive(true);
	PageMovement[0].gameObject.SetActive(true);
	PageMovement[1].gameObject.SetActive(true);
	
	// Hide checkout dialogue
	CheckoutDialogue.gameObject.SetActive(false);
}

function HideExtras ()
{
	Checkout.gameObject.SetActive(false);
	
	PageMovement[0].gameObject.SetActive(false);
	PageMovement[1].gameObject.SetActive(false);
	
	for (var o = 0; o < Items.Length; o++)
	{
		Items[o].gameObject.SetActive(false);
	}
	
	CartTransform.gameObject.SetActive(false);
}