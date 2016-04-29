
var Text : GUITexture;
var Selected : GUITexture;

var Select : AudioClip;


function OnMouseOver () 
{
	Selected.gameObject.SetActive(true);

}

function OnMouseExit ()
{
	Selected.gameObject.SetActive(false);
	
}


function OnMouseDown ()
{

	GetComponent.<AudioSource>().PlayOneShot(Select);
	
	yield WaitForSeconds (0.75);
	
	Application.Quit();
	
	

}
