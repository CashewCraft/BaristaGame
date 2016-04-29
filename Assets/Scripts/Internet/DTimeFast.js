var DTime : Transform;
var IsTicked : boolean;

var T : Texture2D;
var F : Texture2D;

function OnMouseDown ()
{
	DTime.GetComponent("DTimes").DTime = 2;
}

function Update ()
{
	if ( IsTicked )
	{
		GetComponent.<GUITexture>().texture = T;
	}
	else
	{
		GetComponent.<GUITexture>().texture = F;
	}
}