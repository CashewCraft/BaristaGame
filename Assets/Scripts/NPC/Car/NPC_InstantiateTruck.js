
var Truck : Transform;

private var SpawnPos : Vector3;

 
function Start ()
{
	SpawnPos = new Vector3 ( transform.position.x, 2, transform.position.z );
}



function DispatchTruck ( DTime : int, Order : Array )
{
	yield WaitForSeconds ( DTime );
	
	var TheTruck = Instantiate( Truck, SpawnPos, Truck.transform.rotation );
	
	TheTruck.transform.GetComponent("NPC_Truck").Delivery = Order;
}