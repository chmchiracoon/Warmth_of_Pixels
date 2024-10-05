using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SoilSound : MonoBehaviour
{
    public AudioSource SoilSound1;

    void OnTriggerEnter (Collider col)
    {
        if (col.gameObject.tag == "Hand")
        {
            SoilSound1.Play();
        }
    }

    void OnTriggerExit (Collider col)
    {
        if (col.gameObject.tag == "Hand")
        {
            SoilSound1.Stop();
        }
    }
}
