private var TOD : GameObject;
var TODScript; 

function Start ()
{
	TOD = GameObject.Find("TOD");
	TODScript = TOD.GetComponent("TOD");
}


function Update ()
{
	if ( TODScript.Hour >= 19 || TODScript.Hour < 5 )
	{
		GetComponent.<AudioSource>().enabled = true;
	}
	else
	{
		GetComponent.<AudioSource>().enabled = false;
	}
}