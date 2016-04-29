
var Cars : Transform[];
private var TheCar : Transform;
var MinWait : int;
var MaxWait : int;
var NPCSpawn : Transform;


function SpawnCar ()
{
	var NPCCar = Instantiate( SelectCar() , transform.position, TheCar.transform.rotation);
}

function SelectCar ()
{
	TheCar = Cars[ Random.Range( 0, Cars.Length ) ];
	
	return TheCar;
}