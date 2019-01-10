using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Xbox_Stick_Left : MonoBehaviour
{
    public Transform stickLFaceTrans;
    public Transform stickLTopTrans;

    public Transform stickRFaceTrans;
    public Transform stickRTopTrans;

    public Transform triggerLFaceTrans;
    public Transform triggerLTopTrans;
    public Transform triggerRFaceTrans;
    public Transform triggerRTopTrans;

    void Start()
    {
        Debug.Log("Start script");
    }
    void Update()
    {
        float stickLHoriz = Input.GetAxis("HorizontalL");
        float stickLVert = Input.GetAxis("VerticalL");

        float stickRHoriz = Input.GetAxis("HorizontalR");
        float stickRVert = Input.GetAxis("VerticalR");

        float triggerL = Input.GetAxis("TriggerL");
        float triggerR = Input.GetAxis("TriggerR");

        stickLFaceTrans.localRotation = Quaternion.Euler(0, 0, 0);
        stickLTopTrans.localRotation = Quaternion.Euler(0, 0, 0);

        stickRFaceTrans.localRotation = Quaternion.Euler(0, 0, 0);
        stickRTopTrans.localRotation = Quaternion.Euler(0, 0, 0);

        triggerLFaceTrans.localRotation = Quaternion.Euler(0, 0, 0);
        triggerLTopTrans.localRotation = Quaternion.Euler(0, 0, 0);
        triggerRFaceTrans.localRotation = Quaternion.Euler(0, 0, 0);
        triggerRTopTrans.localRotation = Quaternion.Euler(0, 0, 0);

        stickLFaceTrans.Rotate(stickLVert * -24f, stickLHoriz * -24f, 0.0f);
        stickLTopTrans.Rotate(stickLVert * -24f, stickLHoriz * -24f, 0.0f);

        stickRFaceTrans.Rotate(stickRVert * -24f, stickRHoriz * -24f, 0.0f);
        stickRTopTrans.Rotate(stickRVert * -24f, stickRHoriz * -24f, 0.0f);

        triggerLFaceTrans.Rotate(triggerL * -24f, 0.0f, 0.0f);
        triggerLTopTrans.Rotate(triggerL * -24f, 0.0f, 0.0f);
        triggerRFaceTrans.Rotate(triggerR * -24f, 0.0f, 0.0f);
        triggerRTopTrans.Rotate(triggerR * -24f, 0.0f, 0.0f);
    }
}
