using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TerrainCloner : MonoBehaviour
{
    public Terrain terrain; // Make sure this is assigned in the inspector

    // Start is called before the first frame update
    void Start()
    {
        if(terrain == null)
        {
            Debug.LogError("Terrain not assigned!");
            return;
        }

        var newTerrain = GameObject.Instantiate(terrain, transform, true);
        newTerrain.terrainData = Instantiate(terrain.terrainData);
        
        terrain.gameObject.SetActive(false);
    }
}