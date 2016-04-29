var Contents : String;
var IsFull : boolean;
var Fullness : int = 100;
var PerCent : float = 0.0001809896;
var Coffee : Transform;
var NomSound : AudioClip;
var Cream : Transform;
var IsTakeAway : boolean;
var Lid : Transform;
var IsFood : boolean;

function Start ()
{
	if ( transform.Find("Coffee") != false )
	{
		Coffee = transform.Find("Coffee");
	}
	
	if ( transform.Find("cream") != false )
	{
		Cream = transform.Find("cream");
	}
	
	if ( transform.Find("Mug_Lid") != null )
	{
		Lid = transform.Find("Mug_Lid");
	}
	
}

function AddLid ()
{
	Lid.gameObject.SetActive(true);
}

function Update ()
{
	if ( Fullness > 0 )
	{
		IsFull = true;
	}
	if ( Fullness <= 0 )
	{
		IsFull = false;
		transform.gameObject.SetActive(false);
	}
}

function Empty ( Amount : int )
{
	GetComponent.<AudioSource>().PlayOneShot(NomSound);
	
	if ( Cream != null)
	{
		Cream.gameObject.SetActive(false);
	}
	
	if ( IsFull )
	{
		Fullness = Fullness - Amount;
	
		if ( Coffee != null )
		{
			Coffee.transform.localPosition.y = Coffee.transform.localPosition.y - PerCent * Amount;
		}
	}
}
