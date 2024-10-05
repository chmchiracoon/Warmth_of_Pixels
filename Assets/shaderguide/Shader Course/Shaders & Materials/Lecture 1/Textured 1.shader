Shader "Unit/Textured" {
    properties {
        _MainTex ("Texture", 2D) = "white" {}
        _Rock ("Rock", 2D) = "white" {}
        _Pattern ("Pattern", 2D) = "white" {}
        _MidSamplelevel ("MIP", Float) = 0
    }
    SubShader
    {
        Tags {"RenderType"="Opaque"}
        
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

             #define TAU 6.28318530718

            struct MeshData
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct Interpolators
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
                float worldPos : TEXCOORD1;

            };

            sampler2D _MainTex;
            sampler2D _Rock;
            sampler2D _Pattern;
            float _MipSampleLevel;

           Interpolators vert (MeshData v)
           {
               Interpolators o;
               o.worldPos = mul(UNITY_MATRIX_M, v.vertex );
               
               
           }
            ENDCG

            
        }
    }
}