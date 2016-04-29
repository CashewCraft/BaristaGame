var IsOccupied : boolean;

var object : Transform;

function OnTriggerEnter ( col : Collider )
{
	if ( col.transform.GetComponent("box_MainScript") != null )
	{	
		if ( !IsOccupied  )
		{
			col.transform.position = transform.position;
			col.transform.rotation = transform.rotation;
			col.transform.parent = transform;
			col.GetComponent.<Rigidbody>().isKinematic = true;
			col.GetComponent("box_MainScript").IsMounted = true;
			
			object = col.transform;
			IsOccupied = true;
		}
	}
}

function Update ()
{
	if ( transform.childCount == 0 )
	{
		IsOccupied = false;
	}
}
