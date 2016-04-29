private var Open : boolean = false;
var Internet : Transform;

function Interact ()
{
	if ( Open == false )
	{
		GetComponent.<Animation>().CrossFadeQueued("Open");
		Open = true;
		Internet.GetComponent("Internet").PowerOn();
	}
	else if ( Open == true )
	{
		GetComponent.<Animation>().CrossFadeQueued("Close");
		Open = false;
	}
}

function Close ()
{
	Open = false;
	GetComponent.<Animation>().CrossFadeQueued("Close");
}