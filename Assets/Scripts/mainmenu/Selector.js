var MouseOver : AudioClip;

function Awake ()
{
	GetComponent.<AudioSource>().clip = (MouseOver);
	GetComponent.<AudioSource>().Play();
}