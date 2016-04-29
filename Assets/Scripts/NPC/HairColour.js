private var Grey = Color32 ( 39, 39, 39, 255 );
private var Black = Color32 ( 4, 2, 2, 255 );
private var Brown = Color32 ( 19, 10, 6, 255 );
private var Red = Color32 ( 53, 15, 0, 255 );

private var RandomINT : int; 

function Start ()
{
	GetRandomINT();
	
	if ( RandomINT == 1 )
	{
		GetComponent.<Renderer>().material.color = Grey;
	}
	else if ( RandomINT == 2 )
	{
		GetComponent.<Renderer>().material.color = Black;
	}
	else if ( RandomINT == 3 )
	{
		GetComponent.<Renderer>().material.color = Brown;
	}
	else if ( RandomINT == 4 )
	{
		GetComponent.<Renderer>().material.color = Red;
	}
}

function GetRandomINT ()
{
	RandomINT = Random.Range( 0, 4 );
}