var i = collision_point(mouse_x, mouse_y, obj_tile, true, false);

if (i) {
	draw_sprite(spr_hex_highlight, 0, i.x, i.y);
}
