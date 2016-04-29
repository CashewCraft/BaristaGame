var pos1 : GameObject;
var pos2 : GameObject;
var pos3 : GameObject;
var pos4 : GameObject;
var pos5 : GameObject;
var occd = [false,false,false,false,false];
var occdcols = [null,null,null,null,null];
var NoThingsOnShelf = 0;

function OnCollisionEnter (hit : Collision)
{
	
	var posits = [pos1,pos2,pos3,pos4,pos5];
	
	for (var i = 0; i < 5; i++) 
	{
		if (!occd[i])
		{
			occd[i] = false;
			occdcols[i] = hit.gameObject;
			print(posits);
			hit.gameObject.transform.position = posits[i].transform.position;
			hit.gameObject.transform.parent = posits[i].transform;
			NoThingsOnShelf = NoThingsOnShelf + 1;
		}
	}
}

function OnCollisionExit (hit : Collision)
{
	var posits = [pos1,pos2,pos3,pos4,pos5];
	
	for (var i = 0; i < 5; i++) 
	{
		if (occdcols[i] == hit.gameObject) 
		{
			occdcols[i] = null;
			occd[i] = false;
			hit.gameObject.transform.parent = null;
			NoThingsOnShelf = NoThingsOnShelf - 1;
		}
	}
}