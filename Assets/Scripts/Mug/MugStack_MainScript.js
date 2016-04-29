var Mug : Transform;
var SpawnPoint : Transform;

private var CanSpawn : boolean = true;

var SpawnTime : float;




function Interact ()
{
	if ( CanSpawn == true )
	{
		var INTMug = Instantiate( Mug, SpawnPoint.transform.position, Mug.transform.rotation);
		
		INTMug.name = "Mug";
		
		CanSpawn = false;
		
		yield WaitForSeconds ( SpawnTime );
		
		CanSpawn = true;
	}
}