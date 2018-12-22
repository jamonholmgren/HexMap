var detect_obj = argument0;
var draw_obj = argument1;
var splines = argument2; // number of different "islands"
var splinesize = argument3 * room_width; // size of splines in relation to room_width
var splineconnection = argument4 * room_width; // how closely splines are clumped together
var splinepadding = argument5; // how far to stay away from the edges of the map
var splinenoise = argument6; // noise in spline -- 1 = no noise, 0.5 = half noise
var splinemin = argument7 * room_width; // minimum size of spline to draw it

var lastsplx = random_range(0, room_width);
var lastsply = random_range(0, room_height);

for (spl = 0; spl < splines; spl++) {
	splx1 = min(room_width - splinepadding, max(splinepadding, lastsplx + random_range(-1 * splineconnection, splineconnection)));
	sply1 = min(room_height - splinepadding, max(splinepadding, lastsply + random_range(-1 * splineconnection, splineconnection)));
	
	// range size
	splx2 = random_range(splx1 - splinesize, splx1 + splinesize);
	sply2 = random_range(sply1 - splinesize, sply1 + splinesize);
	
	// check minimums
	if (point_distance(splx1, sply1, splx2, sply2) > splinemin) {
		// draw a collision shape, see what it intersects
		var col_list = ds_list_create();
		collision_ellipse_list(splx1, sply1, splx2, sply2, detect_obj, true, true, col_list, false);
	
		// Replace all water with ground here
		var col_list_size = ds_list_size(col_list);
		for (i = 0; i < col_list_size; i++) {
			if (splinenoise > random(1)) {
				var ob = ds_list_find_value(col_list, i);
				instance_create_layer(ob.x, ob.y, ob.layer, draw_obj);
				instance_destroy(ob);
			}
		}
	}
	
	// set beginning of next spline to end of this spline
	lastsplx = splx2;
	lastsply = sply2;
}
