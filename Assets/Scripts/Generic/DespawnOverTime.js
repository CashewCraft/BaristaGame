var GraphicsScript;
var PhysicsLifetime : int;
var ObjScale : float;

function Start ()
{
	GraphicsScript = GameObject.Find("Master Script Container").GetComponent("Graphics");
	//PhysicsLifetime = GraphicsScript.PhysicsLifeTime;
	yield WaitForSeconds (PhysicsLifetime);
	Destroy(gameObject);
}
