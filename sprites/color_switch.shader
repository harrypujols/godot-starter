shader_type canvas_item;

void fragment() {
	vec4 curr_color = texture(TEXTURE, UV); // get current color of pixel
	
	if (curr_color == vec4(0, 0, 0, 1)) {
		COLOR = vec4(0.06, 0.22, 0.06, 1); // darker green
	} else {
		COLOR = curr_color;
	}
}

// openglcolor.mpeters.me