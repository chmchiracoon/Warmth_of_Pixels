using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Serialization;

[ExecuteInEditMode]
public class WOP_InteractiveEffectsAdditional : MonoBehaviour
{
    public Transform transformToFollow;
    public RenderTexture rt;
    public string GlobalTexName = "_GlobalEffectRTAdditional";
    public string GlobalOrthoName = "_OrthographicCamSizeAdditional";
    public bool isPaced = false;

    private float orthoMem = 0;
    private Vector3 camDir;
    private Coroutine waitPace;
    private bool paceRunning = false;
    private void Awake()
    {
        orthoMem = GetComponent<Camera>().orthographicSize;
        Shader.SetGlobalFloat(GlobalOrthoName, orthoMem);
        Shader.SetGlobalTexture(GlobalTexName, rt);
    }
    private void OnEnable()
    {
        orthoMem = GetComponent<Camera>().orthographicSize;
        Shader.SetGlobalFloat(GlobalOrthoName, orthoMem);
        Shader.SetGlobalTexture(GlobalTexName, rt);
    }

    private void MoveCamera()
    {
        if (transformToFollow != null)
        {
            camDir = Vector3.ProjectOnPlane(transformToFollow.forward, Vector3.up).normalized;
            camDir.y = 0f;

            if (transformToFollow != null)
            {
                float YView = Vector3.Angle(Vector3.down, transformToFollow.forward);
                transform.position = new Vector3(transformToFollow.position.x, transformToFollow.position.y, transformToFollow.position.z) - transformToFollow.forward * 1;
            }
        }
        Shader.SetGlobalVector("_PositionAdd", transform.position);
        transform.rotation = transformToFollow.rotation;
    }

    private void Update()
    {
        if (isPaced)
        {
            if (!paceRunning)
            {
                waitPace = StartCoroutine(WaitPace());
            }
        }
        else
        {
            if (paceRunning)
            {
                paceRunning = false;
                StopCoroutine(WaitPace());
            }

            MoveCamera();
        }
    }
    private IEnumerator WaitPace()
    {
        for (; ; )
        {
            paceRunning = true;

            MoveCamera();

            yield return new WaitForSeconds(1f);
        }
    }
}