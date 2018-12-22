var cities = argument0;

for (var cn = 0; cn < cities; cn++) {
	// try up to 100 times to place each city
	for (i = 0; i < 100; i++) {
		var cx = random_range(0, room_width);
		var cy = random_range(0, room_height);
		var tile = collision_point(cx, cy, obj_ground, true, true);
		if (tile) {
			var city = instance_create_layer(tile.x, tile.y, tile.layer, obj_city);
			city.road = true;
			instance_destroy(tile);
			break;
		}
	}
}

// Now make a road between cities that can see each other
for (var i = 0; i < instance_number(obj_city); i++) {
	var city = instance_find(obj_city, i);
	for (var o = i + 1; o < instance_number(obj_city); o++) {
		if (i == o) continue;
		show_debug_message("Trying to find road between city " + string(i) + " and " + string(o));
		var othercity = instance_find(obj_city, o);
		var succeed = generate_road(city, othercity);
		if (succeed) {
			show_debug_message("Found it!");
		} else {
			show_debug_message("No dice.");	
		}
	}
}

