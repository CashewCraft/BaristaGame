var SpawnPos : Transform;
var Slices : Transform[];
var CakeSlice : Transform;
private var SlicesLeft : int = 8;
private var CanSpawn : boolean = true;

function Interact ()
{
	if ( SlicesLeft > 0 && CanSpawn == true  )
	{
		SlicesLeft = SlicesLeft - 1;
		
		Instance();	
	}
}


function Update ()
{
	if ( SlicesLeft == 0 )
	{
		Destroy ( transform.gameObject );
	}
}


function Instance ()
{
	var TheSlice = transform.Find("Cake Slice_" + SlicesLeft);
	
	Instantiate( CakeSlice, SpawnPos.transform.position , SpawnPos.transform.rotation );
	
	RemoveSlice(TheSlice);
	
	CanSpawn = false;
	
	yield WaitForSeconds ( 2 );
	
	CanSpawn = true;
}

function RemoveSlice (slice : Transform)
{
	if ( SlicesLeft != 0 )
	{	
		Destroy ( slice.gameObject );
	}
}
