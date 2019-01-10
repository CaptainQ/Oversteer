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

        stickLFaceTrans.localRotation = Quaternion.Euler(0, 0, 0);
        stickLTopTrans.localRotation = Quaternion.Euler(0, 0, 0);

        stickLFaceTrans.Rotate(StickLVert * 24f, StickLHoriz * 24f, 0.0f);
        stickLTopTrans.Rotate(StickLVert * 24f, StickLHoriz * 24f, 0.0f);

        Debug.Log("StickLHoriz: " + StickLHoriz * 24f);
        Debug.Log("StickLVert: " + StickLVert * 24f);
    }
}
