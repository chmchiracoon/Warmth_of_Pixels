using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class ModifyTerrain : MonoBehaviour
{
    public Terrain terrain; // Make sure this is assigned in the inspector
    public float strength = 0.01f;

    private int heightmapWidth;
    private int heightmapHeight;
    private float[,] heights;
    private TerrainData terrainData;

    void Start()
    {
        // Ensure terrain is assigned
        if (terrain == null)
        {
            Debug.LogError("Terrain not assigned!");
            return;
        }

        terrainData = terrain.terrainData;

        // Check if terrainData is not null
        if (terrainData == null)
        {
            Debug.LogError("TerrainData is null!");
            return;
        }

        heightmapWidth = terrainData.heightmapResolution;
        heightmapHeight = terrainData.heightmapResolution;
        heights = terrainData.GetHeights(0, 0, heightmapWidth, heightmapHeight);
    }

    void Update()
    {
        // Ensure the camera and mouse are available
        if (Camera.main == null)
        {
            Debug.LogError("Main Camera not found!");
            return;
        }

        if (Mouse.current == null)
        {
            Debug.LogError("Mouse input not detected!");
            return;
        }

        RaycastHit hit;
        Ray ray = Camera.main.ScreenPointToRay(Mouse.current.position.ReadValue());

        // Raise Terrain
        if (Mouse.current.leftButton.isPressed)
        {
            if (Physics.Raycast(ray, out hit))
            {
                RaiseTerrain(hit.point);
            }
        }

        // Lower Terrain
        if (Mouse.current.rightButton.isPressed)
        {
            if (Physics.Raycast(ray, out hit))
            {
                LowerTerrain(hit.point);
            }
        }
    }

    private void LowerTerrain(Vector3 point)
    {
        ModifyTerrainHeight(point, -strength);
    }

    private void RaiseTerrain(Vector3 point)
    {
        ModifyTerrainHeight(point, strength);
    }

    private void ModifyTerrainHeight(Vector3 point, float adjustment)
    {
        // Calculate the local position relative to the terrain
        Vector3 localPoint = point - terrain.transform.position;

        // Convert local position to heightmap coordinates
        int mouseX = (int)((localPoint.x / terrainData.size.x) * heightmapWidth);
        int mouseZ = (int)((localPoint.z / terrainData.size.z) * heightmapHeight);

        // Boundary checks
        if (mouseX < 0 || mouseX >= heightmapWidth || mouseZ < 0 || mouseZ >= heightmapHeight)
        {
            Debug.LogWarning("Mouse position out of terrain bounds");
            return;
        }

        float[,] modifiedHeights = new float[1, 1];
        float y = heights[mouseX, mouseZ];
        y += adjustment * Time.deltaTime;

        // Clamping the height value
        y = Mathf.Clamp(y, 0, 1);

        modifiedHeights[0, 0] = y;
        heights[mouseX, mouseZ] = y;
        terrainData.SetHeights(mouseX, mouseZ, modifiedHeights);
    }
}
