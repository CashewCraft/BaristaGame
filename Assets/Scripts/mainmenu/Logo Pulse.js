var newScale : Vector3 = Vector3 (0, 0, 0);

var oldsize : Vector3 = Vector3 ( -0.05, -0.05, -0.05 );

var speed : float;
 
function Start ()
{
	Grow();
}


function Grow()
{
	transform.localScale = Vector3.Lerp (oldsize, newScale, speed * Time.deltaTime);
	
	yield WaitForSeconds ( 0.5 );
	
	Shrink();
}

function Shrink()
{
	transform.localScale = Vector3.Lerp (newScale, oldsize, speed * Time.deltaTime);
	
	yield WaitForSeconds ( 0.5 );
	
	Grow1();
}


function Grow1()
{
	Grow();
}