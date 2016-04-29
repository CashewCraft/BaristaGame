var ColorToChange : int;


function Start ()
{
	gameObject.GetComponent.<Renderer>().materials[ColorToChange].color = Color(Random.Range(0.0,1.0),Random.Range(0.0,1.0),Random.Range(0.0,1.0));	
}