shader_type canvas_item;

uniform sampler2D screen_texture: hint_screen_texture;
uniform sampler2D noise_texture: filter_nearest, repeat_enable;
uniform vec2 speed = vec2(0.5,0.2);
uniform float wave_strength = 0.09;
uniform float distortion = 0.01;
void vertex() {
	// Called for every vertex the material is visible on.
	VERTEX.y += sin(TIME);
}

void fragment() {
	
	vec2 noise = 2.0 * texture(noise_texture, UV).rg - vec2(1.15);
	// Called for every pixel the material is visible on.
	COLOR = texture(TEXTURE, UV + noise * wave_strength);
	COLOR *= texture(screen_texture, SCREEN_UV + noise * distortion);
}
//
////void light() {
	//// Called for every pixel for every light affecting the material.
	//// Uncomment to replace the default light processing function with this one.
////}
