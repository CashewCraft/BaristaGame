using UnityEngine;
using System.Collections;

public class PlayerSettings : MonoBehaviour 
{
	private Transform plyCamera;
	

	void Start () 
	{
		plyCamera = transform.Find("PlayerCamera");
		QualitySettings.masterTextureLimit = PlayerPrefs.GetInt("maxTextureResLevel");
		QualitySettings.SetQualityLevel(PlayerPrefs.GetInt("qualityLevel"));
		GetAFEnable();
		GetAO();
		QualitySettings.antiAliasing = PlayerPrefs.GetInt ("msaaSampleLevel");
		QualitySettings.pixelLightCount = PlayerPrefs.GetInt("maxPixelLightCount");
		QualitySettings.vSyncCount = PlayerPrefs.GetInt("vSyncIncrement");
		print("Settings Succesfully Applied.");
	}
	void GetAFEnable ()
	{
		if (PlayerPrefs.GetInt("anisotropicFilterEnable") == 1)
		{
			QualitySettings.anisotropicFiltering = AnisotropicFiltering.Enable;
		}
		else
		{
			QualitySettings.anisotropicFiltering = AnisotropicFiltering.Disable;
		}
	}
	void GetAO ()
	{
		if (PlayerPrefs.GetInt("ambientOcclusionEnable") == 1)
		{
			plyCamera.GetComponent<SSAOPro>().enabled = true;
		}
		else
		{
			plyCamera.GetComponent<SSAOPro>().enabled = false;
		}
	}
}
