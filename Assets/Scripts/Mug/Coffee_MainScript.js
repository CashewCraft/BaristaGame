var FillSmoothing : float;

var Full : boolean;
var FullPoint : Transform;
var Plate : Transform;

var Steam : Transform;


var Cream : Transform;
var CreamAdded : boolean;
var FullPoint_Cream : Transform;

var FillPointY : float;
var CreamFillPointY : float;

var IsFilling : boolean;

var AddingCream : boolean;

var Nozzel : GameObject;

private var Mug : Transform;
private var MugInfo;

private var HasEditedCreamString : boolean;


function Start ()
{
	Mug = transform.parent;
	MugInfo = Mug.GetComponent("Mug_Info");
	
	Nozzel = GameObject.Find("Coffee_Nozzel");
	Steam.gameObject.SetActive(false);
}



function Update () 
{
	if ( Nozzel != null && IsFilling == true )
	{
			var CoffeeEndY : Vector3 = new Vector3( FullPoint.transform.position.x, FullPoint.transform.position.y, FullPoint.transform.position.z );

	
			transform.position = Vector3.Lerp( transform.position, CoffeeEndY, FillSmoothing * Time.deltaTime);
			
			
	}
	if ( transform.localPosition.y >= FillPointY )
	{
		Full = true;
		IsFilling = false;
	}
	
	
	if (  Nozzel != null && AddingCream == true )
	{
			Cream.gameObject.SetActive(true);
			var CreamEndY : Vector3 = new Vector3( FullPoint_Cream.transform.position.x, FullPoint_Cream.transform.position.y, FullPoint_Cream.transform.position.z );

	
			Cream.transform.position = Vector3.Lerp( Cream.transform.position, CreamEndY, FillSmoothing * Time.deltaTime);
	}
	if ( Cream.transform.localPosition.y >= CreamFillPointY )
	{
		CreamAdded = true;
		AddingCream = false;
		
		if ( HasEditedCreamString == false )
		{
			AddCreamToString();
		}
	}

	
}

function Fill ()
{
	Nozzel = GameObject.Find("Coffee_Nozzel");
	Steam = transform.Find("Steam");
	
	Nozzel.GetComponent("Coffee_Nozzel_MainScript").IsFilling == true;
	Steam.gameObject.SetActive(true);
}

function AddCreamToString ()
{
	MugInfo.Contents = MugInfo.Contents + " + Cream";
	HasEditedCreamString = true;
	
}
