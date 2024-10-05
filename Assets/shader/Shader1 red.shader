Shader "Unlit/NewUnlitShader" {
    Properties { 
        _ColorA ("Color A", Color) = (1, 1, 1, 1)
        _ColorB ("Color B", Color) = (1, 1, 1, 1)
        _ColorStart ("ColorStart", Range( 0, 1 )) = 0
        _ColorEnd ("ColorEnd", Range( 0, 1 )) = 1
    }
    SubShader {
        Tags { "RenderType"="Opaque" }

        Pass {

            CGPROGRAM 
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            float4 _ColorA;
            float4 _ColorB;
            float _ColorStart;
            float _ColorEnd; 
            
            struct Meshdata
            { 
                float4 vertex : POSITION; 
                float3 normals : NORMAL;
                
                float2 uv0 : TEXCOORD0; 
            };

            struct Interpolators
            {
                float4 vertex : SV_POSITION;
                float3 normal : TEXCOORD0;
                float2 uv : TEXCOORD1;
            };

            Interpolators vert (Meshdata v) {
                Interpolators o; 
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.normal = UnityObjectToWorldNormal( v.normals ); //
                o.uv = v.uv0;         //(v.uv0 + _Offset) * _Scale;
                return o;
            }

            float InverseLerp ( float a, float b, float v )
            {
                return (v-a)/(b-a);
            }

            fixed4 frag (Interpolators i) : SV_Target 
            {

                float t = InverseLerp( _ColorStart, _ColorEnd, i.uv.x );
                
                return t;

                // Blend between two colors based on the X UV coordinates. 
                //float4 outColor = lerp( _ColorA, _ColorB, i.uv.x );
               //return outColor;
            }
            ENDCG
        }
    }
}
