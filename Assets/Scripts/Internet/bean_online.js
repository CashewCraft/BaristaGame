var Internet : Transform;
var InternetScript;
var ClickSound : AudioClip;

function Start ()
{
	InternetScript = Internet.GetComponent("Internet");
}

function OnMouseDown ()
{
	GetComponent.<AudioSource>().PlayOneShot(ClickSound);
	InternetScript.LoadBean();
}