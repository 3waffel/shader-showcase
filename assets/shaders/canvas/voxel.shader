// precision highp float;
shader_type canvas_item;

uniform vec2 resolution;
//uniform float time;
uniform vec2 mouse;
uniform sampler2D backbuffer;

// #define PI 3.141592653589793
const float PI = 3.141592653589793;

struct Camera {
	vec3 pos;
    vec3 dir;
    vec3 top;
    vec3 side;
    float depth;
};

struct Ray {
    vec3 origin;
	vec3 dir;
};

float random(vec2 p) {
	return fract(sin(dot(p, vec2(1.0, 1.1))));
}

mat2 rotate(float d) {
    float s = sin(d);
    float c = cos(d);
	return mat2(vec2(c, s), vec2(-s, c));
}

Camera createCamera(vec3 pos, vec3 dir, float depth) {
	Camera cam;
    cam.pos = pos;
    cam.dir = normalize(dir - pos);
	vec3 up = vec3(0.0, 1.0, 0.0);
    cam.side = normalize(cross(cam.dir, up));
    cam.top = normalize(cross(cam.side, cam.dir));
    cam.depth = depth;
    return cam;
}

Ray createRay(Camera cam, vec2 uv) {
	Ray ray;
    ray.origin = cam.pos;
    ray.dir = cam.side * uv.x + cam.top * uv.y + cam.dir * cam.depth;
    return ray;
}

struct obj{
	float d;
    vec3 c_shadow;
    vec3 c_light;
};

vec2 round(vec2 p) {
	return floor(p + 0.5);
}

vec2 repetition(vec2 p, float c) {
	return p - c * round(p / c);
}

obj subtractObj(obj a, obj b) {
	if (a.d > b.d) return a;
    else return b;
}

obj addObj(obj a, obj b) {
	if (a.d < b.d) return a;
    else return b;
}

float sdSphere(vec3 p, float r) {
	return length(p) - r;
}

float sdBox(vec3 p, vec3 c) {
	vec3 q = abs(p) - c;
    return length(max(q, 0.0)) + min(max(q.x, max(q.y, q.z)), 0.0);
}

obj dist(vec3 p) {
    float time = TIME;
    
    vec3 shadow = vec3(0.8, 0.1, 0.3);
    vec3 lighting = vec3(0.0, 0.2, 0.9);
    
    vec3 p1 = p;
    p1.x += cos(time * 0.6) * 12.0;
    p1.z += sin(time + 500.0) * 18.0;
    float size = 10.0 + 5.0 * sin(mod(time * 50.0, 180.0) * 3.14 / 180.0);
    obj d1 = obj(-sdSphere(p1, size), shadow, lighting);
    
    for (int i = 0; i < 6; i++) {
        float o = -1.0;
        if (mod(float(i), 2.0) == 0.0) {
        	o = 1.0;
        }
    	p1.x += cos(time + float(i) * 50.0) * 10.0 + float(i) * 15.0 * o;
        p1.y += sin(time + float(i) * 1200.0) * float(i) * 9.0 * o;
        p1.z += sin(time + float(i) * 3900.0) * 14.0 + float(i) * 12.0 * o;
        size = 15.0 * sin(mod(time * 10.0 + float(i) * 800.0, 180.0) * PI / 180.0);
        d1 = subtractObj(d1, obj(-sdSphere(p1, size), shadow, lighting));
    }
    
    vec3 p0 = p;
    obj d0 = obj(sdBox(p0 + vec3(0.0, 2.0, 0.0), vec3(14.0, 12.0, 14.0)), vec3(0.25, 0.0, 0.8), vec3(0.1, 0.6, 0.9));

    return subtractObj(d1, d0);
}

vec3 getRayPos(Ray ray, float rayLen) {
	return ray.origin + ray.dir * rayLen;
}

vec3 getNormal(vec3 p) {
    vec2 eps = vec2(0.001, 0.0);
	return normalize(vec3(
    	dist(p + eps.xyy).d - dist(p - eps.xyy).d,
    	dist(p + eps.yxy).d - dist(p - eps.yxy).d,
    	dist(p + eps.yyx).d - dist(p - eps.yyx).d
    ));
}

vec3 vexelTrace(Ray ray, Camera cam) {
    vec3 voxel = floor(ray.origin);
    vec3 rayStep = sign(ray.dir);
    // vec3 tDelta = 1.0 / abs(ray.dir);
    vec3 tDelta = length(ray.dir) / abs(ray.dir);
    // vec3 tMax = (voxel - ray.origin) / ray.dir;
    vec3 tMax = (sign(ray.dir) * (voxel - ray.origin) + (sign(ray.dir) * 0.5) + 0.5) * tDelta;
    vec3 hitVoxel = voxel;
    vec3 hitNormal;
    bool hit = false;
    bvec3 mask;
    obj o;
    
    for (int i = 0; i < 128; i++) {
    	o = dist(voxel);
        if (o.d <= 0.0 && !hit) {
            hit = true;
            hitVoxel = voxel;
        	break;
        }
        
        mask = lessThanEqual(tMax.xyz, min(tMax.yzx, tMax.zxy));
        tMax += vec3(mask) * tDelta;
        voxel += vec3(vec3(mask)) * rayStep;
    }
    
    if (hit) {
        vec3 color;
        if (mask.x) {
            color = vec3(0.5);
        }
        if (mask.y) {
            color = vec3(0.0);
        }
        if (mask.z) {
            color = vec3(1.0);
        }
        return mix(o.c_light, o.c_shadow, color);
    } else {
    	return vec3(0.9, 0.3, 0.75);
    }
}

// void main(void) {
void fragment() {
    // vec2 uv = (gl_FragCoord.xy * 2.0 - resolution.xy) / min(resolution.x, resolution.y);
    vec2 uv = (UV * 2.0 - resolution.xy) / min(resolution.x, resolution.y);

    vec3 target = vec3(0.0, 0.0, 0.0);
    // float t = time * 0.3;
    float t = TIME * 0.3;
    float cameraRadius = 25.0;
    vec3 camPos = vec3(cos(t) * cameraRadius, cameraRadius * 0.8, sin(t) * cameraRadius);
    Camera cam = createCamera(camPos, target - camPos, 1.0);
    Ray ray = createRay(cam, uv);
    
    vec3 color = vexelTrace(ray, cam);

    // gl_FragColor = vec4(color, 1.0);
    COLOR = vec4(color, 1.0);
}