var InstanceScript;


function Start ()
{
	InstanceScript = GameObject.Find("NPC_node_Spawn1").GetComponent("NPC_Instantiate");
}


function OnTriggerEnter ( col : Collider )
{
	if ( col.gameObject.tag == "NPC" )
	{
		Destroy ( GetComponent.<Collider>().gameObject );
		InstanceScript.NPC_CurCount = InstanceScript.NPC_CurCoun -1;
	}	
}