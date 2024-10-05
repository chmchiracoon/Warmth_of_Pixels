using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.XR;
using UnityEngine.XR.Interaction.Toolkit.Inputs.Simulation;

public class InputSystem : MonoBehaviour
{
    // Start is called before the first frame update
    public TextMeshProUGUI textElem;

    void StartSimulator()
    {
        var simulatedHmd = UnityEngine.InputSystem.InputSystem.GetDevice<XRSimulatedHMD>();
        var leftHand = UnityEngine.InputSystem.InputSystem.GetDevice("XRSimulatedController") as XRSimulatedController;
        var rightHand = UnityEngine.InputSystem.InputSystem.GetDevice("XRSimulatedController1");
    }
    
    void StartXRDevice()
    {
        var inputDevices = new List<UnityEngine.XR.InputDevice>();
        UnityEngine.XR.InputDevices.GetDevices(inputDevices);
        InputDevices.deviceConnected += OnDeviceConnected;

        foreach (UnityEngine.XR.InputDevice device in inputDevices)
        {
            Debug.Log(string.Format("Device found with name '{0}' and role '{1}'", device.name, device.role.ToString()));
        }
    }
    void Start()
    {
        StartSimulator();
        StartXRDevice();
    }

    // Update is called once per frame
    void Update()
    {
        var leftHand = UnityEngine.InputSystem.InputSystem.GetDevice("XRSimulatedController") as XRSimulatedController;
        if(leftHand != null)
        {
            var position = leftHand.devicePosition.ReadValue();
            textElem.text = $"LeftHand Position: {position}";
        }
    }

    void OnDeviceConnected(InputDevice device)
    {
        Debug.Log("Device connected: " + device.name);
    }
}
