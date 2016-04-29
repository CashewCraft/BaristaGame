private var Lamp : Transform;
private var TOD : GameObject;
var TODScript; 

function Start ()
{
	Lamp = transform.Find("light");
	TOD = GameObject.Find("TOD");
	TODScript = TOD.GetComponent("TOD");
}


function Update ()
{
	if ( TODScript.Hour >= 19 || TODScript.Hour < 5 )
	{
		Lamp.gameObject.SetActive(true);
	}
	else
	{
		Lamp.gameObject.SetActive(false);
	}
}