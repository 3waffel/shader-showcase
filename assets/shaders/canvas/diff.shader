shader_type canvas_item;

uniform vec2 resolution;
uniform float time;
uniform vec2 mouse;
uniform sampler2D backbuffer;

vec3 permute(vec3 x) { return mod(((x*34.0)+1.0)*x, 289.0); }

float snoise(vec2 v){
  const vec4 C = vec4(0.211324865405187, 0.366025403784439,
           -0.577350269189626, 0.024390243902439);
  vec2 i  = floor(v + dot(v, C.yy) );
  vec2 x0 = v -   i + dot(i, C.xx);
  vec2 i1;
  i1 = (x0.x > x0.y) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
  vec4 x12 = x0.xyxy + C.xxzz;
  x12.xy -= i1;
  i = mod(i, 289.0);
  vec3 p = permute( permute( i.y + vec3(0.0, i1.y, 1.0 ))
  + i.x + vec3(0.0, i1.x, 1.0 ));
  vec3 m = max(0.5 - vec3(dot(x0,x0), dot(x12.xy,x12.xy),
    dot(x12.zw,x12.zw)), 0.0);
  m = m*m ;
  m = m*m ;
  vec3 x = 2.0 * fract(p * C.www) - 1.0;
  vec3 h = abs(x) - 0.5;
  vec3 ox = floor(x + 0.5);
  vec3 a0 = x - ox;
  m *= 1.79284291400159 - 0.85373472095314 * ( a0*a0 + h*h );
  vec3 g;
  g.x  = a0.x  * x0.x  + h.x  * x0.y;
  g.yz = a0.yz * x12.xz + h.yz * x12.yw;
  return 130.0 * dot(m, g);
}

mat2 rotate(float degree) {
    return mat2(vec2(
    	cos(degree),
        -sin(degree)),
        vec2(sin(degree),
        cos(degree))
    );
}

void fragment() {
    // vec2 uv = (gl_FragCoord.xy * 2.0 - resolution.xy) / min(resolution.x, resolution.y);
    vec2 uv = (UV * 2.0 - resolution.xy) / min(resolution.x, resolution.y);
    // vec2 uv = UV;

    float speed = 0.5;
    // float t = time * speed;
    float t = TIME * speed;
    uv *= rotate(t * 0.3);
    
    float frequency = 5.0;
    uv *= frequency;
    float noiseIntensity = 0.09;
    float d = length(uv) - t + snoise(uv) * noiseIntensity;
    float f = fract(d);

    
    float n = f * step(0.6, snoise(uv * 1000.0 + t));
    n = pow(n, 3.0);
    
    vec3 bgColor = vec3(0.88, 0.98, 0.95);
    vec3 color1 = vec3(0.2, 0.2, 0.5);
    vec3 color2 = vec3(0.1, 0.1, 0.5);
    vec3 color = mix(bgColor, color1, f);
    color = mix(color, color2, n);
    // gl_FragColor = vec4(color, 1.0);
    COLOR = vec4(color, 1.0);
}