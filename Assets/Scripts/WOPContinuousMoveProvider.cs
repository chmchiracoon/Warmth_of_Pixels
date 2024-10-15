using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.Interaction.Toolkit.Locomotion.Movement;

public class WOPContinuousMoveProvider : ContinuousMoveProvider
{
    protected void OnEnable()
    {
        base.OnEnable();
    }

    protected void OnDisable()
    {
        base.OnDisable();
    }

    protected void Update()
    {
        base.Update();
    }
    
    public void MoveRigPublic(Vector3 translationInWorldSpace)
    {
        MoveRig(translationInWorldSpace);
    }
}
