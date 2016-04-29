var myGUItexture : GUITexture;
var Duration : float;
var StartDelay : float;
var FadeOutDelay : float;
var Audio : AudioClip;

function Start () 
{
    myGUItexture.color.a = 0.0;
    
    yield WaitForSeconds (StartDelay);
   	if ( Audio != null )
   	{
   		GetComponent.<AudioSource>().PlayOneShot(Audio);
   	}
   	Fade(0.0, 1.0, Duration);     // fade up
    yield WaitForSeconds (FadeOutDelay);
    Fade(1.0, 0.0, Duration);     // fade down
}
 
function Fade (startLevel : float, endLevel : float, duration : float) 
{
    var speed : float = 1.0/duration;  
   
    for (var t :float = 0.0; t < 1.0; t += Time.deltaTime*speed) 
    {
    	myGUItexture.color.a = Mathf.Lerp(startLevel, endLevel, t);
   		yield;
    }
}