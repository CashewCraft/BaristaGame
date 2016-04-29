using UnityEngine;

public class TextFadeInOut : MonoBehaviour
{
	public float SetFadeDuration = 0.0f;
	private float fadeDuration = 3.0f;
	
	private float timeLeft = 0.0f;
	
	private float origRed = 0.0f;
	private float origGreen = 0.0f;
	private float origBlue = 0.0f;
	
	private void Awake()
	{
		fadeDuration = SetFadeDuration;
		timeLeft = fadeDuration;
		
		origBlue = GetComponent<GUIText>().font.material.color.b;
		origGreen = GetComponent<GUIText>().font.material.color.g;
		origRed = GetComponent<GUIText>().font.material.color.r;
		
		//Set Text to transparent
		GetComponent<GUIText>().font.material.color = new Color(origRed, origGreen, origBlue, 0);
	}
	
	private void Update()
	{
		if (timeLeft > 0)
		{
			//Fade in
			Fade(true);
		}
		else if (timeLeft > (-fadeDuration))
		{
			//Fade out
			Fade(false);
		}
		timeLeft -= Time.deltaTime;
	}
	
	private void Fade(bool fadeIn)
	{
		if (fadeIn)
		{
			float a = GetComponent<GUIText>().font.material.color.a;
			a = (timeLeft / fadeDuration);
			if (a > 1) { a = 1; }
			GetComponent<GUIText>().font.material.color = new Color(origRed, origGreen, origBlue, 1-a);
		}
		else
		{
			float a = GetComponent<GUIText>().font.material.color.a;
			a = timeLeft / (-fadeDuration);
			if (a < 0) { a = 0; }
			GetComponent<GUIText>().font.material.color = new Color(origRed, origGreen, origBlue, 1-a);
		}
	}
}