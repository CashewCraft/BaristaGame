
function Start () 
{
	Door1();
	Door2();
	Base();
}

function Door1 ()
{
	GetComponent.<Renderer>().materials[6].color = Color(Random.Range(0.0,1.0),Random.Range(0.0,1.0),Random.Range(0.0,1.0));
}

function Door2 ()
{
	GetComponent.<Renderer>().materials[13].color = Color(Random.Range(0.0,1.0),Random.Range(0.0,1.0),Random.Range(0.0,1.0));
}

function Base ()
{
	GetComponent.<Renderer>().materials[8].color = Color(Random.Range(0.0,1.0),Random.Range(0.0,1.0),Random.Range(0.0,1.0));
}

