using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GenerateTerrain : MonoBehaviour
{
    public Terrain terrain;

    private TerrainData terrainData;

    void Awake()
    {
        // Initialize the terrainData reference
        terrainData = terrain.terrainData;
    }

    void Start()
    {
        // Call the method to edit the terrain
        EditTerrain();
    }

    private void EditTerrain()
    {
        int heightmapWidth = terrainData.heightmapResolution;
        int heightmapHeight = terrainData.heightmapResolution;

        // Get the height values from the terrain
        float[,] heights = terrainData.GetHeights(0, 0, heightmapWidth, heightmapHeight);

        for (int z = 0; z < heightmapHeight; z++)
        {
            for (int x = 0; x < heightmapWidth; x++)
            {
                float cos = Mathf.Cos(x);
                float sin = -Mathf.Sin(z);
                heights[x, z] = (cos - sin) / 250;
            }
        }
        // Set the modified heights back to the terrain
        terrainData.SetHeights(0, 0, heights);
    }
}