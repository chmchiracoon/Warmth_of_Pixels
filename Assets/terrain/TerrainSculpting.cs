using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class TerrainSculpting : MonoBehaviour
{
    private Terrain terrain; // Make sure this is assigned in the inspector
    private TerrainData terrainData;
    private int heightmapWidth;
    private int heightmapHeight;

    // Start is called before the first frame update
    void Start()
    {
        terrain = GetComponent<Terrain>();
        if(terrain == null)
        {
            Debug.LogError("Terrain not assigned!");
            return;
        }

        terrainData = terrain.terrainData;
        if (terrainData == null)
        {
            Debug.LogError("TerrainData is null!");
            return;
        }
        heightmapWidth = terrainData.heightmapResolution;
        heightmapHeight = terrainData.heightmapResolution;
    }

    // Update is called once per frame
    void Update()
    {
    }
    
    private void OnCollisionEnter(Collision other)
    {
        Debug.Log($"Collision Enter {other.gameObject.name}");
    }
    
    private void OnTriggerEnter(Collider other)
    {
        CutTerrainTrigger(other);
    }

    private void OnTriggerStay(Collider other)
    {
        
        CutTerrainTrigger(other);
    }
    
    private void CutTerrainTrigger(Collider other)
    {
        
        if (other.gameObject.name != "Capsule Collider Proximal" && other.gameObject.name != "Capsule Collider Distal")
        {
            return;
        }
        
        if (Camera.main == null)
        {
            return;
        }

        if (terrainData == null)
        {
            return;
        }
        
        var capsuleCollider = other as CapsuleCollider;
        if (capsuleCollider == null)
        {
            return;
        }
        Debug.Log($"CutTerrain {other.gameObject.name}");

        var minBoundsLocalPoint =(capsuleCollider.bounds.min - terrain.transform.position);
        var maxBoundsLocalPoint =(capsuleCollider.bounds.max - terrain.transform.position);
        
        int terrainMinBoundsX = (int)((minBoundsLocalPoint.x / terrainData.size.x) * heightmapWidth);
        int terrainMinBoundsZ = (int)((minBoundsLocalPoint.z / terrainData.size.z) * heightmapHeight);
        int terrainMaxBoundsX = (int)((maxBoundsLocalPoint.x / terrainData.size.x) * heightmapWidth);
        int terrainMaxBoundsZ = (int)((maxBoundsLocalPoint.z / terrainData.size.z) * heightmapHeight);
        
        for (int terrainX = terrainMinBoundsX; terrainX < terrainMaxBoundsX; terrainX++)
        {
            for (int terrainZ = terrainMinBoundsZ; terrainZ < terrainMaxBoundsZ; terrainZ++)
            {
                var terrainPointHeight = terrainData.GetHeight(terrainX, terrainZ);
                var terrainWorldHeight = terrain.transform.position.y + terrainPointHeight * terrainData.size.y;
                var worldX = terrain.transform.position.x + ((float)terrainX / heightmapWidth) * terrainData.size.x;
                var worldZ = terrain.transform.position.z + ((float)terrainZ / heightmapHeight) * terrainData.size.z;
                var capsulePointHeight = getYAtCapsule(capsuleCollider, worldX, worldZ);
                
                if (capsulePointHeight < terrainWorldHeight)
                {
                    float[,] newHeights = new float[1, 1];
                    newHeights[0, 0] = capsulePointHeight / terrainData.size.y;
                    terrainData.SetHeights(terrainX, terrainZ, newHeights);
                }
            }
        }
    }
    
    // Raycast so slow..
    private float getYAtCapsule(CapsuleCollider capsuleCollider, float x, float z)
    {
    
        RaycastHit[] hits = Physics.RaycastAll(new Vector3(x, 0, z), Vector3.up, 2.0f);
        // Debug.DrawRay(new Vector3(x, 0, z), Vector3.up * 2.0f, Color.red, 1.0f);
        try
        {
            RaycastHit target = hits.First(hit => hit.collider == capsuleCollider);
            return target.point.y;
        }
        catch (Exception e)
        {
            return Mathf.Infinity;
        }
    }
    
    // private float getYAtCapsule(CapsuleCollider capsuleCollider, float x, float z)
    // {
    //     var point = capsuleCollider.ClosestPoint(new Vector3(x, 0, z));
    //     // if(!Mathf.Approximately(point.x, x) && !Mathf.Approximately(point.z, z))
    //     // {
    //     //     return Mathf.Infinity;
    //     // }
    //     return point.y;
    // }

    // private float getYAtCapsule(CapsuleCollider capsuleCollider, float x, float z)
    // {
    //     var capsuleCenter = capsuleCollider.transform.position + capsuleCollider.center;
    //     var capsuleHeightForward = capsuleCollider.transform.forward;
    //     if (capsuleCollider.direction == 0)
    //     {
    //         capsuleHeightForward = capsuleCollider.transform.right;
    //     }
    //
    //     if (capsuleCollider.direction == 1)
    //     {
    //         capsuleHeightForward = capsuleCollider.transform.up;
    //     }
    //
    //     capsuleHeightForward = capsuleHeightForward * capsuleCollider.height / 2;
    //     var capsuleHeightBackward = -capsuleHeightForward;
    //     
    //     
    //     // todo
    // }
}