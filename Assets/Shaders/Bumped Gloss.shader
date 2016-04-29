Shader "Custom/Vertex Sepcular with Specular Map" {
    Properties {
        _Color ("Main Color", Color) = (1,1,1,1)
        _SpecColor ("Specular Color", Color) = (0.5859375, 0.5859375, 0.5859375, 1)
        _Shininess ("Shininess", float) = 32
 
        _MainTex ("Texture (RGB)", 2D) = "white" {}
        _BlendTex ("Detail Map (RGB), Gloss (A)" , 2D) = "white" {}
        _BlendDetail("Detail Tiling",vector) = (1,1,1,1)
        _Blend ("Blend Range",float) = 1
    }
    SubShader {
        Tags { "Queue"="Geometry" "IgnoreProjector"="False" "RenderType"="Opaque"}
        LOD 200
        CGPROGRAM
        #pragma surface surf ColoredSpecular
        //vertex:vert
        //finalcolor:mycolor
        #include "UnityCG.cginc"
 
        fixed4 _Color;
        sampler2D _MainTex;
        sampler2D _BlendTex;
        float _Blend;
        float _Shininess;
        float4 _BlendDetail;
 
        struct MySurfaceOutput {
            half3 Albedo;
            half3 Normal;
            half3 Emission;
            half Specular;
            half3 Gloss;
            half Alpha;
        };
 
        struct Input {
            float2 uv_MainTex;
            float2 uv_BlendTex;
        };
        //void vert (inout appdata_full v, out Input o) {
        //}
        inline half4 LightingColoredSpecular_PrePass (MySurfaceOutput s, half4 light) {
            half3 spec = light.a * s.Gloss;
 
            half4 c;
            c.rgb = (s.Albedo * light.rgb + light.rgb * spec);
            c.a = s.Alpha + spec * _SpecColor.a;
            return c;
        }
       
        inline half4 LightingColoredSpecular (MySurfaceOutput s, half3 lightDir, half3 viewDir, half atten)    {
            half3 h = normalize (lightDir + viewDir);
 
            half diff = max (0, dot (s.Normal, lightDir));
            float nh = max (0, dot (s.Normal, h));
            float spec = pow (nh, s.Specular * 128);
            half3 specCol = spec * s.Gloss;
 
            half4 c;
            c.rgb = (s.Albedo * _LightColor0.rgb * diff + _LightColor0.rgb * specCol) * (atten * 2) * _SpecColor;
            c.a = s.Alpha;
            return c;
        }
 
        void surf (Input IN, inout MySurfaceOutput o) {
            fixed4 mt = tex2D(_MainTex, IN.uv_MainTex);
            float2 swapUVs = IN.uv_BlendTex ;
            swapUVs *= _BlendDetail.xy;
            fixed4 bt = tex2D(_BlendTex, swapUVs);
 
            o.Albedo = mt.rgb * (bt.rgb * _Blend) * _Color.rgb;
            o.Gloss = bt.a;
            o.Specular = _Shininess/128;
        }
        ENDCG
    }
}