using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Video;

public class CutsceneEnter : MonoBehaviour
{
    public GameObject thePlayer;
    public VideoPlayer preRenderedVideo;
    public bool preRendered;
    public Camera playerCam;
    public GameObject cutsceneObject;
    
    // this script gets called whenever ANY collider collides with this trigger
    void OnTriggerEnter(Collider other)
    {
        if(other.tag != "Player")
            return;
        if(preRendered == true)
        {
            print("Video triggered");
            cutsceneObject.SetActive(true);
            //preRenderedVideo.Play();
            //thePlayer.SetActive(false);
            //playerCam.enabled = false;
        }
        
    }

    void OnTriggerExit (Collider other)
    {
        if(other.tag != "Player")
            return;
        print("video stopped");
        cutsceneObject.SetActive(false);
        //preRenderedVideo.Stop();
        //thePlayer.SetActive(true);
        playerCam.enabled = true;
        
    }
}
