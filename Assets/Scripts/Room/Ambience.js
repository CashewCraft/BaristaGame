var ShopData;
private var MaterScriptContainer : GameObject;
var AmbienceVolume = float;
var PercentageFull : float;
var Sound : AudioClip;

function Start ()
{
	ShopData = GameObject.Find("Master Script Container").GetComponent("ShopData");
	GetComponent.<AudioSource>().clip = (Sound);
	GetComponent.<AudioSource>().Play();
}

function Update ()
{
	if (ShopData.NumberOfCustomers > 1)
	{
		PercentageFull = ShopData.NumberOfCustomers / ShopData.MaxCapacity * 100;
		GetComponent.<AudioSource>().volume = 0.005 * PercentageFull;
	}
	else
	{
		GetComponent.<AudioSource>().volume = 0;
	}
}
