var textures = new Array();
var MaxFrames : int; 


function Start ()
{	
	proj = GetComponent (Light);
	
	for ( i = 0; i < MaxFrames; i++ )
	{
		var texture = ("Tutorial/Animated/Trav/Tav " + (i.ToString()));
		var New = Resources.Load(texture);
		textures.Push(New);
	}
}
  