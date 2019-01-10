using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Xbox_Stick_Left : MonoBehaviour
{
    public Transform stickLFaceTrans;
    public Transform stickLTopTrans;

    void Start()
    {
        Debug.Log("Start script");
    }
    void Update()
    {
        float StickLHoriz = Input.GetAxis("Horizontal");
        float StickLVert = Input.GetAxis("Vertical");

        stickLFaceTrans.SetPositionAndRotation(stickLFaceTrans.position, new Quaternion(0f, 0f, 0f, 1f));
        stickLTopTrans.SetPositionAndRotation(stickLTopTrans.position, new Quaternion(0f, 0f, 0f, 1f));

        stickLFaceTrans.Rotate(StickLVert * 24f + 12f, StickLHoriz * 24f + 12f, 0.0f);
        stickLTopTrans.Rotate(StickLVert * 24f + 12f, StickLHoriz * 24f + 12f, 0.0f);

        Debug.Log("StickLHoriz: " + StickLHoriz * 24f);
        Debug.Log("StickLVert: " + StickLVert * 24f);
    }
}
