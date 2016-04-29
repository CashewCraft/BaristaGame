var Player : GameObject;

Player = GameObject.Find("First Person Controller");

function Update () 
{
	transform.rotation = Quaternion.LookRotation(transform.position - Player.transform.position);
}