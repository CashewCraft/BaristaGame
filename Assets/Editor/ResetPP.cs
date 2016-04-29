using UnityEngine;
using UnityEditor;
using System.Collections;

public class ResetPPP : MonoBehaviour 
{
	[MenuItem("Assets/ResetPlayerPrefs")]
	public static void ResetPlayerStats()
	{
		PlayerPrefs.DeleteAll();
	}
}
