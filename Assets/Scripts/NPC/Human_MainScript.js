
var FirstNames_M : String[];
var FirstNames_F : String[];
var LastNames : String[]; 
var Gender : int;		// 0 = Male, 1 = Female.

var Refridgerator : GameObject;
var FridgeScript;

private var FirstName : String;
private var LastName : String;


var Stuff = [ "Latte", "Latte + Cream", "Cappuccino", "Cappuccino + Cream", "Mocha", "Mocha + Cream", "Strawberry Donut", "Muffin", "Brownie", "Yum-Yum", " "];
var Prices = [ 1.50, 2.00, 2.00, 2.50, 2.50, 3.00, 0.50, 1.00, 1.50, 1.00, 0.00 ];
var IsFood = [ 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0 ]; 
var ThinkingSounds_M : AudioClip[];
var ThinkingSounds_F : AudioClip[];

var StuffIndex : int;

private var HasServed : boolean;

private var Order1Price : float; 
private var Order2Price : float; 
private var Order3Price : float;


private var MoneySpawn : GameObject;
var MasterScript;

private var TotalPrice : float;

var OrderNum1 : String; 
var OrderNum2 : String; 
var OrderNum3 : String;

private var HasOrdered : boolean;

private var Tray : Transform;
private var TrayScript; 

var CoinPickScript;


private var Total : int;


var HasPaid : boolean;

var IsStay : boolean;

//GUI
var NotePad : GameObject;
var NotePadScript;

var Order1GUI : GameObject;
var Order2GUI : GameObject;
var Order3GUI : GameObject;
var NameGUI : GameObject;

var HasOrder1 : boolean;
var HasOrder2 : boolean;
var HasOrder3 : boolean;

var OrderDelay : float;

function Start ()
{

	Order1GUI = GameObject.Find ("Order1GUI");
	Order2GUI = GameObject.Find ("Order2GUI");
	Order3GUI = GameObject.Find ("Order3GUI");
	TakeAway = GameObject.Find ("TakeAway");
	
	NotePad = GameObject.Find ("Order-Notepad");
	NotePadScript = NotePad.GetComponent("Notepad");
	
	Tray = transform.Find("Tray");
	TrayScript = Tray.GetComponent("Tray_MainScript");

	MasterScript = GameObject.Find("Master Script Container").GetComponent("ShopData");
	Refridgerator = GameObject.Find("refridgerator");
	FridgeScript = Refridgerator.GetComponent("Refridgerator");
	
	GenerateName();
	
	
}



function Interact ()
{
	if ( gameObject.GetComponent("NPC_Move").IsInfront == true && HasOrdered == false )
	{
		GetOrder1();
	}
}



function GenerateName ()
{
	if ( Gender == 0 )
	{
		FirstName = FirstNames_M[ Random.Range( 0, FirstNames_M.Length ) ];
	}
	else if ( Gender == 1 )
	{
		FirstName = FirstNames_F[ Random.Range( 0, FirstNames_F.Length ) ];
	}
	
	LastName = LastNames[ Random.Range( 0, LastNames.Length ) ];
}

function OrderAvailable (TheOrder : String)
{
	for ( a = 0; a < FridgeScript.Contents.length; a++ )
	{
		if ( FridgeScript.Contents[a] == TheOrder )
		{
			return true;
		}
		else if ( FridgeScript.Contents[FridgeScript.Contents.length -1] != TheOrder )
		{
			return false;
		}
	}
}

function GetOrder1 ()
{	
	GetRandom();
	
	if ( IsFood[StuffIndex] == 1 )
	{
		if ( OrderAvailable(Stuff[StuffIndex]) )
		{
			OrderNum1 = Stuff[StuffIndex];
	
			Order1Price = Prices[StuffIndex];

	
			HasOrder1 = true;
	
			GetOrder2();
		}
		else
		{
			GetOrder1();
		}
	}
	else
	{
		OrderNum1 = Stuff[StuffIndex];
	
		Order1Price = Prices[StuffIndex];

	
		HasOrder1 = true;
	
		GetOrder2();
	}
}

function GetOrder2 ()
{
	GetRandom();
	
	if ( IsFood[StuffIndex] == 1 )
	{
		if ( OrderAvailable(Stuff[StuffIndex]) )
		{
			OrderNum2 = Stuff[StuffIndex];
	
			Order2Price = Prices[StuffIndex];
	
			HasOrder2 = true;
	
			GetOrder3();
		}
		else
		{
			GetOrder2();
		}
	}
	else
	{
		OrderNum2 = Stuff[StuffIndex];
	
		Order2Price = Prices[StuffIndex];
	
		HasOrder2 = true;
	
		GetOrder3();
	}
}

function GetOrder3 ()
{
	GetRandom();
	
	if ( IsFood[StuffIndex] == 1 )
	{
		if ( OrderAvailable(Stuff[StuffIndex]) )
		{
			OrderNum3 = Stuff[StuffIndex];
	
			Order3Price = Prices[StuffIndex];
	
			HasOrder3 = true;
		}
		else
		{
			GetOrder3();
		}
	}
	else
	{
		OrderNum3 = Stuff[StuffIndex];
	
		Order3Price = Prices[StuffIndex];
	
		HasOrder3 = true;

	}
}



function GetRandom ()
{
	StuffIndex = Random.Range( 0, Stuff.Length );
}



function GetTotalPrice ()
{
	
	Total = ( Order1Price + Order2Price + Order3Price );
	
}


function PrintOrder ()
{
	HasOrdered = true;
	
	NotePadScript.IsOpen = true;
	
	NotePadScript.Order1GUI.text = OrderNum1;
	NotePadScript.Order2GUI.text = OrderNum2;
	NotePadScript.Order3GUI.text = OrderNum3;
	NotePadScript.NameGUI.text = FirstName + " " + LastName;
	
	if ( IsStay )
	{
		NotePadScript.TakeAwayGUI.text = "To Stay";
	}
	else if ( !IsStay )
	{
		NotePadScript.TakeAwayGUI.text = "To Take Away";
	}
	
	
	TrayScript.Order1 = OrderNum1;
	TrayScript.Order2 = OrderNum2;
	TrayScript.Order3 = OrderNum3;
	
	GetTotalPrice();
	
	if ( Gender == 0 )
	{
		GetComponent.<AudioSource>().PlayOneShot( ThinkingSounds_M[Random.Range(0, ThinkingSounds_M.Length)] );
	}
	else
	{
		GetComponent.<AudioSource>().PlayOneShot( ThinkingSounds_F[Random.Range(0, ThinkingSounds_F.Length)] );
	}
	
}


function Pay()
{
	
	MasterScript.AddAmount(Total);
    HasPaid = true;
    
}



function Update ()
{
	if ( HasOrder1 == true && HasOrder2 == true && HasOrder3 == true && HasOrdered == false )
	{
		PrintOrder();
	}
	
	
	if ( HasPaid == true )
	{
		TrayScript.HasServed = true;
		HasServed = true;
	}
	
}