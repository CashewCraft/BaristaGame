var Contents : String;
var BestBefore : int;
var IsRefridgerated : boolean;
private var IsMouldy : boolean;
private var LifeTimer : int;
var IsFood : boolean;

var IsFull : boolean = true;
var Fullness : int = 100;
var NomSound : AudioClip;
private var ParSys : Transform;

//
private var isTicking : boolean;

function Start ()
{
	ParSys = transform.Find("ParSys");
}

function Update ()
{
	if ( isTicking == false && IsRefridgerated == false )
	{
		Tick();
	}
	
	if ( LifeTimer >= BestBefore )
	{
		IsMouldy = true;
	}
	
	if ( Fullness > 0 )
	{
		IsFull = true;
	}
	if ( Fullness <= 0 )
	{
		FinalNom();
	}
}


function Tick ()
{
	isTicking = true;
	
	yield WaitForSeconds ( 1 );
	
	LifeTimer = LifeTimer + 1;
	
}

function FinalNom ()
{
	GetComponent.<AudioSource>().PlayOneShot(NomSound);
	yield Par();
	IsFull = false;
	transform.active = false;
}

function Empty ( Amount : int )
{
	GetComponent.<AudioSource>().PlayOneShot(NomSound);
	Par();

	if ( IsFull )
	{
		Fullness = Fullness - Amount;
		
	}
	
}

function Par ()
{
	ParSys.active = true;
	yield WaitForSeconds (1.5);
	ParSys.active = false;
}
