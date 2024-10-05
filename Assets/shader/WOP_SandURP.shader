// MADE BY MATTHIEU HOULLIER
// Copyright 2022 BRUTE FORCE, all rights reserved.
// You are authorized to use this work if you have purchased the asset.
// Mail me at bruteforcegamesstudio@gmail.com if you have any questions or improvements you need.
Shader "WOP/URP/SandURP"
{

    Properties
    {

        [Header(IIIIIIII          Sand Textures          IIIIIIII)]
        [Space]
        _MainTex("Sand Albedo", 2D) = "white" {}
        _MainTexMult("Sand Albedo Multiplier", Range(0,2)) = 0.11
        [MainColor][HDR]_Color("Sand Tint", Color) = (0.77,0.86,0.91,1)
        _OverallScale("Overall Scale", Float) = 1
        [Space]
        [NoScaleOffset]_BumpMap("Sand Bumpmap", 2D) = "white" {}
        _NormalMultiplier("Sand Bumpmap Multiplier", Range(0,5)) = 0.4
        _SandNormalScale("Sand Bumpmap Scale", Range(0,2)) = 1

        [Space(20)]
        [NoScaleOffset]_SpecGlossMapNew("Sand Specular", 2D) = "black" {}
        _SpecMult("Spec Multiplier", Float) = 0.5
        [NoScaleOffset]_LittleSpec("Sand Little Spec", 2D) = "black" {}
        _LittleSpecForce("Little Spec Multiplier", Float) = 0.5
        _LittleSpecSize("Little Specular Size", Float) = 3

        [NoScaleOffset]_SandHeight("Sand Displacement Texture", 2D) = "white" {}
        _HeightScale("Displacement Scale", Float) = 0.33
        _DisplacementStrength("Displacement Strength", Float) = 0.3
        _DisplacementOffset("Displacement Offset", Float) = 0.1
        _DisplacementColorMult("Displacement Color Multiplier", Float) = 0.95
        _DisplacementShadowMult("Displacement Shadow Multiplier", Range(0,2)) = 0.56
        _UpVector("Up Vector", Float) = 1
        _NormalVector("Normal Vector", Float) = 0

        [Space(20)]
        [NoScaleOffset]_SandTransition("Sand Transition", 2D) = "black" {}
        _TransitionScale("Transition Scale", Float) = 0.73
        _TransitionPower("Transition Power", Float) = 0.22
        _TransitionColor("Transition Color (additive only)", Color) = (1,1,1,1)


        [Space(10)]
        [Header(IIIIIIII          Sand Values          IIIIIIII)]
        [Space(10)]
        _MountColor("Mount Color", color) = (0.12,0.12,0.121,1)
        _BotColor("Dig Color", color) = (0.71,0.87,0.91,0)
        _NormalRTDepth("Normal Effect Depth", Range(0,3)) = 0.12
        _NormalRTStrength("Normal Effect Strength", Range(0,4)) = 2.2
        _AddSandStrength("Mount Sand Strength", Range(0,3)) = 0.52
        _RemoveSandStrength("Dig Sand Strength", Range(0,3)) = 0.5
        _SandScale("Sand Scale", float) = 1

        [Space(10)]
        [Header(IIIIIIII          Rock Textures          IIIIIIII)]
        [Space(10)]
        [NoScaleOffset]_RockTex("Rock Albedo", 2D) = "white" {}
        _RockSaturation("Rock Saturation", Float) = 1
        [HDR]_RockTint("Rock Texture Tint", Color) = (0.14,0.35,0.49,1)
        [Space]
        [NoScaleOffset]_NormalTex("Rock Normal Texture", 2D) = "black" {}
        _NormalScale("Rock Normal Scale", Range(0,2)) = 0.766
        [NoScaleOffset]_Roughness("Rock Roughness Texture", 2D) = "black" {}
        [NoScaleOffset]_ParallaxMapRock("Height map (R)", 2D) = "white" {}
        _ParallaxValue("Height scale", Range(0, 0.01)) = 0.005
        _ParallaxValueMinSamples("Parallax min samples", Range(2, 100)) = 4
        _ParallaxValueMaxSamples("Parallax max samples", Range(2, 100)) = 20

        [Space(10)]
        [Header(IIIIIIII          Rock Values          IIIIIIII)]
        [Space(10)]
        _RockTrail("Rock Trail Color", Color) = (0.40,0.1,0.01,1)
        _RockScale("Rock Scale", float) = 1
        _TransparencyValue("Rock Transparency", Range(0,1)) = 1

        [Space(10)]
        [Header(IIIIIIII          Custom Fog          IIIIIIII)]
        [Space(10)]
        [NoScaleOffset]_FogTex("Fog Texture", 2D) = "black" {}
        [NoScaleOffset]_FlowTex("Flow Texture", 2D) = "black" {}
        _FlowMultiplier("Flow Multiplier", Range(0,1)) = 0.3
        _FogIntensity("Fog Intensity", Range(0,1)) = 0.3
        _FogColor("Fog Color", Color) = (1.0,1.0,1.0,1.0)
        _FogScale("Fog Scale", float) = 1
        _FogDirection("Fog Direction", vector) = (1, 0.3, 2, 0)

        [Space(10)]
        [Header(IIIIIIII          Lighting          IIIIIIII)]
        [Space(10)]
        _ProjectedShadowColor("Projected Shadow Color",Color) = (0.17 ,0.56 ,0.1,1)
        _SpecColor("Specular Color", Color) = (1,1,1,1)
        _SpecForce("Sand Specular Force", Float) = 3
        _ShininessSand("Sand Shininess", Float) = 25
        [Space]
        _RoughnessStrength("Rock Roughness Strength", Float) = 1.75
        _ShininessRock("Rock Shininess", Float) = 10
        [Space]
        _LightOffset("Light Offset", Range(0, 1)) = 0.2
        _LightHardness("Light Hardness", Range(0, 1)) = 0.686
        _RimColor("Rim Sand Color", Color) = (0.03,0.03,0.03,0)
        _LightIntensity("Additional Lights Intensity", Range(0.00, 4)) = 1

        [Space(10)]
        [Header(IIIIIIII          Tessellation          IIIIIIII)]
        [Space(10)]
        _TessellationUniform("Tessellation Rock", Range(1, 16)) = 1
        _TessellationEdgeLength("Tessellation Sand", Range(0, 100)) = 50

        [Header(Procedural Tiling)]
        [Space]
        [Toggle(USE_PR)] _UsePR("Use Procedural Tiling (Reduce performance)", Float) = 0
        _ProceduralDistance("Tile start distance", Float) = 5.5
        _ProceduralStrength("Tile Smoothness", Float) = 1.5
        [Space]

        [Space(10)]
        [Header(IIIIIIII          Pragmas          IIIIIIII)]
        [Space(10)]
        [Toggle(IS_ROCK)] _ISROCK("Is Only Rock", Float) = 0
        [Toggle(IS_SAND)] _ISSAND("Is Only Sand", Float) = 0
        [Toggle(IS_UNLIT)] _ISUNLIT("Is Unlit", Float) = 1
        [HideInInspector][Toggle(USE_INTER)] _USEINTER("Use Intersection", Float) = 0
        [Toggle(USE_AL)] _UseAmbientLight("Use Ambient Light", Float) = 1
        [Toggle(USE_DECAL)] _USEDECAL("Use Decal", Float) = 0
        [Toggle(USE_WC)] _USEWC("Use World Displacement", Float) = 1
        [Toggle(USE_WT)] _USEWT("Use World Coordinates", Float) = 0
        [Toggle(USE_FOG)] _USEFOG("Use Custom Fog", Float) = 1
        [Toggle(USE_LOW)] _USELOW("Use Low End", Float) = 0


        // TERRAIN PROPERTIES //
        [HideInInspector] _CustomTerrainHolesTexture("Holes Map (RGB)", 2D) = "white" {}
        [HideInInspector] _Control0("Control0 (RGBA)", 2D) = "white" {}
        [HideInInspector] _Control1("Control1 (RGBA)", 2D) = "white" {}
        // Textures
        [HideInInspector] _Splat0("Layer 0 (R)", 2D) = "white" {}
        [HideInInspector] _Splat1("Layer 1 (G)", 2D) = "white" {}
        [HideInInspector] _Splat2("Layer 2 (B)", 2D) = "white" {}
        [HideInInspector] _Splat3("Layer 3 (A)", 2D) = "white" {}
        [HideInInspector] _Splat4("Layer 4 (R)", 2D) = "white" {}
        [HideInInspector] _Splat5("Layer 5 (G)", 2D) = "white" {}
        [HideInInspector] _Splat6("Layer 6 (B)", 2D) = "white" {}
        [HideInInspector] _Splat7("Layer 7 (A)", 2D) = "white" {}

        // Normal Maps
        [HideInInspector] _Normal0("Normal 0 (R)", 2D) = "bump" {}
        [HideInInspector] _Normal1("Normal 1 (G)", 2D) = "bump" {}
        [HideInInspector] _Normal2("Normal 2 (B)", 2D) = "bump" {}
        [HideInInspector] _Normal3("Normal 3 (A)", 2D) = "bump" {}
        [HideInInspector] _Normal4("Normal 4 (R)", 2D) = "bump" {}
        [HideInInspector] _Normal5("Normal 5 (G)", 2D) = "bump" {}
        [HideInInspector] _Normal6("Normal 6 (B)", 2D) = "bump" {}
        [HideInInspector] _Normal7("Normal 7 (A)", 2D) = "bump" {}

        // Normal Scales
        [HideInInspector] _NormalScale0("Normal Scale 0 ", Float) = 1
        [HideInInspector] _NormalScale1("Normal Scale 1 ", Float) = 1
        [HideInInspector] _NormalScale2("Normal Scale 2 ", Float) = 1
        [HideInInspector] _NormalScale3("Normal Scale 3 ", Float) = 1
        [HideInInspector] _NormalScale4("Normal Scale 4 ", Float) = 1
        [HideInInspector] _NormalScale5("Normal Scale 5 ", Float) = 1
        [HideInInspector] _NormalScale6("Normal Scale 6 ", Float) = 1
        [HideInInspector] _NormalScale7("Normal Scale 7 ", Float) = 1

        // Mask Maps
        [HideInInspector] _Mask0("Mask 0 (R)", 2D) = "bump" {}
        [HideInInspector] _Mask1("Mask 1 (G)", 2D) = "bump" {}
        [HideInInspector] _Mask2("Mask 2 (B)", 2D) = "bump" {}
        [HideInInspector] _Mask3("Mask 3 (A)", 2D) = "bump" {}
        [HideInInspector] _Mask4("Mask 4 (R)", 2D) = "bump" {}
        [HideInInspector] _Mask5("Mask 5 (G)", 2D) = "bump" {}
        [HideInInspector] _Mask6("Mask 6 (B)", 2D) = "bump" {}
        [HideInInspector] _Mask7("Mask 7 (A)", 2D) = "bump" {}

        // specs color
        [HideInInspector] _Specular0("Specular 0 (R)", Color) = (1,1,1,1)
        [HideInInspector] _Specular1("Specular 1 (G)", Color) = (1,1,1,1)
        [HideInInspector] _Specular2("Specular 2 (B)", Color) = (1,1,1,1)
        [HideInInspector] _Specular3("Specular 3 (A)", Color) = (1,1,1,1)
        [HideInInspector] _Specular4("Specular 4 (R)", Color) = (1,1,1,1)
        [HideInInspector] _Specular5("Specular 5 (G)", Color) = (1,1,1,1)
        [HideInInspector] _Specular6("Specular 6 (B)", Color) = (1,1,1,1)
        [HideInInspector] _Specular7("Specular 7 (A)", Color) = (1,1,1,1)

        // Metallic
        [HideInInspector] _Metallic0("Metallic0", Float) = 0
        [HideInInspector] _Metallic1("Metallic1", Float) = 0
        [HideInInspector] _Metallic2("Metallic2", Float) = 0
        [HideInInspector] _Metallic3("Metallic3", Float) = 0
        [HideInInspector] _Metallic4("Metallic4", Float) = 0
        [HideInInspector] _Metallic5("Metallic5", Float) = 0
        [HideInInspector] _Metallic6("Metallic6", Float) = 0
        [HideInInspector] _Metallic7("Metallic7", Float) = 0

        [HideInInspector] _Splat0_ST("Size0", Vector) = (1,1,0)
        [HideInInspector] _Splat1_ST("Size1", Vector) = (1,1,0)
        [HideInInspector] _Splat2_ST("Size2", Vector) = (1,1,0)
        [HideInInspector] _Splat3_ST("Size3", Vector) = (1,1,0)
        [HideInInspector] _Splat4_STn("Size4", Vector) = (1,1,0)
        [HideInInspector] _Splat5_STn("Size5", Vector) = (1,1,0)
        [HideInInspector] _Splat6_STn("Size6", Vector) = (1,1,0)
        [HideInInspector] _Splat7_STn("Size7", Vector) = (1,1,0)

        [HideInInspector] _TerrainScale("Terrain Scale", Vector) = (1, 1 ,0)
        // TERRAIN PROPERTIES //
    }

    HLSLINCLUDE
    #if defined(SHADER_API_D3D11) || defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE) || defined(SHADER_API_VULKAN) || defined(SHADER_API_METAL) || defined(SHADER_API_PSSL)
#define UNITY_CAN_COMPILE_TESSELLATION 1
#   define UNITY_domain                 domain
#   define UNITY_partitioning           partitioning
#   define UNITY_outputtopology         outputtopology
#   define UNITY_patchconstantfunc      patchconstantfunc
#   define UNITY_outputcontrolpoints    outputcontrolpoints
    #endif

    // Reused functions //
    // TESSELLATION DATA //
    float _TessellationUniform;
    float _TessellationEdgeLength;

    #pragma shader_feature IS_ROCK
    #pragma shader_feature IS_SAND
    #pragma shader_feature USE_COMPLEX_T
    #pragma shader_feature USE_DECAL

    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
    #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SurfaceInput.hlsl"

    SamplerState my_linear_repeat_sampler;
    SamplerState my_bilinear_repeat_sampler;
    SamplerState my_trilinear_repeat_sampler;
    SamplerState my_linear_clamp_sampler;

    struct TessellatedVert
    {
        float4 vertex : INTERNALTESSPOS;
        float3 normal : NORMAL;
        float4 tangent : TANGENT;
        float2 uv : TEXCOORD0;
        float4 color : COLOR;

        float4 shadowCoord : TEXCOORD1;

        UNITY_VERTEX_INPUT_INSTANCE_ID

        float4 eye: TEXCOORD5;
    };

    struct TessellationFactors
    {
        float edge[3] : SV_TessFactor;
        float inside : SV_InsideTessFactor;
    };

    float TessellationEdgeFactor(float3 p0, float3 p1)
    {
        #if defined(_TESSELLATION_EDGE)
					float edgeLength = distance(p0, p1);

					float3 edgeCenter = (p0 + p1) * 0.5;
					float viewDistance = distance(edgeCenter, _WorldSpaceCameraPos);

					float tessellationFactor = 0;
					if (_TessellationEdgeLength <= 0.01)
					{
						tessellationFactor = 5000;
					}
					else
					{
						tessellationFactor = 300 / _TessellationEdgeLength;
					}
					return edgeLength * _ScreenParams.y /
						(tessellationFactor * viewDistance);
        #else
        return _TessellationUniform;
        #endif
    }

    TessellationFactors MyPatchConstantFunction(
        InputPatch<TessellatedVert, 3> patch
    )
    {
        float3 p0 = mul(unity_ObjectToWorld, patch[0].vertex).xyz;
        float3 p1 = mul(unity_ObjectToWorld, patch[1].vertex).xyz;
        float3 p2 = mul(unity_ObjectToWorld, patch[2].vertex).xyz;
        TessellationFactors f;
        f.edge[0] = TessellationEdgeFactor(p1, p2);
        f.edge[1] = TessellationEdgeFactor(p2, p0);
        f.edge[2] = TessellationEdgeFactor(p0, p1);

        #ifdef IS_ICE
					f.inside = 1;
        #else

        #ifdef IS_SAND
					f.inside =
						(TessellationEdgeFactor(p1, p2) +
							TessellationEdgeFactor(p2, p0) +
							TessellationEdgeFactor(p0, p1)) * (1 / 3.0);
        #else
        if ((patch[0].color.g + patch[0].color.b) / 2 < 0.5 || (patch[0].color.b > 0.95 && patch[0].color.g < 0.05))
        {
            f.inside = _TessellationUniform;
        }
        else
        {
            f.inside =
            (TessellationEdgeFactor(p1, p2) +
                TessellationEdgeFactor(p2, p0) +
                TessellationEdgeFactor(p0, p1)) * (1 / 3.0);
        }
        #endif


        #endif
        return f;
    }

    [UNITY_domain("tri")]
    [UNITY_outputcontrolpoints(3)]
    [UNITY_outputtopology("triangle_cw")]
    [UNITY_partitioning("fractional_odd")]
    [UNITY_patchconstantfunc("MyPatchConstantFunction")]
    TessellatedVert Hull(
        InputPatch<TessellatedVert, 3> patch,
        uint id : SV_OutputControlPointID
    )
    {
        return patch[id];
    }

    float4 RotateAroundZInDegrees(float4 vertex, float degrees)
    {
        float alpha = degrees * 3.1416 / 180.0;
        float sina, cosa;
        sincos(alpha, sina, cosa);
        float2x2 m = float2x2(cosa, -sina, sina, cosa);
        return float4(mul(m, vertex.zy), vertex.xw).zyxw;
    }

    float4 RotateAroundXInDegrees(float4 vertex, float degrees)
    {
        float alpha = degrees * 3.1416 / 180.0;
        float sina, cosa;
        sincos(alpha, sina, cosa);
        float2x2 m = float2x2(cosa, -sina, sina, cosa);
        return float4(mul(m, vertex.xy), vertex.zw).xyzw;
    }

    float4 multQuat(float4 q1, float4 q2)
    {
        return float4(
            q1.w * q2.x + q1.x * q2.w + q1.z * q2.y - q1.y * q2.z,
            q1.w * q2.y + q1.y * q2.w + q1.x * q2.z - q1.z * q2.x,
            q1.w * q2.z + q1.z * q2.w + q1.y * q2.x - q1.x * q2.y,
            q1.w * q2.w - q1.x * q2.x - q1.y * q2.y - q1.z * q2.z
        );
    }

    float3 rotateVector(float4 quat, float3 vec)
    {
        // https://twistedpairdevelopment.wordpress.com/2013/02/11/rotating-a-vector-by-a-quaternion-in-glsl/
        float4 qv = multQuat(quat, float4(vec, 0.0));
        return multQuat(qv, float4(-quat.x, -quat.y, -quat.z, quat.w)).xyz;
    }

    void parallax_vert(
        float4 vertex,
        float3 normal,
        float4 tangent,
        out float4 eye
    )
    {
        float4x4 mW = unity_ObjectToWorld;
        float3 binormal = cross(normal, tangent.xyz) * tangent.w;
        float3 EyePosition = _WorldSpaceCameraPos;

        float4 localCameraPos = mul(unity_WorldToObject, float4(_WorldSpaceCameraPos, 1));
        float3 eyeLocal = vertex - localCameraPos;
        float4 eyeGlobal = mul(float4(eyeLocal, 1), mW);
        float3 E = eyeGlobal.xyz;

        float3x3 tangentToWorldSpace;

        tangentToWorldSpace[0] = mul(normalize(tangent), mW);
        tangentToWorldSpace[1] = mul(normalize(binormal), mW);
        tangentToWorldSpace[2] = mul(normalize(normal), mW);

        float3x3 worldToTangentSpace = transpose(tangentToWorldSpace);

        eye.xyz = mul(E, worldToTangentSpace);
        eye.w = 1 - dot(normalize(E), -normal);
    }

    float2 parallax_offset(
        float fHeightMapScale,
        float4 eye,
        float2 texcoord,
        Texture2D heightMap,
        int nMinSamples,
        int nMaxSamples
    )
    {
        float fParallaxLimit = -length(eye.xy) / eye.z;
        fParallaxLimit *= fHeightMapScale;

        float2 vOffsetDir = normalize(eye.xy);
        float2 vMaxOffset = vOffsetDir * fParallaxLimit;

        int nNumSamples = (int)lerp(nMinSamples, nMaxSamples, saturate(eye.w));

        float fStepSize = 1.0 / (float)nNumSamples;

        float2 dx = ddx(texcoord);
        float2 dy = ddy(texcoord);

        float fCurrRayHeight = 1.0;
        float2 vCurrOffset = float2(0, 0);
        float2 vLastOffset = float2(0, 0);

        float fLastSampledHeight = 1;
        float fCurrSampledHeight = 1;

        int nCurrSample = 0;

        while (nCurrSample < nNumSamples)
        {
            fCurrSampledHeight = heightMap.SampleGrad(my_linear_repeat_sampler, texcoord + vCurrOffset, dx, dy).r;
            if (fCurrSampledHeight > fCurrRayHeight)
            {
                float delta1 = fCurrSampledHeight - fCurrRayHeight;
                float delta2 = (fCurrRayHeight + fStepSize) - fLastSampledHeight;

                float ratio = delta1 / (delta1 + delta2);

                vCurrOffset = (ratio) * vLastOffset + (1.0 - ratio) * vCurrOffset;

                nCurrSample = nNumSamples + 1;
            }
            else
            {
                nCurrSample++;

                fCurrRayHeight -= fStepSize;

                vLastOffset = vCurrOffset;
                vCurrOffset += fStepSize * vMaxOffset;

                fLastSampledHeight = fCurrSampledHeight;
            }
        }

        return vCurrOffset;
    }
    ENDHLSL

    SubShader
    {

        Pass
        {
            Tags
            {
                "RenderPipeline" = "UniversalRenderPipeline"
            }
            Blend SrcAlpha OneMinusSrcAlpha

            HLSLPROGRAM
            #pragma target 4.6

            #pragma shader_feature _TESSELLATION_EDGE

            #pragma multi_compile _ LOD_FADE_CROSSFADE

            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog

            #pragma vertex tessellatedVert
            #pragma fragment frag
            #pragma hull Hull
            #pragma domain Domain

            #define FORWARD_BASE_PASS
            #pragma shader_feature USE_AL
            #pragma shader_feature USE_INTER
            #pragma shader_feature USE_WC
            #pragma shader_feature USE_WT
            #pragma shader_feature USE_LOW
            #pragma shader_feature IS_UNLIT
            #pragma shader_feature USE_PR
            #pragma shader_feature USE_FOG


            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/Shaders/LitInput.hlsl"


            #pragma multi_compile _ _MAIN_LIGHT_SHADOWS
            #pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
            #pragma multi_compile _ _SHADOWS_SOFT
            #pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
            #pragma multi_compile _ LIGHTMAP_ON

            struct VertexData //appdata
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 uv : TEXCOORD0;
                float4 color : COLOR;
                float4 shadowCoord : TEXCOORD1;
                float fogCoord : TEXCOORD2;
                UNITY_VERTEX_INPUT_INSTANCE_ID

                float4 eye: TEXCOORD5;
            };

            struct InterpolatorsVertex
            {
                float4 vertex : SV_POSITION;
                float3 normal : TEXCOORD1;
                float4 tangent : TANGENT;
                float4 uv : TEXCOORD0;
                float4 color : COLOR;
                float3 worldPos : TEXCOORD2;
                float3 viewDir: POSITION1;
                float3 normalDir: TEXCOORD3;
                float4 shadowCoord : TEXCOORD4;
                #ifdef LIGHTMAP_ON
						float4 shadowCustomCoord : TEXCOORD7;
                #endif
                float fogCoord : TEXCOORD5;
                UNITY_VERTEX_OUTPUT_STEREO

                float4 eye: TEXCOORD6;
            };

            sampler2D _DetailTex;
            float4 _MainTex_ST, _DetailTex_ST;

            sampler2D _NormalMap;


            //float _BumpScale, _DetailBumpScale;

            half4 _Color;

            sampler2D _CustomTerrainHolesTexture;
            // Render Texture Effects //
            uniform sampler2D _GlobalEffectRT;
            uniform float3 _Position;
            uniform float3 _Direction;
            uniform float _OrthographicCamSize;
            uniform sampler2D _GlobalEffectRTAdditional;
            uniform float3 _PositionAdd;
            uniform float _OrthographicCamSizeAdditional;

            sampler2D _MainTex;
            sampler2D _SpecGlossMapNew;
            sampler2D _LittleSpec;


            float _ParallaxValue;
            uint _ParallaxValueMinSamples;
            uint _ParallaxValueMaxSamples;
            Texture2D _ParallaxMapRock;

            half4 _MountColor;
            half4 _BotColor;

            float _SpecForce, _SpecMult, _LittleSpecSize, _LittleSpecForce, _UpVector, _NormalVector, _RockScale,
                  _SandScale, _TransparencyValue;
            float _NormalRTDepth, _NormalRTStrength, _AddSandStrength, _RemoveSandStrength, _DisplacementStrength,
                  _NormalMultiplier;

            //ICE Variables
            sampler2D _RockTex;
            sampler2D _NormalTex;
            sampler2D _Roughness;
            sampler2D _SandHeight;
            Texture2D _SandTransition;
            float _TransitionScale;
            float _TransitionPower;
            float _HeightScale;
            float _LightOffset;
            float _LightHardness;
            float _LightIntensity;
            float _RockSaturation;
            float _DisplacementColorMult, _DisplacementShadowMult;
            float _FogIntensity, _FogScale, _FlowMultiplier;
            float4 _FogColor;

            Texture2D _FogTex;
            Texture2D _FlowTex;

            half _OffsetScale;
            half _OverallScale;
            half _RoughnessStrength;

            half _NormalScale, _DisplacementOffset, _SandNormalScale, _MainTexMult;
            half4 _RockTint;
            half4 _RockTrail;

            float _ShininessRock, _ShininessSand;
            float _HasRT;
            float4 _ProjectedShadowColor, _TransitionColor, _RimColor;
            float _ProceduralDistance, _ProceduralStrength;
            float3 _FogDirection;


            float3 calcNormal(float2 texcoord, sampler2D globalEffect)
            {
                const float3 off = float3(-0.0005 * _NormalRTDepth, 0, 0.0005 * _NormalRTDepth);
                // texture resolution to sample exact texels
                const float2 size = float2(0.002, 0.0); // size of a single texel in relation to world units

                #ifdef USE_LOW

						float sS = tex2Dlod(globalEffect, float4(texcoord.xy + 1 * off.xy * 10, 0, 0)).y;
						float s01 = sS * 0.245945946 * _NormalRTDepth;
						float s21 = sS * 0.216216216 * _NormalRTDepth;
						float s10 = sS * 0.540540541 * _NormalRTDepth;
						float s12 = sS * 0.162162162 * _NormalRTDepth;

						float gG = tex2Dlod(globalEffect, float4(texcoord.xy + 1 * off.xy, 0, 0)).z;
						float g01 = gG * 1.945945946 * _NormalRTDepth;
						float g21 = gG * 1.216216216 * _NormalRTDepth;
						float g10 = gG * 0.540540541 * _NormalRTDepth;
						float g12 = gG * 0.162162162 * _NormalRTDepth;

						float3 va = normalize(float3(size.xy, 0)) + normalize(float3(size.xy, g21 - g01));
						float3 vb = normalize(float3(size.yx, 0)) + normalize(float3(size.xy, g12 - g10));

						float3 vc = normalize(float3(size.xy, 0)) + normalize(float3(size.xy, s21 - s01));
						float3 vd = normalize(float3(size.yx, 0)) + normalize(float3(size.xy, s12 - s10));

						float3 calculatedNormal = normalize(cross(va, vb));
						calculatedNormal.y = normalize(cross(vc, vd)).x;
						return calculatedNormal;

                #else

                float s01 = tex2Dlod(globalEffect, float4(texcoord.xy + 4 * off.xy * 10, 0, 0)).y * 0.245945946 *
                    _NormalRTDepth;
                float s21 = tex2Dlod(globalEffect, float4(texcoord.xy + 3 * off.zy * 10, 0, 0)).y * 0.216216216 *
                    _NormalRTDepth;
                float s10 = tex2Dlod(globalEffect, float4(texcoord.xy + 2 * off.yx * 10, 0, 0)).y * 0.540540541 *
                    _NormalRTDepth;
                float s12 = tex2Dlod(globalEffect, float4(texcoord.xy + 1 * off.yz * 10, 0, 0)).y * 0.162162162 *
                    _NormalRTDepth;

                float g01 = tex2Dlod(globalEffect, float4(texcoord.xy + 4 * off.xy, 0, 0)).z * 1.945945946 *
                    _NormalRTDepth;
                float g21 = tex2Dlod(globalEffect, float4(texcoord.xy + 3 * off.zy, 0, 0)).z * 1.216216216 *
                    _NormalRTDepth;
                float g10 = tex2Dlod(globalEffect, float4(texcoord.xy + 2 * off.yx, 0, 0)).z * 0.540540541 *
                    _NormalRTDepth;
                float g12 = tex2Dlod(globalEffect, float4(texcoord.xy + 1 * off.yz, 0, 0)).z * 0.162162162 *
                    _NormalRTDepth;

                float3 va = normalize(float3(size.xy, 0)) + normalize(float3(size.xy, g21 - g01));
                float3 vb = normalize(float3(size.yx, 0)) + normalize(float3(size.xy, g12 - g10));

                float3 vc = normalize(float3(size.xy, 0)) + normalize(float3(size.xy, s21 - s01));
                float3 vd = normalize(float3(size.yx, 0)) + normalize(float3(size.xy, s12 - s10));

                float3 calculatedNormal = normalize(cross(va, vb));
                calculatedNormal.y = normalize(cross(vc, vd)).x;
                return calculatedNormal;
                #endif
            }

            float4 blendMultiply(float4 baseTex, float4 blendTex, float opacity)
            {
                float4 baseBlend = baseTex * blendTex;
                float4 ret = lerp(baseTex, baseBlend, opacity);
                return ret;
            }

            float2 hash2D2D(float2 s)
            {
                //magic numbers
                return frac(sin(s) * 4.5453);
            }

            //stochastic sampling
            float4 tex2DStochastic(sampler2D tex, float2 UV)
            {
                float4x3 BW_vx;
                float2 skewUV = mul(float2x2(1.0, 0.0, -0.57735027, 1.15470054), UV * 3.464);

                //vertex IDs and barycentric coords
                float2 vxID = float2(floor(skewUV));
                float3 barry = float3(frac(skewUV), 0);
                barry.z = 1.0 - barry.x - barry.y;

                BW_vx = ((barry.z > 0)
                               ? float4x3(float3(vxID, 0), float3(vxID + float2(0, 1), 0),
                               float3(vxID + float2(1, 0), 0), barry.zyx)
                               : float4x3(float3(vxID + float2(1, 1), 0),
                                                           float3(vxID + float2(1, 0), 0),
                                                           float3(vxID + float2(0, 1), 0),
                                                           float3(-barry.z, 1.0 - barry.y, 1.0 - barry.x)));

                //calculate derivatives to avoid triangular grid artifacts
                float2 dx = ddx(UV);
                float2 dy = ddy(UV);

                float4 stochasticTex = mul(tex2D(tex, UV + hash2D2D(BW_vx[0].xy), dx, dy), BW_vx[3].x) +
                    mul(tex2D(tex, UV + hash2D2D(BW_vx[1].xy), dx, dy), BW_vx[3].y) +
                    mul(tex2D(tex, UV + hash2D2D(BW_vx[2].xy), dx, dy), BW_vx[3].z);
                return stochasticTex;
            }

            InterpolatorsVertex vert(VertexData v)
            {
                InterpolatorsVertex i;

                UNITY_SETUP_INSTANCE_ID(v);
                //UNITY_INITIALIZE_OUTPUT(InterpolatorsVertex, i);
                //UNITY_TRANSFER_INSTANCE_ID(InterpolatorsVertex, i);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(i);

                float3 worldPos = mul(unity_ObjectToWorld, v.vertex);
                float3 originalPos = worldPos;

                //RT Cam effects
                
                float2 uv = mul(unity_WorldToObject, worldPos - _Position).xy * float2(-1,1) * 3;

                uv = uv / (_OrthographicCamSize * 2);
                uv += 0.5;
                // uv = float2(1,1);

                float2 uvAdd = worldPos.zy - _PositionAdd.zy;
                uvAdd = uvAdd / (_OrthographicCamSizeAdditional * 2);
                uvAdd += 0.5;

                float3 rippleMain = 0;
                float3 rippleMainAdditional = 0;

                float ripples = 0;
                float ripples2 = 0;
                float ripples3 = 0;

                float uvRTValue = 0;


                #ifdef USE_WT
						i.uv.xy = float2(worldPos.x + _MainTex_ST.z, worldPos.z + _MainTex_ST.w) * _OverallScale * 0.05;
                #else
                i.uv.xy = TRANSFORM_TEX(v.uv, _MainTex) * _OverallScale;
                #endif
                i.uv.zw = TRANSFORM_TEX(v.uv, _DetailTex);

                if (_HasRT == 1)
                {
                    // .b(lue) = Sand Dig / .r(ed) = Sand To Ice / .g(reen) = Sand Mount
                    rippleMain = tex2Dlod(_GlobalEffectRT, float4(uv, 0, 0));
                    rippleMainAdditional = tex2Dlod(_GlobalEffectRTAdditional, float4(uvAdd, 0, 0));
                }

                #ifdef IS_ROCK
                #else
                float2 uvGradient = smoothstep(
                    0, 5, length(max(abs(mul(unity_WorldToObject, worldPos - _Position).xy * 3 ) - _OrthographicCamSize + 5, 0.0)));
                uvRTValue = saturate(uvGradient.x);

                if (v.color.b > 0.95 && v.color.g < 0.05)
                {
                }
                else
                {
                    ripples = lerp(rippleMain.x, rippleMainAdditional.x, uvRTValue);
                    ripples2 = lerp(rippleMain.y, rippleMainAdditional.y, uvRTValue);
                    ripples3 = lerp(rippleMain.z, rippleMainAdditional.z, uvRTValue);
                }
                #endif


                float slopeValue = 0;

                float rockValue = 0;

                if (v.color.b > 0.6 && v.color.g < 0.4)
                {
                    rockValue = saturate(1 - v.color.b);
                }
                else
                {
                    rockValue = saturate((v.color.g + v.color.b) / 2 - ripples);
                }

                #ifdef USE_WC
						float sandHeight = tex2Dlod(_SandHeight, float4(originalPos.xz, 0, 0) * _HeightScale * 0.1 * _SandScale).r;
                #else
                float sandHeight = tex2Dlod(_SandHeight, float4(i.uv.xy, 0, 0) * _HeightScale * _SandScale).r;
                #endif


                #ifdef IS_SAND
						rockValue = 1;
                #endif

                i.normalDir = normalize(mul(float4(v.normal, 0.0), unity_WorldToObject));
                #ifdef IS_ROCK
                #else

                if (_HasRT == 1)
                {
                    if (v.color.b > 0.95 && v.color.g < 0.05)
                    {
                        i.normal = normalize(v.normal);
                    }
                    else
                    {
                        i.normal = normalize(lerp(v.normal, calcNormal(uv, _GlobalEffectRT).rbb, rockValue));
                    }
                }
                else
                {
                    i.normal = normalize(v.normal);
                }


                float3 newNormal = normalize(i.normalDir);
                float3 additive = float3(0,0,0); 
                additive += ((float4(0, 0, -_RemoveSandStrength, 0) * _UpVector - newNormal * _RemoveSandStrength *
                    _NormalVector) * ripples3 + (float4(0, 0, _AddSandStrength * sandHeight, 0) * _UpVector + newNormal
                    * _AddSandStrength * sandHeight * _NormalVector) * ripples2 * saturate(1 - ripples3)) * saturate(
                    rockValue * 3);
                additive += (float4(_DisplacementOffset, 0, 0, 0) * _UpVector + newNormal * _DisplacementOffset *
                    _NormalVector) * saturate(rockValue * 2.5);
                additive += (float4(0, 2 * _DisplacementStrength * sandHeight, 0, 0) * _UpVector) + (newNormal * 2 *
                    _DisplacementStrength * sandHeight * _NormalVector) * saturate(saturate(rockValue * 2.5));

                additive = mul((float3x3)unity_ObjectToWorld, additive);
                worldPos += additive;

                worldPos = lerp(worldPos, mul(unity_ObjectToWorld, v.vertex),
                saturate(v.color.g - saturate(v.color.r + v.color.b)));

                v.vertex.xyz = lerp(mul(unity_WorldToObject, float4(originalPos, 1)).xyz,
                    mul(unity_WorldToObject, float4(worldPos, 1)).xyz, rockValue);

                #endif

                if (_HasRT == 1)
                {
                    v.color = lerp(v.color, saturate(float4(1, 0, 0, 1)), ripples);
                }
                i.vertex = GetVertexPositionInputs(v.vertex).positionCS;

                float4 objCam = mul(unity_WorldToObject, float4(_WorldSpaceCameraPos, 1.0));
                float3 viewDir = v.vertex.xyz - objCam.xyz;


                float tangentSign = v.tangent.w * unity_WorldTransformParams.w;
                float3 bitangent = cross(v.normal.xyz, v.tangent.xyz) * tangentSign;

                i.viewDir = float3(
                    dot(viewDir, v.tangent.xyz),
                    dot(viewDir, bitangent.xyz),
                    dot(viewDir, v.normal.xyz)
                );

                i.worldPos.xyz = mul(unity_ObjectToWorld, v.vertex);
                i.tangent = v.tangent;
                float4 finalTangent = v.tangent;

                i.color = v.color;


                VertexPositionInputs vertexInput = GetVertexPositionInputs(v.vertex.xyz);
                i.fogCoord = ComputeFogFactor(vertexInput.positionCS.z);

                #ifdef LIGHTMAP_ON
						//i.shadowCoord.xy = v.shadowCoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
						i.shadowCoord = float4(v.shadowCoord.xy * unity_LightmapST.xy + unity_LightmapST.zw, 0, 0);
						i.shadowCustomCoord = GetShadowCoord(vertexInput);
                #else
                i.shadowCoord = GetShadowCoord(vertexInput);
                #endif


                #ifndef USE_LOW
                parallax_vert(v.vertex, v.normal, finalTangent, i.eye);
                #endif

                return i;
            }


            float4 frag(InterpolatorsVertex i) : SV_Target
            {
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i)
                // Linear to Gamma //
                half gamma = 0.454545;

                float4 shadowCoord;
                half3 lm = 1;
                #if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					shadowCoord = i.shadowCoord;
                #elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					shadowCoord = TransformWorldToShadowCoord(i.worldPos);
                #else
                shadowCoord = float4(0, 0, 0, 0);
                #endif

                float4 shadowCo = shadowCoord;
                #ifdef LIGHTMAP_ON
                #ifdef _MIXED_LIGHTING_SUBTRACTIVE
					shadowCo = i.shadowCustomCoord;
                #endif
                #endif
                Light mainLight = GetMainLight(shadowCo);

                float shadowmap = 0;

                #ifdef LIGHTMAP_ON
					float3 sampledLightMap = 1;
                #ifdef _MIXED_LIGHTING_SUBTRACTIVE
					sampledLightMap = SampleLightmap(i.shadowCoord.xy, normalize(i.normalDir)) * (mainLight.shadowAttenuation + 0.4);
                #else
					sampledLightMap = SampleLightmap(i.shadowCoord.xy, normalize(i.normalDir));
                #endif


					float sampleValue = (sampledLightMap.r + sampledLightMap.g + sampledLightMap.b) / 3;
					shadowmap = sampleValue;
					half4 lightColor = half4(sampledLightMap, sampleValue);

					lightColor = lerp(_ProjectedShadowColor, 1.5, saturate(sampleValue));
                #else
                shadowmap = mainLight.shadowAttenuation;
                half4 lightColor = half4(mainLight.color.rgb,
  (mainLight.color.r + mainLight.color.g + mainLight.color.b) /
  3);
                #endif


                #if !UNITY_COLORSPACE_GAMMA
                _Color = pow(_Color, gamma * 2);
                _Color = _Color * 1.25;
                _TransitionColor = pow(_TransitionColor, gamma);
                _MountColor = pow(_MountColor, gamma);
                _BotColor = pow(_BotColor, gamma);
                _RockTint = pow(_RockTint, gamma * 10);
                _RockTrail = pow(_RockTrail, gamma);
                _ProjectedShadowColor = pow(_ProjectedShadowColor, gamma);
                _SpecColor = pow(_SpecColor, gamma);
                _RimColor = pow(_RimColor, gamma);
                #ifdef LIGHTMAP_ON
                #else
                lightColor.rgb = pow(lightColor.rgb, gamma);
                #endif
                _LittleSpecForce = max(0.01, pow(_LittleSpecForce, gamma) * 1.5);


                #endif


                float uvRTValue = 0;
                float2 uv = mul(unity_WorldToObject, i.worldPos - _Position).xy * float2(-1,1) * 3;

                uv = uv / (_OrthographicCamSize * 2);
                uv += 0.5;

                float2 uvAdd = i.worldPos.zy - _PositionAdd.zy;
                uvAdd = uvAdd / (_OrthographicCamSizeAdditional * 2);
                uvAdd += 0.5;

                float3 rippleMain = 0;
                float3 rippleMainAdditional = 0;
                float3 calculatedNormal = 0;
                float3 calculatedNormalAdd = 0;

                float ripples = 0;
                float ripples2 = 0;
                float ripples3 = 0;
                float rockValue = 1;
                float sandHeight = 0;
                float sandHeightReal = 0;

                #ifdef USE_PR
								float dist = clamp(lerp(0, 1, (distance(_WorldSpaceCameraPos, i.worldPos) - _ProceduralDistance) / max(_ProceduralStrength, 0.05)), 0, 1);
                #endif

                #ifdef IS_ROCK
                #else
                sandHeight = saturate(
                    _SandTransition.Sample(my_linear_repeat_sampler, i.uv * _TransitionScale * _SandScale).r);

                #ifdef USE_WC

                #ifdef USE_PR
								sandHeightReal = lerp(tex2D(_SandHeight, float2(i.worldPos.x, i.worldPos.z) * _HeightScale * 0.1 * _SandScale).r, tex2DStochastic(_SandHeight, float2(i.worldPos.x, i.worldPos.z) * _HeightScale * 0.1 * _SandScale).r, dist);
                #else
								sandHeightReal = tex2D(_SandHeight, float2(i.worldPos.x, i.worldPos.z) * _HeightScale * 0.1 * _SandScale).r;
                #endif

                #else

                #ifdef USE_PR
								sandHeightReal = lerp(tex2D(_SandHeight, i.uv.xy * _HeightScale * _SandScale).r, tex2DStochastic(_SandHeight, i.uv.xy * _HeightScale * _SandScale).r, dist);
                #else
                sandHeightReal = tex2D(_SandHeight, i.uv.xy * _HeightScale * _SandScale).r;
                #endif
                #endif


                #endif


                #ifdef IS_SAND
								rockValue = 1;
                #else
                rockValue = saturate(pow(saturate(i.color.g),
                     1 + clamp(
                         abs((sandHeight - 0.5) * 20) * -_TransitionPower * (saturate(
                             i.color.g)),
                         -1, 1)) * 1.25);
                #endif


                #ifndef USE_LOW
                // OCCLUSION PARALLAX //
                float2 offsetParallax = parallax_offset(_ParallaxValue, i.eye, i.uv * _RockScale,
                                                                       _ParallaxMapRock, _ParallaxValueMinSamples,
                                                                       _ParallaxValueMaxSamples);
                i.uv.xy = lerp(i.uv.xy + offsetParallax, i.uv.xy, rockValue);
                #endif


                #ifdef IS_ROCK
                #else

                if (_HasRT == 1)
                {
                    rippleMain = tex2D(_GlobalEffectRT, uv);
                    rippleMainAdditional = tex2D(_GlobalEffectRTAdditional, uvAdd);

                    float2 uvGradient = smoothstep(
                        0, 5, length(max(abs(mul(unity_WorldToObject, i.worldPos - _Position).xy * 3 ) - _OrthographicCamSize + 5, 0.0)));
                    uvRTValue = saturate(uvGradient.x);
                    ripples = lerp(rippleMain.x, rippleMainAdditional.x, uvRTValue);
                }
                #endif


                float hole = 1;


                //float3 normal = UnpackNormalScale(tex2D(_BumpMap, (i.uv) * _SandNormalScale * _SandScale), _NormalMultiplier * 2).rgb * rockValue - i.normal;
                float3 normal = UnpackNormalScale(
                    _BumpMap.Sample(sampler_BumpMap, (i.uv) * _SandNormalScale * _SandScale),
                    _NormalMultiplier * 2).rgb * rockValue - i.normal;
                half3 normalTex = UnpackNormalScale(tex2D(_NormalTex, i.uv * _RockScale), _NormalScale);

                half4 c = _Color;

                #ifdef IS_ROCK
                #else

                if (_HasRT == 1)
                {
                    if (i.color.b > 0.95 && i.color.g < 0.05)
                    {
                    }
                    else
                    {
                        ripples2 = lerp(rippleMain.y, rippleMainAdditional.y, uvRTValue);
                        ripples3 = lerp(rippleMain.z, rippleMainAdditional.z, uvRTValue);
                        calculatedNormal = calcNormal(uv, _GlobalEffectRT);
                        calculatedNormal.y = lerp(calculatedNormal.y, 0, saturate(ripples3 * 5));
                        calculatedNormalAdd = calcNormal(uvAdd, _GlobalEffectRTAdditional);
                        calculatedNormal = lerp(calculatedNormal, 0, uvRTValue);
                    }

                    c = lerp(
                        c,
                        _BotColor * 2 - 1,
                        ripples3);

                    c = lerp(
                        c,
                        c + _MountColor,
                        saturate(saturate(ripples2 - ripples3) * saturate(sandHeight + 0.5) * 1));

                    c.rgb = lerp(c.rgb, c.rgb * _BotColor,
            clamp(ripples3 * saturate(calculatedNormalAdd.r - 0.15) * _NormalRTStrength * 1, 0, 1));
                }
                c.rgb = c.rgb * lightColor;
                c.rgb = lerp(c.rgb * _Color * _DisplacementColorMult, c.rgb, sandHeightReal);
                #endif
                float3 normalEffect = i.normal;

                c *= lerp(1, saturate(pow(tex2D(_MainTex, i.uv * _SandScale) + _MainTexMult * 0.225, 2)), _MainTexMult);
                #ifdef USE_FOG
								half3 flowVal = (_FlowTex.Sample(my_bilinear_repeat_sampler, i.uv)) * _FlowMultiplier;

								float dif1 = frac(_Time.y * 0.15 + 0.5);
								float dif2 = frac(_Time.y * 0.15);

								half lerpVal = abs((0.5 - dif1) / 0.5);

								//_FogDirection
								half3 col1 = _FogTex.Sample(my_bilinear_repeat_sampler, i.uv * _FogScale - flowVal.xy * dif1 + (normalize(_FogDirection.xy) * _Time.y * -0.02 * _FogDirection.z));
								half3 col2 = _FogTex.Sample(my_bilinear_repeat_sampler, i.uv * _FogScale - flowVal.xy * dif2 + (normalize(_FogDirection.xy) * _Time.y * -0.02 * _FogDirection.z));

								half3 fogFlow = lerp(col1, col2, lerpVal);
								fogFlow = abs(pow(fogFlow, 5));
                #endif

                float3 viewDirTangent = i.viewDir;

                #ifdef USE_PR
								half4 RockTex = half4(lerp(1, pow(lerp(tex2D(_RockTex, i.uv * _RockScale), tex2DStochastic(_RockTex, i.uv * _RockScale), dist), _RockSaturation), _RockTint.a) * _RockTint.rgb * 2, 1);
                #else
                half4 RockTex = half4(
                    lerp(1, pow(tex2D(_RockTex, i.uv * _RockScale), _RockSaturation), _RockTint.a) * _RockTint.rgb * 2,
                    1);
                #endif

                RockTex.rgb = RockTex.rgb * lightColor;

                float3 viewDirection = normalize(_WorldSpaceCameraPos - i.worldPos.xyz);
                float3 normalDirection = normalize(i.normalDir);

                //float3 normalDirectionWithNormal = normalize(i.normalDir) + normalize(i.normalDir) * normalize(abs(tex2D(_BumpMap, i.uv * _SandNormalScale * _SandScale))) * _NormalMultiplier;
                float3 normalDirectionWithNormal = normalize(i.normalDir) + normalize(i.normalDir) * (lerp(
                    abs(_BumpMap.Sample(sampler_BumpMap, i.uv * _SandNormalScale * _SandScale)) * _NormalMultiplier,
                    tex2D(_NormalTex, i.uv * _RockScale) * _NormalScale, saturate(1 - rockValue)));

                half fresnelValue = lerp(0, 1, saturate(dot(normalDirection, viewDirection)));
                _OffsetScale = max(0, _OffsetScale);

                half parallax = 0;

                float3 newRoughnessTex = 0;
                #if !UNITY_COLORSPACE_GAMMA
                //newRoughnessTex = tex2D(_Roughness, i.uv * _RockScale).rgb;
                newRoughnessTex = pow(tex2D(_Roughness, i.uv * _RockScale).rgb, 1.75);
                #else
								newRoughnessTex = tex2D(_Roughness, i.uv * _RockScale).rgb;
                #endif

                float alphaRock = 1;
                alphaRock = saturate(1 - saturate((newRoughnessTex.r + newRoughnessTex.g + newRoughnessTex.b) / 3));

                half4 blended = 0;

                if (i.color.b > 0.95 && i.color.g < 0.05)
                {
                    blended = RockTex;
                }
                else
                {
                    blended = RockTex - saturate(_RockTrail * ripples3 * _RockTrail.a);
                }

                #if !UNITY_COLORSPACE_GAMMA
                blended.rgb = lerp(
                    blended.rgb + saturate(newRoughnessTex * _RoughnessStrength) * 0.4 * saturate(lightColor.a),
                    blended.rgb, saturate(alphaRock));
                #else
								blended.rgb = lerp(blended.rgb + newRoughnessTex * 0.4, blended.rgb, alphaRock);
                #endif

                blended.rgb = blended.rgb * saturate(
                    _ParallaxMapRock.Sample(my_linear_repeat_sampler, i.uv * _RockScale) + 0.25);

                float3 albedo = 1;
                #ifdef	IS_ROCK
								albedo = blended * 0.5;
                #else

                #if !UNITY_COLORSPACE_GAMMA
                albedo = lerp(blended, c.rgb, saturate(pow(rockValue, 3)));
                #else
								albedo = lerp(blended * 0.5, c.rgb, saturate(pow(rockValue, 3)));
                #endif
                #endif


                float3 lightDirection;
                float attenuation = 1;
                half3 worldNormal;
                #if !UNITY_COLORSPACE_GAMMA
                shadowmap = pow(shadowmap, gamma);
                #endif

                #ifdef IS_UNLIT
								shadowmap = 1;
                #endif

                worldNormal.x = dot(normalDirection.x,
     lerp(normalTex, UnpackNormalScale(
                                      _BumpMap.Sample(sampler_BumpMap, i.uv * _SandScale),
                                      _NormalMultiplier).rgb * 3, rockValue));
                worldNormal.y = dot(normalDirection.y,
                                                lerp(normalTex, UnpackNormalScale(
                                                     _BumpMap.Sample(sampler_BumpMap, i.uv * _SandScale),
                                                     _NormalMultiplier).rgb * 3, rockValue));
                worldNormal.z = dot(normalDirection.z,
          lerp(normalTex, UnpackNormalScale(
                                                _BumpMap.Sample(sampler_BumpMap, i.uv * _SandScale),
                                                _NormalMultiplier).rgb * 3, rockValue));


                _ShininessRock = max(0.1, _ShininessRock);
                _ShininessSand = max(0.1, _ShininessSand);


                #ifdef LIGHTMAP_ON
								lightDirection = normalize(float3(0, 1, 0));
                #else
                if (0.0 == _MainLightPosition.w) // directional light
                {
                    attenuation = 1.0; // no attenuation
                    lightDirection = normalize(_MainLightPosition.xyz);
                }
                else // point or spot light
                {
                    float3 vertexToLightSource =
                        _MainLightPosition.xyz - i.worldPos.xyz;
                    float distance = length(vertexToLightSource);
                    attenuation = 1.0 / distance; // linear attenuation 
                    lightDirection = normalize(vertexToLightSource);
                }
                #endif


                float3 ambientLighting = UNITY_LIGHTMODEL_AMBIENT.rgb;
                #if !UNITY_COLORSPACE_GAMMA
                ambientLighting = pow(ambientLighting, gamma);
                #endif
                ambientLighting *= _Color.rgb;

                float3 diffuseReflection =
                    attenuation * lightColor * _Color.rgb
                    * max(0.0, dot(normalDirection, lightDirection));

                float3 specularReflection;
                if (dot(normalDirection, lightDirection) < 0.0)
                // light source on the wrong side
                {
                    specularReflection = float3(0.0, 0.0, 0.0);
                    // no specular reflection
                }
                else // light source on the right side
                {
                    specularReflection = attenuation * lightColor
                        * _SpecColor.rgb * pow(max(0.0, dot(
       reflect(-lightDirection, normalDirection),
       viewDirection)),
                                lerp(_ShininessRock, _ShininessSand, rockValue));
                }

                float NdotL = 1;
                #ifdef LIGHTMAP_ON
								NdotL = 1;
                #else
                NdotL = 0.5 * (dot(_MainLightPosition.xyz, normalDirectionWithNormal)) + 0.5;
                // Lambert Normal adjustement
                NdotL = lerp(
                    NdotL,
                    NdotL + saturate(sandHeightReal) * 0.1 * _DisplacementStrength - saturate(1 - sandHeightReal) * 0.1
                    * _DisplacementStrength, rockValue * _DisplacementShadowMult);
                NdotL = saturate(NdotL);
                #endif

                float lightIntensity = smoothstep(0.1 + _LightOffset * clamp((_LightHardness + 0.5) * 2, 1, 10),
(0.101 + _LightOffset) * clamp((_LightHardness + 0.5) * 2, 1, 10), NdotL * shadowmap);
                _SpecForce = max(0.1, _SpecForce);

                #ifdef IS_UNLIT
								lightIntensity = 1;
                #endif

                half3 shadowmapColor = lerp(_ProjectedShadowColor, 1, lightIntensity);


                #ifdef USE_DECAL
								// URP DECAL //
								FETCH_DBUFFER(DBuffer, _DBufferTexture, int2(i.vertex.xy));

								DecalSurfaceData decalSurfaceData;
								DECODE_FROM_DBUFFER(DBuffer, decalSurfaceData);

								albedo.xyz = albedo.xyz * decalSurfaceData.baseColor.w + decalSurfaceData.baseColor.xyz;
								// URP DECAL //
                #endif

                albedo.xyz = albedo.xyz * saturate(shadowmapColor);


                float4 specGloss = pow(tex2D(_SpecGlossMapNew, i.uv * 2 * _SandScale), _SpecForce) * _SpecMult;
                float4 littleSpec = tex2D(_LittleSpec, i.uv * _SandScale * _LittleSpecSize) * saturate(1 - ripples3) *
                    saturate(lightIntensity);


                #ifdef	IS_ROCK
								half rougnessTex = newRoughnessTex.r * 2 * _RoughnessStrength * saturate(1 - ripples3) * 1;
                #else
                half rougnessTex = newRoughnessTex.r * 2 * _RoughnessStrength * saturate(1 - ripples3) * (1 -
                    rockValue);
                #endif


                rougnessTex = rougnessTex * saturate(
                    UnpackNormalScale(tex2D(_NormalTex, i.uv * _RockScale), _NormalScale) + 0.25);

                #ifdef	IS_ROCK
								specGloss.r = specGloss.r * saturate(normal);
                #else
                if (_HasRT == 1)
                {
                    specGloss.r = specGloss.r * saturate(normal) + saturate(ripples3 * 30) * lerp(
                        0, 1, saturate(
                            saturate(1 - ripples3 * 5) * calculatedNormal.x * reflect(-lightDirection, normalDirection))
                        .x * _NormalRTStrength * saturate(shadowmapColor * 2));
                    specGloss.r = specGloss.r * saturate(normal) + saturate(ripples2 * 30) * lerp(
                        0, 0.1, saturate(
                            saturate(1 - ripples2 * 5) * calculatedNormal.y * reflect(lightDirection, -normalDirection))
                        .x * _NormalRTStrength * saturate(shadowmapColor * 2));
                }
                else
                {
                    specGloss.r = specGloss.r * saturate(normal);
                }

                #endif
                _LittleSpecForce = max(0, _LittleSpecForce);

                #ifdef	IS_ROCK
								specularReflection = parallax + specularReflection;
                #else
                specularReflection = lerp(parallax + specularReflection,
                                             specularReflection * (specGloss.r + lerp(
                                                 littleSpec.g * _LittleSpecForce * 0.2,
                                                 littleSpec.g * _LittleSpecForce,
                                                 specularReflection)),
                                             saturate(rockValue * 3));
                // multiply the *3 for a better sand ice transition
                #endif
                float smallSpec = pow(max(0.0, dot(reflect(-lightDirection, normalDirection + parallax * 0.01),
                                                                viewDirection)), 800);


                smallSpec = saturate(
                    smallSpec * saturate(UnpackNormalScale(tex2D(_NormalTex, i.uv * _RockScale), 20) + 0.8));

                #ifdef	IS_ROCK
								specularReflection = diffuseReflection * 0.1 + specularReflection * rougnessTex;
                #else
                if (_HasRT == 1)
                {
                    #if !UNITY_COLORSPACE_GAMMA
                    specularReflection = specularReflection - lerp(0, saturate(0.200),
                        saturate(
                            saturate(lightColor.a * lightIntensity + lightColor.a * 0.35) * saturate(
                                1 - ripples3 * 4) *
                            calculatedNormal.x * reflect(lightDirection, normalDirection)).x *
                        _NormalRTStrength);
                    #else
									specularReflection = specularReflection - lerp(0, saturate(0.075), saturate(saturate(lightColor.a * lightIntensity + lightColor.a * 0.35) * saturate(1 - ripples3 * 4) * calculatedNormal.x * reflect(lightDirection, normalDirection)).x * _NormalRTStrength);
                    #endif
                    specularReflection = specularReflection + lerp(0, saturate(0.125),
                                                            saturate(
                                                                saturate(
                                                                    lightColor.a * lightIntensity + lightColor.a * 0.35)
                                                                * saturate(1 - ripples3 * 8) * calculatedNormal.x *
                                                                reflect(-lightDirection, normalDirection)).x *
                                                            _NormalRTStrength);

                    specularReflection = specularReflection - lerp(0, saturate(1 - _ProjectedShadowColor) * 0.25,
                                                          saturate(
                                                              saturate(1 - ripples2 * 1) * calculatedNormal.y * reflect(
                                                                  -lightDirection,
                                                                  normalDirection)).x * _NormalRTStrength);
                    specularReflection = specularReflection - lerp(
                        0, -0.1, saturate(
                            saturate(1 - ripples2 * 1) * calculatedNormal.y * -
                            reflect(-lightDirection, normalDirection)).x * _NormalRTStrength);
                    specularReflection = specularReflection + lerp(0, saturate(0.2),
  saturate(saturate(1 - ripples2 * 6) * calculatedNormal.y * reflect(
      lightDirection, normalDirection)).x * _NormalRTStrength * 0.5);
                }
                specularReflection = lerp(specularReflection,
                diffuseReflection * 0.1 + specularReflection * rougnessTex,
                saturate(pow(1 - rockValue, 2) * 3));
                #endif

                #ifdef USE_AL
								half3 ambientColor = SampleSH(half4(lerp(normalDirection, normalDirection + normalEffect * 2.5, saturate(ripples3 * rockValue)), 1));
                #if !UNITY_COLORSPACE_GAMMA
								ambientColor = pow(ambientColor, gamma) * 1.0;
                #endif
								albedo.rgb = saturate(albedo.rgb + saturate(ambientColor - 0.5) * 0.75);

                #endif
                half fresnelRefl = lerp(1, 0, saturate(dot(normalDirection, viewDirection) * 2.65 * _RimColor.a));

                #ifdef	IS_ROCK

                #else
                albedo.rgb = lerp(albedo.rgb, albedo.rgb + _RimColor,
                                       saturate(rockValue * (fresnelRefl + normal * fresnelRefl * 0.2)));
                #endif
                albedo += float4(specularReflection.r, specularReflection.g, specularReflection.b, 1.0) * _SpecColor.
                    rgb;


                #ifdef USE_FOG
								// CUSTOM FOG RENDER //
								albedo.rgb = lerp(albedo.rgb, albedo.rgb + fogFlow * _FogColor, _FogIntensity);
                #endif

                // Additional light pass in URP, thank you Unity for this //
                int additionalLightsCount = GetAdditionalLightsCount();
                half3 addLightColor = 0;
                for (int ii = 0; ii < additionalLightsCount; ii++)
                {
                    Light light = GetAdditionalLight(ii, i.worldPos);
                    addLightColor += (light.color * light.distanceAttenuation * _LightIntensity);
                }

                albedo.rgb += addLightColor;

                half transparency = 1;

                transparency = saturate(lerp(_TransparencyValue, 1, saturate(pow(rockValue, 2))));

                albedo = max(0, albedo);

                albedo.xyz = MixFog(albedo, i.fogCoord);
                return float4(albedo, transparency);
                //return float4(lightColor.xyz, transparency);
                //return float4(abs(offsetParallax) * 100,1, transparency);
                //return float4(i.color.rgb, 1);
            }

            TessellatedVert tessellatedVert(VertexData v)
            {
                TessellatedVert p;

                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_TRANSFER_INSTANCE_ID(v, p);

                p.vertex = v.vertex;
                p.normal = v.normal;
                p.tangent = v.tangent;
                p.uv = v.uv;
                p.color = v.color;
                p.shadowCoord = v.shadowCoord;

                p.eye = v.eye;
                return p;
            }

            [UNITY_domain("tri")]
            InterpolatorsVertex Domain(
                TessellationFactors factors,
                OutputPatch<TessellatedVert, 3> patch,
                float3 barycentricCoordinates : SV_DomainLocation
            )
            {
                VertexData data;

                #define MY_DOMAIN_PROGRAM_INTERPOLATE(fieldName) data.fieldName = \
							patch[0].fieldName * barycentricCoordinates.x + \
							patch[1].fieldName * barycentricCoordinates.y + \
							patch[2].fieldName * barycentricCoordinates.z;

                MY_DOMAIN_PROGRAM_INTERPOLATE(vertex)
                MY_DOMAIN_PROGRAM_INTERPOLATE(normal)
                MY_DOMAIN_PROGRAM_INTERPOLATE(tangent)
                MY_DOMAIN_PROGRAM_INTERPOLATE(uv)
                MY_DOMAIN_PROGRAM_INTERPOLATE(color)
                MY_DOMAIN_PROGRAM_INTERPOLATE(shadowCoord)


                MY_DOMAIN_PROGRAM_INTERPOLATE(eye)

                UNITY_SETUP_INSTANCE_ID(data);
                UNITY_TRANSFER_INSTANCE_ID(patch[0], data);

                return vert(data);
            }
            ENDHLSL
        }
    }
}