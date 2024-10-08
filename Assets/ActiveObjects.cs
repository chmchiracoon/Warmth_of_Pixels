using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActiveObjects : MonoBehaviour
{
    public GameObject activeGameObject;

    void OnTriggerEnter(Collider other)
    {
        // 태그가 "Player"가 아니면 함수 종료
        if(other.tag != "Player")
            return;

        // 태그가 "Player"라면 activeGameObject를 활성화
        activeGameObject.SetActive(true);
    }

    void OnTriggerExit(Collider other)
    {
        // 태그와 상관없이 트리거를 빠져나가면 비활성화
        activeGameObject.SetActive(false);
    }
}
