for (ty = 0; ty <= room_height; ty += 24) {
	for (tx = 0; tx <= room_width; tx += 32) {
		var staggered = ((ty mod 48) / 24) * 16;
		var tile = collision_point(tx - staggered + 16, ty + 8, obj_ground, true, true);
		if (tile) {
			var hitwater = collision_circle(tx - staggered + 16, ty + 8, 20, obj_water, true, true);
			if (hitwater) {
				instance_create_layer(tile.x, tile.y, tile.layer, obj_beach);
				instance_destroy(tile);
			}
		}
	}
}
