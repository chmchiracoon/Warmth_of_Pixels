using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.Hands;
using UnityEngine.XR.Hands.Gestures;
using UnityEngine.XR.Interaction.Toolkit.Locomotion.Movement;

public class HandMovement : MonoBehaviour
{
    
    public XRHandTrackingEvents m_HandTrackingEvents;
    public XRHandShape m_HandShape;
    public WOPContinuousMoveProvider m_MoveProvider;

    private XRHand? _hand;

    // Start is called before the first frame update
    void Start()
    {
        m_HandTrackingEvents.jointsUpdated.AddListener(OnUpdateHand);
    }

    void OnUpdateHand(XRHandJointsUpdatedEventArgs args)
    {
        if(m_HandShape.CheckConditions(args))
        {
            _hand = args.hand;
        }
        else
        {
            _hand = null;
        }
    }

    private void Update()
    {
        if (_hand != null)
        {
            var hand = _hand.Value;
            var tip = hand.GetJoint(XRHandJointID.IndexTip);
            tip.TryGetPose(out var pose);
            var forward = pose.forward;
            var direction = new Vector3(forward.x, 0, forward.z);
            m_MoveProvider.MoveRigPublic(direction * (2.5f * Time.deltaTime));
        }
    }
}
