shader_type canvas_item;

uniform bool is_inverted;
uniform sampler2D palette;

void fragment(){
	vec4 screen = texture(SCREEN_TEXTURE, SCREEN_UV);
	vec4 colors[4];
	
	if (is_inverted){
		colors[0] = texture(palette, vec2(0.2, 0.5));
		colors[1] = texture(palette, vec2(0.4, 0.5));
		colors[2] = texture(palette, vec2(0.6, 0.5));
		colors[3] = texture(palette, vec2(0.8, 0.5));
	}
	else if (!is_inverted){
		colors[0] = texture(palette, vec2(0.8, 0.5));
		colors[1] = texture(palette, vec2(0.6, 0.5));
		colors[2] = texture(palette, vec2(0.4, 0.5));
		colors[3] = texture(palette, vec2(0.2, 0.5));
	}
	
	COLOR.rgb = colors[int(floor(screen.r * 4f))].rgb;
	COLOR.a = screen.a;
}