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

    public Transform DPadFaceTrans;
    public Transform DPadTopTrans;

    public Transform bumperLFaceTrans;
    public Transform bumperLTopTrans;
    public Transform bumperRFaceTrans;
    public Transform bumperRTopTrans;

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

        float stickLClick = Input.GetAxis("ClickL");
        float stickRClick = Input.GetAxis("ClickR");

        float triggerL = Input.GetAxis("TriggerL");
        float triggerR = Input.GetAxis("TriggerR");

        float DPadX = Input.GetAxis("DPadX");
        float DPadY = Input.GetAxis("DPadY");

        float bumperL = Input.GetAxis("BumperL");
        float bumperR = Input.GetAxis("BumperR");
        
        stickLFaceTrans.localRotation = Quaternion.Euler(stickLVert * -23f, stickLHoriz * -23f, 0.0f);
        stickLTopTrans.localRotation = Quaternion.Euler(stickLVert * -23f, stickLHoriz * -23f, 0.0f);

        stickRFaceTrans.localRotation = Quaternion.Euler(stickRVert * -23f, stickRHoriz * -23f, 0.0f);
        stickRTopTrans.localRotation = Quaternion.Euler(stickRVert * -23f, stickRHoriz * -23f, 0.0f);

        stickLFaceTrans.localPosition = new Vector3(3.384324f, 0.4483004f, 0f - (stickLClick / 8));
        stickLTopTrans.localPosition = new Vector3(3.384324f, 0.4483004f, 0f - (stickLClick / 8));
        stickRFaceTrans.localPosition = new Vector3(-1.71292f, -2.186946f, 0f - (stickRClick / 8));
        stickRTopTrans.localPosition = new Vector3(-1.71292f, -2.186946f, 0f - (stickRClick / 8));

        triggerLFaceTrans.localRotation = Quaternion.Euler(triggerL * -24f, 0.0f, 0.0f);
        triggerLTopTrans.localRotation = Quaternion.Euler(triggerL * -24f, 0.0f, 0.0f);
        triggerRFaceTrans.localRotation = Quaternion.Euler(triggerR * -24f, 0.0f, 0.0f);
        triggerRTopTrans.localRotation = Quaternion.Euler(triggerR * -24f, 0.0f, 0.0f);

        DPadFaceTrans.localRotation = Quaternion.Euler(DPadY * -12, DPadX * -12, 0f);
        DPadTopTrans.localRotation = Quaternion.Euler(DPadY * -12, DPadX * -12, 0f);

        bumperLFaceTrans.localPosition = new Vector3(0f, 0f - (bumperL / 8));
        bumperLTopTrans.localPosition = new Vector3(0f, 0f - (bumperL / 8));
        bumperRFaceTrans.localPosition = new Vector3(0f, 0f - (bumperR / 8));
        bumperRTopTrans.localPosition = new Vector3(0f, 0f - (bumperR / 8));
    }
}
