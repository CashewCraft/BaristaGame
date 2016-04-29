var WaitTime : float;

function Start () 
{
	yield WaitForSeconds ( WaitTime );
	
	Application.LoadLevel( 1 );
}
