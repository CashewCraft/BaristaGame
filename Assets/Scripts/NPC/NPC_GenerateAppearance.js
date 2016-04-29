private var SkinINT : int;

var ShirtINTDebug : int;
var SkinINTDebug : int;


function Start ()
{
	ShirtColor();
	
	GetSkinColor();
	SetSkinColor();
}

function GetSkinColor ()
{
	SkinINT = Random.Range( 1, 3 );
}

function SetSkinColor ()
{
	if ( SkinINT == 1 )
	{
		gameObject.GetComponent.<Renderer>().materials[SkinINTDebug].color = Color32( 90, 55, 35, 0 );
	}
	else if ( SkinINT == 2 )
	{
		gameObject.GetComponent.<Renderer>().materials[SkinINTDebug].color = Color32( 214, 138, 94, 0 );
	}
	else if ( SkinINT == 3 )
	{
		gameObject.GetComponent.<Renderer>().materials[SkinINTDebug].color = Color32( 255, 255, 255, 0 );
	}
	
}

function ShirtColor ()
{
	gameObject.GetComponent.<Renderer>().materials[ShirtINTDebug].color = Color(Random.Range(0.0,1.0),Random.Range(0.0,1.0),Random.Range(0.0,1.0));	
}