using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Video;

public class UifadeOutAndBillBoarding1 : MonoBehaviour
{
    public Transform Camera;
    public Transform rigid;
    public Animator anim; 
    Vector3 cameraDir; 

    void Update() 
    {
        cameraDir = Camera.forward;
        cameraDir.y = 0;
        rigid.rotation = Quaternion.LookRotation(cameraDir);
    }
    
    // this script gets called whenever ANY collider collides with this trigger
    void OnTriggerEnter(Collider other)
    {
        if(other.CompareTag("Player"))
        {
            print("UI fade out");
            anim.SetBool("Play", true);
            //preRenderedVideo.Play();
            //thePlayer.SetActive(false);
            //playerCam.enabled = false;
        }
        
    }

    void OnTriggerExit (Collider other)
    {
        if(other.tag != "Player")
            return;
        print("Ui shows up");
        anim.SetBool("Play", false);
        //preRenderedVideo.Stop();
        //thePlayer.SetActive(true);
        
    }
    
}
