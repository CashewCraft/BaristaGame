var IsOpen : boolean;

var NotePad : GUITexture;

var DeploySound : AudioClip;

var InternetInUse : boolean;

var OldX : float;
var NewX : float;

var EXPYOld : float;
var EXPYNew : float;


//GUI

var Order1GUI : GUIText;
var Order2GUI : GUIText;
var Order3GUI : GUIText;
var TakeAwayGUI : GUIText;
var NameGUI : GUIText;
var GUIMoney : GUIText;
var GUIHelp : Transform;
var EXPBar : Transform;


function Update ()
{
	if ( GameObject.Find("Internet").GetComponent("Internet").IsInUse == true )
	{
		InternetInUse = true;
	}
	else
	{
		InternetInUse = false;
	}
	
	if ( IsOpen == true && InternetInUse == false )
	{
		NotePadDeploy();
	}
	else
	{
		NotePadRetract();
	}
	
	if ( Input.GetButtonDown("Notes") )
	{
		if ( IsOpen == false )
		{
			IsOpen = true;
		}
		else if ( IsOpen == true )
		{
			IsOpen = false;
		}
		if ( !InternetInUse )
		{
			GetComponent.<AudioSource>().PlayOneShot( DeploySound );
		}
	}
}


function NotePadDeploy ()
{
	
	NotePad.transform.position.x = NewX;
	Order1GUI.gameObject.SetActive(true);
	Order2GUI.gameObject.SetActive(true);
	Order3GUI.gameObject.SetActive(true);
	TakeAwayGUI.gameObject.SetActive(true);
	NameGUI.gameObject.SetActive(true);
	GUIHelp.gameObject.SetActive(true);
	EXPBar.transform.position.y = EXPYNew;


	
}

function NotePadRetract ()
{
	NotePad.transform.position.x = OldX;
	Order1GUI.gameObject.SetActive(false);
	Order2GUI.gameObject.SetActive(false);
	Order3GUI.gameObject.SetActive(false);
	TakeAwayGUI.gameObject.SetActive(false);
	GUIHelp.gameObject.SetActive(false);
	NameGUI.gameObject.SetActive(false);
	EXPBar.transform.position.y = EXPYOld;
	

}
