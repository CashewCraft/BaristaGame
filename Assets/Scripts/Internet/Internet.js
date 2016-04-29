var Computer : Transform;
var ComputerScript;
private var InternetHUD : Transform;
var IsInUse : boolean;
var PowerSound : AudioClip;
var Player : Transform;
var Reticle : GUITexture;
private var MainPage : Transform; 

var StuffToHide : Transform[];

var BeanWeb : Transform;

var ACursor : boolean;
var theCursor;

function Start ()
{
	
	ComputerScript = Computer.GetComponent("laptop_MainScript");
	InternetHUD = transform.Find("_MainBG");
	MainPage = transform.Find("_MainPage");
	theCursor = GetComponent("Cursor");
}

function Update ()
{
	if ( Input.GetKeyDown(KeyCode.Escape) && IsInUse == true )
	{
		PowerOff();
	}
	
	if ( ACursor == true )
	{
		GetComponent("Cursor").enabled = true;
		Cursor.lockState = CursorLockMode.None;
	}
	else
	{
		GetComponent("Cursor").enabled = false;
		Cursor.lockState = CursorLockMode.Locked;
	}
}


function PowerOn ()
{
	GetComponent.<AudioSource>().PlayOneShot( PowerSound );
	
	yield WaitForSeconds (0.3);
	
	InternetHUD.gameObject.SetActive(true);
	
	Player.GetComponent("CharacterMotor").enabled = false;
	Reticle.gameObject.SetActive(false);
	
	ACursor = true;
	IsInUse = true;
	
	for (a = 0; a < StuffToHide.length; a++)
	{
		StuffToHide[a].gameObject.SetActive(false);
	}
}

function PowerOff ()
{
	Player.GetComponent("CharacterMotor").enabled = true;
	GetComponent.<AudioSource>().PlayOneShot( PowerSound );
	InternetHUD.gameObject.SetActive(false);
	MainPage.gameObject.SetActive(false);
	ComputerScript.Close();
	
	Reticle.gameObject.SetActive(true);
	
	ACursor = false;
	IsInUse = false;
	
		for (a = 0; a < StuffToHide.length; a++)
	{
		StuffToHide[a].gameObject.SetActive(true);
	}
}

function ReturnToDesktop ()
{
	MainPage.gameObject.SetActive(false);
	InternetHUD.gameObject.SetActive(true);
}


function LoadBean ()
{
	theCursor.isLoading = true;
	yield WaitForSeconds ( 2 );
	BeanWeb.gameObject.SetActive(true);
	theCursor.isLoading = false;
	InternetHUD.gameObject.SetActive(false);
}