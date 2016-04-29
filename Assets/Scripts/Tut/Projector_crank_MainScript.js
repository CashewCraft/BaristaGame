var Proj : Transform;
var HasPressed : boolean;

function Interact ()
{
	if (!HasPressed)
	{	
		GetComponent.<Animation>().Play("projector_crank_spin");
		Proj.GetComponent(ProjectorScript).startSeq();
		HasPressed = true;
	}
}