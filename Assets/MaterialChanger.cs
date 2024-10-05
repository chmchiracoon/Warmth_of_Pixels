using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Video;

public class MaterialChanger : MonoBehaviour {
    

    public VideoClip[] videoClips;
    private VideoPlayer videoPlayer;

    void Start()
    {
        videoPlayer = GetComponent<VideoPlayer>();
        int i = Random.Range(0, videoClips.Length);
    }

  
    void OnTriggerEnter (Collider col)
    {
        int i = Random.Range(0, videoClips.Length);
        if (col.gameObject.tag == "Hand")
        {
            print("hands collided");
            videoPlayer.clip = videoClips[i];
            videoPlayer.Play();
            //rend.sharedMaterial = material[i];
        }
    }

    void OnTriggerExit (Collider col)
    {
        if (col.gameObject.tag == "Hand")
        {
            print("Hands removed");
            videoPlayer.Pause();
            //rend.sharedMaterial = material[0];
        }
    }
}
