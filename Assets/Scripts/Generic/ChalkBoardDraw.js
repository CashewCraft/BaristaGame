
function Update () 
{
	   
	if (Input.GetMouseButton (0))
	{
		var hit : RaycastHit;
		var fwd = transform.TransformDirection(Vector3.forward);
	 	
	 	if( Physics.Raycast(transform.position, fwd, hit, 3.6))
		{
    		if ( hit.transform.name == "ChalkBoard" )
    		{	
    			var tex : Texture2D = hit.transform.GetComponent.<Renderer>().materials[2].mainTexture;
	    		var pixelUV = hit.textureCoord;
	   			pixelUV.x *= tex.width;
	   			pixelUV.y *= tex.height;
	   
	    		tex.SetPixel(pixelUV.x, pixelUV.y, Color.red);
	 
	   			tex.Apply();
    		}
    	}
    	
    }
}