var Coin50 : Transform;
var Coin1 : Transform;
var Master : Transform;



function Spawn50p ()
{	
	Instantiate( Coin50, transform.position, Quaternion.identity  );
	Master.BroadcastMessage("AddEXP", 7);
}

function Spawn1po ()
{
	Instantiate( Coin1, transform.position, Quaternion.identity  );
	Master.BroadcastMessage("AddEXP", 10);

}
