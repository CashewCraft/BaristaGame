var ToolName : String;

var IsPickedUp : boolean;
private var IsTool : boolean = true;
private var ToolPos : Transform;

function Interact (ToolBone : Transform)
{
	IsPickedUp = true;
	ToolPos = ToolBone.transform;
	transform.GetComponent.<Rigidbody>().detectCollisions = false;
	transform.GetComponent.<Rigidbody>().isKinematic = true;
	Attatch();
	
}

function Attatch ()
{
	transform.parent = ToolPos.transform;
	transform.position = ToolPos.transform.position;
	transform.localRotation = Quaternion.Euler(0,0,0);
}

function Drop ()
{
	IsPickedUp = false;
	transform.parent = null;
	transform.GetComponent.<Rigidbody>().detectCollisions = true;
	transform.GetComponent.<Rigidbody>().isKinematic = false;
}

function Update ()
{
	if ( IsPickedUp )
	{
		if (Input.GetButtonDown("Interact") )
		{
			Drop();
		}
		if (Input.GetButton("Fire1") )
		{
			transform.GetComponent(ToolName + "_ToolScript").PrimaryFunction();
		}
		if (Input.GetButton("Fire2") )
		{
			transform.GetComponent(ToolName + "_ToolScript").SecondaryFunction();
		}
	}
}