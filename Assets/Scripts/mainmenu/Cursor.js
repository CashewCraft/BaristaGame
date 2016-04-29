	 var mouse : Vector2;
     var w : int = 32;
     var h : int = 32;
     var cursor : Texture2D;
     var Loading : Texture2D;
     private var isLoading : boolean;
     
     
     function Start()
     {
         UnityEngine.Cursor.visible = false;
         
     }
     
     function Update()
     {
         mouse = new Vector2(Input.mousePosition.x, Screen.height - Input.mousePosition.y);
     }
     
     function OnGUI()
     {
        if ( isLoading == false )
        {
         	 GUI.DrawTexture(new Rect(mouse.x - (w / 2), mouse.y - (h / 2), w, h), cursor);
		}
		else 
		{
			GUI.DrawTexture(new Rect(mouse.x - (w / 2), mouse.y - (h / 2), w, h), Loading);
		}     
     }