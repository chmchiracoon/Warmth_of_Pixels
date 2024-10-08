using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ParticleOnOff : MonoBehaviour
{
    [SerializeField] ParticleSystem ParticleSystem1 = null;

    void OnTriggerEnter(Collider other)
    {
        // "Player" 태그가 아니면 함수 종료
        if (other.tag != "Player")
            return;
        
        // ParticleSystemAppear 함수 호출
        ParticleSystemAppear();
    }

    public void ParticleSystemAppear()
    {
            // 파티클 시스템 재생
            ParticleSystem1.Play();
       
    }

    void OnTriggerExit(Collider other)
    {
            // 파티클 시스템 정지
            ParticleSystem1.Stop();
    }
}
