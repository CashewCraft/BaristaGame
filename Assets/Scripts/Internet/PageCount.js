var Type : String;
var MainScript;

function Start ()
{
	MainScript = GameObject.Find("_MainPage").GetComponent("Cart");
}

function OnMouseDown ()
{
	if ( Type == "Next" && MainScript.CurrentPage < MainScript.Pages.Length)
	{
		MainScript.CurrentPage = MainScript.CurrentPage + 1;
		MainScript.PageRefresh();
	}
	else if ( Type == "Back" && MainScript.CurrentPage > 0 )
	{
		MainScript.CurrentPage = MainScript.CurrentPage - 1;
		MainScript.PageRefresh();
	}
}