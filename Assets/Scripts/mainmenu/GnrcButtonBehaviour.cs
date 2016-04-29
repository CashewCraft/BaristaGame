using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using System;

// Documentation: 
// http://docs.unity3d.com/ScriptReference/UI.Selectable.html
//
[RequireComponent (typeof (AudioSource))]
public class GnrcButtonBehaviour : MonoBehaviour, IPointerEnterHandler, IPointerClickHandler {
    public AudioClip hover;
    public AudioClip select;
    public EventSystem eventSystem;

    bool playedClip = false;

    public void OnPointerEnter (PointerEventData eventData)
    {
        mouseHover();
    }

    public void OnPointerClick (PointerEventData eventData)
    {
        gameObject.GetComponent<AudioSource>().PlayOneShot(select);
    }

    void mouseHover()
    {
        gameObject.GetComponent<AudioSource>().PlayOneShot(hover);
    }

    public void ExitButtonClicked()
    {
        StartCoroutine(ExitMenu());
    }

    IEnumerator ExitMenu()
    {
        gameObject.GetComponent<AudioSource>().PlayOneShot(select);
        yield return new WaitForSeconds(select.length);
        GameObject.Find("Settings_Canvas").SetActive(false);
    }
}