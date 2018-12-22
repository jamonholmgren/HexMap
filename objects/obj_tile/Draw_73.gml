// Draws roads based on neighbors

if (road) {
	var neighbors = get_neighbors(self, obj_tile);
	for (i = 0; i < ds_list_size(neighbors); i++) {
		var n = ds_list_find_value(neighbors, i);
		if (n.road) {
			if (n.x < x && n.y == y) draw_road(x, y, "left");
			if (x < n.x && n.y == y) draw_road(x, y, "right");
			if (n.x < x && n.y < y) draw_road(x, y, "upleft");
			if (n.x < x && y < n.y) draw_road(x, y, "downleft");
			if (x < n.x && n.y < y) draw_road(x, y, "upright");
			if (x < n.x && y < n.y) draw_road(x, y, "downright");
		}
	}
}
