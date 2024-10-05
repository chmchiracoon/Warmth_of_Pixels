using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class Disappear11 : MonoBehaviour
{
public GameObject dissappearingobj;

    void OnCollisionEnter(Collision Body)
    {
        dissappearingobj.SetActive(false);
    }

    void OnCollisionExit(Collision Body) 
    {
        dissappearingobj.SetActive(true);
    }
}


