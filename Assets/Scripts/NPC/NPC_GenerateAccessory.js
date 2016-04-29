//Mouth\\
private var Fag : Transform;
private var Moustache : Transform;

//Hat\\
private var TopHat : Transform;
private var Afro : Transform;
private var BaseballHat : Transform;
private var StubbyHair : Transform;
private var MoreStubby : Transform;

//Eyes\\
private var GlassesSquare : Transform;
private var SunGlasses : Transform;


private var TheHat : Transform;
private var TheMouth : Transform;
private var TheEyes : Transform;


var HatPos : Transform;
var EyePos : Transform;
var MouthPos : Transform;

var Hats : Transform[];
var Mouths : Transform[];
var Eyes : Transform[];


private var HatIndex : int;
private var MouthIndex : int;
private var EyeIndex : int;


private var HasChosenHat : boolean;
private var HasChosenMouth : boolean;
private var HasChosenEyes : boolean;
private var HasInstantiated : boolean;


function Start ()
{
	HatPos = transform.Find("HatPos");
	EyePos = transform.Find("EyePos");
	MouthPos = transform.Find("MouthPos");
	
}



function Update ()
{
	if ( HasChosenHat == false )
	{
		GetHat();
	}
	
	if ( HasChosenMouth == false )
	{
		GetMouth();
	}
	
	if ( HasChosenEyes == false )
	{
		GetEyes();
	}
	
	
	if ( HasChosenHat == true && HasChosenMouth == true )
	{
		if ( HasInstantiated == false )
		{
			InstatiateAccessory();
		}
	}
}




function GetHat ()
{
	HatIndex = Random.Range( 0, Hats.Length );
	
	TheHat = Hats[HatIndex];
	
	HasChosenHat = true;
	
}

function GetEyes ()
{
	EyeIndex = Random.Range( 0, Eyes.Length );
	
	TheEyes = Eyes[EyeIndex];
	
	HasChosenEyes = true;
	
}

function GetMouth ()
{
	MouthIndex = Random.Range( 0, Mouths.Length );
	
	TheMouth = Mouths[MouthIndex];
	
	HasChosenMouth = true;

}


function InstatiateAccessory ()
{
		
		var Hat = new Instantiate ( TheHat, HatPos.transform.position, Quaternion.identity );
		
		Hat.transform.parent = HatPos.transform;
	

	
		var Mouth = new Instantiate ( TheMouth, MouthPos.transform.position, Quaternion.identity );
		
		Mouth.transform.parent = MouthPos.transform;
		
		var Eyes = new Instantiate ( TheEyes, EyePos.transform.position, Quaternion.identity );
		
		Eyes.transform.parent = EyePos.transform;
		
		
		HasInstantiated = true;
		
		
	
}