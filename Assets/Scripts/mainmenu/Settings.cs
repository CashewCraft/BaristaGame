using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class Settings : MonoBehaviour {

    

	private void Start ()
	{
		Dropdown settings_qualityLevel = GameObject.Find("Quality_Dropdown").GetComponent<Dropdown>();
		Dropdown settings_setResolution = GameObject.Find("Resolution_Dropdown").GetComponent<Dropdown>();
		Dropdown settings_textureRes = GameObject.Find("TD_Dropdown").GetComponent<Dropdown>();
		Toggle settings_setAF = GameObject.Find("AF_Toggle").GetComponent<Toggle>();
		Toggle settings_setAO = GameObject.Find("AO_Toggle").GetComponent<Toggle>();
		Dropdown settings_setAA = GameObject.Find("AA_Dropdown").GetComponent<Dropdown>();
		Dropdown settings_dynamicLights = GameObject.Find("DL_Dropdown").GetComponent<Dropdown>();
		Dropdown settings_setvSync = GameObject.Find("Vsync_Dropdown").GetComponent<Dropdown>();

		settings_qualityLevel.value = PlayerPrefs.GetInt("qualityLevel");
		settings_setResolution.value = PlayerPrefs.GetInt("settingsResolutionValue");
		settings_textureRes.value = PlayerPrefs.GetInt("settingsTextureLevel");
		CheckAF(settings_setAF);
		CheckAO(settings_setAO);
		settings_setAA.value = PlayerPrefs.GetInt("settingsMSAAValue");
		settings_dynamicLights.value = PlayerPrefs.GetInt("settingsMaxPixelLightValue"); 
		settings_setvSync.value = PlayerPrefs.GetInt("vSyncIncrement");


	}

	public void CheckAF (Toggle s_AF)
	{
		if (PlayerPrefs.GetInt("anisotropicFilterEnable") == 1)
		{
			s_AF.isOn = true;
		}
		else
		{
			s_AF.isOn = false;
		}
	}
	public void CheckAO (Toggle s_AO)
	{
		if (PlayerPrefs.GetInt("ambientOcclusionEnable") == 1)
		{
			s_AO.isOn = true;
		}
		else
		{
			s_AO.isOn = false;
		}
	}

	public void ChangeSound(float newVol)
    {
        AudioListener.volume = newVol;
    }

    public void SetQuality(int index)
    {
        QualitySettings.SetQualityLevel(index);
		PlayerPrefs.SetInt("qualityLevel", index);
    }

	public void MaxTextureRes(int TR)
	{
		switch (TR)
		{
		case 0:
			QualitySettings.masterTextureLimit = 3;
			PlayerPrefs.SetInt("maxTextureResLevel", 3);
			PlayerPrefs.SetInt("settingsTextureLevel", 0);
			break;
		case 1:
			QualitySettings.masterTextureLimit = 2;
			PlayerPrefs.SetInt("maxTextureResLevel", 2);
			PlayerPrefs.SetInt("settingsTextureLevel", 1);
			break;
		case 2:
			QualitySettings.masterTextureLimit = 1;
			PlayerPrefs.SetInt("maxTextureResLevel", 1);
			PlayerPrefs.SetInt("settingsTextureLevel", 2);
			break;
		case 3:
			QualitySettings.masterTextureLimit = 0;
			PlayerPrefs.SetInt("maxTextureResLevel", 0);
			PlayerPrefs.SetInt("settingsTextureLevel", 3);
			break;
		}
		
	}

    public void SetResolution(int index)
    {
        switch (index)
        {
            case 0:
                Screen.SetResolution(640, 480, Screen.fullScreen);
				PlayerPrefs.SetInt ("fullscreenMetricX", 640);
				PlayerPrefs.SetInt ("fullscreenMetricY", 480);
				PlayerPrefs.SetInt ("settingsResolutionValue", 0);
                break;
            case 1:
                Screen.SetResolution(1024, 768, Screen.fullScreen);
				PlayerPrefs.SetInt ("fullscreenMetricX", 1024);
				PlayerPrefs.SetInt ("fullscreenMetricY", 768);
				PlayerPrefs.SetInt ("settingsResolutionValue", 1);
                break;
			case 2:
				Screen.SetResolution(1440, 900, Screen.fullScreen);
				PlayerPrefs.SetInt("fullscreenMetricX", 1440);
				PlayerPrefs.SetInt("fullscreenMetricY", 900);
				PlayerPrefs.SetInt ("settingsResolutionValue", 2);
				break;
			case 3:
                Screen.SetResolution(1600, 900, Screen.fullScreen);
				PlayerPrefs.SetInt("fullscreenMetricX", 1600);
				PlayerPrefs.SetInt("fullscreenMetricY", 900);
				PlayerPrefs.SetInt ("settingsResolutionValue", 3);
                break;
            case 4:
                Screen.SetResolution(1680, 1050, Screen.fullScreen);
				PlayerPrefs.SetInt("fullscreenMetricX", 1680);
				PlayerPrefs.SetInt("fullscreenMetricY", 1050);
				PlayerPrefs.SetInt ("settingsResolutionValue", 4);
                break;
            case 5:
                Screen.SetResolution(1920, 1080, Screen.fullScreen);
				PlayerPrefs.SetInt("fullscreenMetricX", 1920);
				PlayerPrefs.SetInt("fullscreenMetricY", 1080);
				PlayerPrefs.SetInt ("settingsResolutionValue", 5);
                break;
        }

    }



	public void SetAF(bool AF)
	{
		if (AF)
		{
			QualitySettings.anisotropicFiltering = AnisotropicFiltering.Enable;
			PlayerPrefs.SetInt("anisotropicFilterEnable", 1);
		}
		else
		{
			QualitySettings.anisotropicFiltering = AnisotropicFiltering.Disable;
			PlayerPrefs.SetInt("anisotropicFilterEnable", 0);
	
		}	
	}

	public void SetAO(bool AO)
	{
		if (AO)
		{
			PlayerPrefs.SetInt("ambientOcclusionEnable", 1);
		}
		else
		{
			PlayerPrefs.SetInt("ambientOcclusionEnable", 0);
		}
	}

	
	public void SetAA(int AA)
	{
		switch (AA)
		{
		case 0:
			QualitySettings.antiAliasing = 0;
			PlayerPrefs.SetInt("msaaSampleLevel", 0);
			PlayerPrefs.SetInt("settingsMSAAValue", 0);
			break;
		case 1:
			QualitySettings.antiAliasing = 2;
			PlayerPrefs.SetInt("msaaSampleLevel", 2);
			PlayerPrefs.SetInt("settingsMSAAValue", 1);
			break;
		case 2:
			QualitySettings.antiAliasing = 4;
			PlayerPrefs.SetInt("msaaSampleLevel", 4);
			PlayerPrefs.SetInt("settingsMSAAValue", 2);
			break;
		case 3:
			QualitySettings.antiAliasing = 8;
			PlayerPrefs.SetInt("msaaSampleLevel", 8);
			PlayerPrefs.SetInt("settingsMSAAValue", 3);
			break;
		}
	}

	public void DynaLights(int DL)
	{
		switch (DL)
		{
		case 0:
			QualitySettings.pixelLightCount = 10;
			PlayerPrefs.SetInt("maxPixelLightCount", 10);
			PlayerPrefs.SetInt("settingsMaxPixelLightValue", 0);
			break;
		case 1:
			QualitySettings.pixelLightCount = 25;
			PlayerPrefs.SetInt("maxPixelLightCount", 25);
			PlayerPrefs.SetInt("settingsMaxPixelLightValue", 1);
			break;
		case 2:
			QualitySettings.pixelLightCount = 50;
			PlayerPrefs.SetInt("maxPixelLightCount", 50);
			PlayerPrefs.SetInt("settingsMaxPixelLightValue", 2);
			break;
		case 3:
			QualitySettings.pixelLightCount = 75;
			PlayerPrefs.SetInt("maxPixelLightCount", 75);
			PlayerPrefs.SetInt("settingsMaxPixelLightValue", 3);
			break;
		}
	}


	public void SetVsync(int vsync)
	{
		switch (vsync)
		{
		case 0:
			QualitySettings.vSyncCount = 0;
			PlayerPrefs.SetInt("vSyncIncrement", 0);
			break;
		case 1:
			QualitySettings.vSyncCount = 1;
			PlayerPrefs.SetInt("vSyncIncrement", 1);
			break;
		case 2:
			QualitySettings.vSyncCount = 2;
			PlayerPrefs.SetInt("vSyncIncrement", 2);
			break;
		}
	}
	

	
	
    public void PauseSound(bool isPaused)
    {
        AudioListener.pause = isPaused;
    }

	public void ApplySettings ()
	{
		PlayerPrefs.Save();
	}

}