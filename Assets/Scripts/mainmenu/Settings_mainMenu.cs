using UnityEngine;
using System.Collections;

public class Settings_mainMenu : MonoBehaviour {

    public GUITexture text;
    public GUITexture selected;
    public AudioClip select;
    public GameObject menu;

    void Start()
    {
        menu.SetActive(false);
    }

    void OnMouseOver()
    {
        selected.gameObject.SetActive(true);

    }

    void OnMouseExit()
    {
        selected.gameObject.SetActive(false);

    }

    void OnMouseDown()
    {
        gameObject.GetComponent<AudioSource> ().PlayOneShot(select);
        menu.SetActive(true);
    }
}
