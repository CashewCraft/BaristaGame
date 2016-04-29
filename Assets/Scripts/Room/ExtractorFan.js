var SpinFactor = [0,0,0];


function Update () 
{
	  transform.Rotate (SpinFactor[0],SpinFactor[1],SpinFactor[2]*Time.deltaTime);
}