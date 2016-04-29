var Price : float;
var Name : String;
var Description : String;
var _Icon : GUITexture;
var _Name : GUIText;
var _Description : GUIText;
var _Price : GUIText;
var Contents : Transform;

function Update ()
{
	_Name.text = Name;
	_Description.text = Description;
	_Price.text = "£" + Price.ToString();
}