var Balence : float;
var GUIMoney : GUIText;
var PlayerName : String;
var GUIAddMoney : GUIText;
var NumberOfCustomers : float;
var MaxCapacity : float;
var CustomerCheck : Transform;

var CurEXP : int;
var Level : int;
var RequiredEXP : int;
var oldlevel = Level;
var EXPBar : Transform;
var NewEXPUnit : float;
var LevelGUI : GUIText;
var LevelUpSound : AudioClip;
var AddMoneySound : AudioClip;

function Start ()
{
	UnityEngine.Cursor.visible = false;
}


function Update ()
{
	NumberOfCustomers = CustomerCheck.GetComponent("CustomerCheck").NumberOfCustomers;
	GUIMoney.text = "£" + Balence;
	
	if ( CurEXP >= RequiredEXP )
	{
		if ( CurEXP > RequiredEXP )
		{
			CurEXP = GetOverFlow();
			LevelUp();
			
		}
	}
	
	NewEXPUnit = 1.0 / RequiredEXP;
	
	if ( CurEXP < RequiredEXP )
	{
		EXPBar.transform.localScale.x = NewEXPUnit * CurEXP;
	}
	else
	{
		EXPBar.transform.localScale.x = 0;
	}
	
	Balence = Mathf.Round(Balence * 10) / 10;
	LevelGUI.text = Level.ToString();

	
}

function LevelUp ()
{
	Level = Level + 1;
	RequiredEXP = RequiredEXP * 2;
	GetComponent.<AudioSource>().PlayOneShot(LevelUpSound);
	
}

function AddAmount ( Amount : float )
{
	Balence = Balence + Amount;
	GUIAddMoney.gameObject.SetActive(true);
	GetComponent.<AudioSource>().PlayOneShot(AddMoneySound);
	GUIAddMoney.text = "+£" + Amount;
	yield WaitForSeconds (1.5);
	GUIAddMoney.gameObject.SetActive(false);
}

public function AddEXP ( EXPtoAdd : int )
{
	CurEXP = CurEXP + EXPtoAdd;
}

function GetOverFlow ()
{
	return CurEXP - RequiredEXP;
}