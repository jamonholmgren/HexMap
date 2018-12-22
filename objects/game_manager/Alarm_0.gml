/// @description Create cities

// Try up to 100 times to place each city
for (var i = 0; i < 100; i++) {
	var cx = random_range(0, room_width);
	var cy = random_range(0, room_height);
	var tile = collision_point(cx, cy, obj_ground, true, true);
	if (tile != noone) {
		var city = instance_create_layer(tile.x, tile.y, "HexMap", obj_city);
		city.road = true;
		instance_destroy(tile);
		break;
	}
}

current_city_index++;
if (current_city_index <= 4) {
	alarm_set(0, pathfinding_rate); // place another city
} else {
	current_city_index = 0;
	current_target_city_index = 0;
	alarm_set(1, pathfinding_rate); // start pathfinding
}
