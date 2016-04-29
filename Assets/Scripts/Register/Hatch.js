var MasterContainer : Transform;
var CoinAddSound : AudioClip;
var MasterScript;
var IsOpen : boolean;

function Start ()
{
	MasterScript = MasterContainer.GetComponent("ShopData");
}


function OnTriggerEnter ( col : Collider )
{
	if ( col.transform.GetComponent("Cash") != null && IsOpen == true )
	{
		var ColValue : float;
		
		ColValue = col.transform.GetComponent( "Cash" ).Value;
		
		AddValue(ColValue);
		
		col.transform.GetComponent("Cash").Destroyz();
		col = null;
		
		AddCoinSound();
	}
}

function AddValue (Amount : float)
{
	MasterScript.AddAmount(Amount);
	
}

function AddCoinSound ()
{
	GetComponent.<AudioSource>().PlayOneShot( CoinAddSound );
}