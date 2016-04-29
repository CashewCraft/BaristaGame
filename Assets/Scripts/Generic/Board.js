
var meshFilters: MeshFilter[];
var combine : CombineInstance[];

var Meshes : int;

function Update ()
{
	meshFilters = transform.GetComponentsInChildren.<MeshFilter>();
	combine = new CombineInstance[meshFilters.Length];
	Meshes = meshFilters.Length;
	
}

function MergeMeshes () 
{	
		if ( Meshes > 1 )
		{
			for (var i = 0; i < Meshes; i++)
			{
				combine[i].mesh = meshFilters[i].sharedMesh;
				combine[i].transform = meshFilters[i].transform.localToWorldMatrix;
				meshFilters[i].gameObject.active = false;
			}
			transform.GetComponent(MeshFilter).mesh = new Mesh();
			transform.GetComponent(MeshFilter).mesh.CombineMeshes(combine);
			transform.gameObject.active = true;
		}
	}	