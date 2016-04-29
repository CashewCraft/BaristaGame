var Name : String;
var IsOpen : boolean;
var ContentsOBJ : Transform;
var Quantity : int;
var Lid : Transform;
var FoodPlane : Transform;
var OpenSound : AudioClip;
var IsTool : boolean = false;

var SpawnPos : Vector3;

var IsMounted : boolean;

function Start ()
{
	Lid = transform.Find("BoxLid");
	FoodPlane = transform.Find("Box_FoodLayer");
}

function Update ()
{
	SpawnPos = new Vector3 ( transform.position.x, transform.position.y + 0.5, transform.position.z + 0.4 );
	if ( IsMounted )
	{
		gameObject.tag = "Interactable";
	}
	else
	{
		gameObject.tag = "Moveable";
	}
}

function Interact ()
{
	if ( IsMounted )
	{	
		if ( !IsOpen )
		{
			Open();
		}
		else if ( IsOpen && Quantity > 0 )
		{
			Spawn();
		}
		if ( Quantity == 0 )
		{
			PickUp();
		}
	}
}

function Spawn ()
{
	Instantiate( ContentsOBJ, SpawnPos, transform.rotation );
	Quantity = Quantity - 1;
}

function Open ()
{
	Destroy( Lid.gameObject );
	IsOpen = true;
	GetComponent.<AudioSource>().PlayOneShot(OpenSound);
}

function PickUp ()
{
	IsMounted = false;
	transform.parent = null;
	GetComponent.<Rigidbody>().isKinematic = false;
	GetComponent.<Rigidbody>().useGravity = true;
}