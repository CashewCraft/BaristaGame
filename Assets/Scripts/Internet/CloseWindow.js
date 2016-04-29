var Internet : Transform;
var ClickSound : AudioClip;

function OnMouseDown ()
{
	GetComponent.<AudioSource>().PlayOneShot(ClickSound);
	Internet.GetComponent("Internet").ReturnToDesktop();
}