#version 450

//Output
layout (location = 0) out vec3 outColor;

//Inputs
layout (location = 0 ) in vec3 vPosition;
layout (location = 1 ) in vec3 vNormal;
layout (location = 2 ) in vec3 vColor;
layout (location = 3 ) in vec2 uv;

layout(set = 0, binding = 0) uniform  ObjectData1
{
	float translateSine;

} objectData1;

layout(set = 0, binding = 2 ) uniform ObjectData2
{
	float translateCosine;
} objectData2;

void main()
{
	//output the position of each vertex
	gl_Position = vec4(vPosition + vec3(objectData1.translateSine, 0.0f, 0.0f) + vec3(0.0f, objectData2.translateCosine, 0.0f), 1.0f);
	outColor = vColor;
}