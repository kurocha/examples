@shader

#version 150

@vertex

uniform mat4 display_matrix;
uniform mat4 model_matrix;

in vec3 position;
in vec3 normal;
in vec2 mapping;

out vec3 lighting_normal;
out vec4 surface_position;
out vec2 diffuse_mapping;

void main () {
	//lighting_normal = (model_matrix * vec4(normal, 0.0)).xyz;
	
	//diffuse_mapping = mapping;

	surface_position = model_matrix * vec4(position, 1.0);
	
	gl_Position = display_matrix * surface_position;
}

@fragment

uniform sampler2D diffuse_texture;

uniform vec4 light_position;
uniform vec4 light_color;

in vec3 lighting_normal;
in vec4 surface_position;
in vec2 diffuse_mapping;

out vec4 fragment_color;

vec4 basic_light(vec4 position, vec4 color) {
	vec4 direction = position - surface_position;
	float distance = length(direction);
	
	float intensity = max(dot(normalize(direction.xyz), normalize(lighting_normal)), 0.3);
	return intensity * (color / (distance * 0.1 + 1.0));
}

void main() {
	fragment_color = vec4(1.0, 1.0, 1.0, 1.0);
	
	//fragment_color = texture(diffuse_texture, diffuse_mapping) * basic_light(light_position, light_color);
	
	//fragment_color = vec4(lighting_normal, 1.0);
}
