var Internet : Transform;
var InternetScript;

function Start ()
{
	InternetScript = Internet.GetComponent("Internet");
}


function OnMouseDown ()
{
	InternetScript.PowerOff();
}