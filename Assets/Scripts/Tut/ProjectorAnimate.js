var textures = new Array(); 
var changeInterval = 0.33;
var GO : boolean;
var MaxFrames : int;
var proj : Light;
var _Projector : Transform;

function Start ()
{
	proj = GetComponent (Light);
	textures = _Projector.GetComponent("ProjectorClip").textures;

}

//function Start ()
//{	
//	proj = GetComponent (Light);
	
//	for ( i = 0; i < MaxFrames; i++ )
//	{
//		var texture = ("Tutorial/Animated/Trav/Tav " + (i.ToString()));
//		var New = Resources.Load(texture);
//		textures.Push(New);
//	}
//}
  
function Update() 
{  
	if (GO == true && textures.length == MaxFrames)
	{
	   Play();   
	}
}

function Play()
{
	 
	 
	 for (movieTexture = 0; movieTexture < textures.length; movieTexture++)
	 {
	    GO = false;
	    yield WaitForSeconds(changeInterval);
	    proj.cookie = textures[movieTexture];
	    proj.intensity = Random.Range(0.3,2.5);
	 }
	 GO = true; 
		
}