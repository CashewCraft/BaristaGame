var IsFilling : boolean;
var AddingCream : boolean;

var AddedCream : boolean;

var IsAddingStuff : boolean;

var Coffee : Transform;
var CoffeeScript;
var CoffeeContents;

var Plate : Transform;

var Amount : int;

var NozzelCoffee : Transform;


var HasFulled : boolean;

var FillSound : AudioClip;

var isAudioPlaying : boolean;


function OnTriggerEnter ( col : Collider )
{
	if ( col.name == "Mug" && Plate.GetComponent("CoffeePlate_MainScript").HasMug == false )
	{	
		Coffee = col.transform.Find("Coffee");
		CoffeeScript = Coffee.GetComponent("Coffee_MainScript");
		
		CoffeeContents = col.transform.GetComponent("Mug_Info");
	}
}



function UnParent ()
{
	Coffee = null;
	CoffeeScript = null;
}




function Update ()
{

	if (( IsFilling == true || AddingCream == true ))
	{
		NozzelCoffee.transform.gameObject.SetActive(true);
		
	}
	else
	{
		NozzelCoffee.transform.gameObject.SetActive(false);
		
	}
	
	
	if ( Coffee != null && CoffeeScript.Full == true )
	{
		IsFilling = false;
	}
	if ( Coffee != null && CoffeeScript.CreamAdded == true )
	{
		AddingCream = false;
	}
	
	
	if (( AddingCream == true || IsFilling == true ))
	{
		IsAddingStuff = true;
	}
	else 
	{
		IsAddingStuff = false;
	}
	
	if ( Coffee != null && CoffeeScript.Full == true )
	{
		HasFulled = true;
	}
	else
	{
		HasFulled = false;
	}
	
	if ( Coffee != null && CoffeeScript.CreamAdded == true )
	{
		AddedCream = true;
	}
	else
	{
		AddedCream = false;
	}
	
	
	

}



function PlaySound()
{
	isAudioPlaying = true;

	GetComponent.<AudioSource>().clip = (FillSound);
	
	GetComponent.<AudioSource>().Play();
	
	yield WaitForSeconds (GetComponent.<AudioSource>().clip.length);
	
	isAudioPlaying = false;
}





function FillLatte ()
{
	
	if ( CoffeeScript.Full == false )
	{	
		CoffeeContents.Contents = "Latte";
		
		Amount = Amount - 1;
		
		IsFilling = true;
		
		CoffeeScript.IsFilling = true;
		
		NozzelCoffee.GetComponent.<Renderer>().material.color = Color32(107, 92, 51, 0);
		Coffee.GetComponent.<Renderer>().material.color = Color32 (107, 92, 51, 0);
		
		CoffeeScript.Fill();
	}

}

function FillCappuccino ()
{
	
	if ( CoffeeScript.Full == false )
	{	
		CoffeeContents.Contents = "Cappuccino";
			
		Amount = Amount - 2;
			
		IsFilling = true;
		
		CoffeeScript.IsFilling = true;
		
		NozzelCoffee.GetComponent.<Renderer>().material.color = Color32(73, 61, 20, 255);
		Coffee.GetComponent.<Renderer>().material.color = Color32(73, 61, 20, 255);
		
		CoffeeScript.Fill();
	}

}

function FillMocha ()
{
	if ( CoffeeScript.Full == false )
	{
		CoffeeContents.Contents = "Mocha";
		
		Amount = Amount - 3;
		
		IsFilling = true;
		
		CoffeeScript.IsFilling = true;
		
		NozzelCoffee.GetComponent.<Renderer>().material.color = Color32(28, 22, 6, 255);
		Coffee.GetComponent.<Renderer>().material.color = Color32(28, 22, 6, 255);
		
		CoffeeScript.Fill();

	}
}

function FillCream ()
{
		
	if ( CoffeeScript.Full == true && CoffeeScript.CreamAdded == false )	
	{	
		AddingCream = true;
		
		CoffeeScript.AddingCream = true;
		
		NozzelCoffee.GetComponent.<Renderer>().material.color = Color32(255, 255, 255, 255);
		
		CoffeeScript.Fill();
	}

}
