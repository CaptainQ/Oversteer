using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Xbox_Stick_Left : MonoBehaviour
{
    private Transform stickLFaceTrans;
    private Transform stickLTopTrans;

    void Start()
    {
        stickLFaceTrans = GameObject.Find("XboxOne_Controller_Face/Stick_L").GetComponent<Transform>();
        stickLTopTrans = GameObject.Find("XboxOne_Controller_Top/Stick_L").GetComponent<Transform>();
    }
    void Update()
    {
        float StickLHoriz = Input.GetAxis("Horizontal");
        float StickLVert = Input.GetAxis("Vertical");

        stickLFaceTrans.rotation.Set(StickLVert * 24f + 12f, StickLHoriz * 24f + 12f, 0.0f, 1f);
        stickLTopTrans.rotation.Set(StickLVert * 24f + 12f, StickLHoriz * 24f + 12f, 0.0f, 1f);
    }
}
