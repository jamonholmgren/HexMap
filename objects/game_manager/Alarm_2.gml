/// @description Insert description here
// You can write your code in this editor

startcity = instance_find(obj_city, current_city_index);
othercity = instance_find(obj_city, current_target_city_index);
if (currentnode == noone) currentnode = startcity;

// currentnode.tempcost = -1;
// currentnode.tempprev = noone;

// try up to 10,000 times to find a path
// for (var l = 0; l < 10000; l++) {

// add neighbors and explore them
var neighbors = get_neighbors(currentnode, obj_tile);
var neighbor_size = ds_list_size(neighbors);
for (var i = 0; i < neighbor_size; i++) {
	var n = ds_list_find_value(neighbors, i);
		
	// it's already been explored
	if (n.tempprev != noone) continue;
			
	//show_debug_message("Neighbor " + string(n.id) + " xy: " + string(n.x) + "x" + string(n.y) + " " + string(n.tempcost));
		
	if (n.object_index == obj_mountain) continue;
	if (n.object_index == obj_water) continue;
	if (n.object_index == obj_tile) continue;
	if (n == currentnode) continue;
	if (n == othercity) {
		// found it, now trace back!
		var trace = currentnode;
			
		for (var t = 0; t < 100; t++) {
			if (trace.tempprev == noone) break;;
			trace.road = true;
			trace = trace.tempprev;
		}
			
		// and reset all previous tempcosts and tempprevs
		for (var o = i + 1; o < instance_number(obj_tile); o++) {
			var z = instance_find(obj_tile, o);
			z.tempcost = -1;
			z.tempprev = noone;
			z.image_alpha = 1;
		}
			
		// and stop searching
		ds_list_clear(opennodes);
		break;
	}

	var cost = 100;
	if (n.object_index == obj_ground) cost = 3;
	if (n.object_index == obj_beach) cost = 6;
	if (n.object_index == obj_trees) cost = 8;
	if (n.road) cost = 1;
	
	// bias toward target
	var dist_prev = point_distance(currentnode.x, currentnode.y, othercity.x, othercity.y);
	var dist_next = point_distance(n.x, n.y, othercity.x, othercity.y);
	var dist_bias = (dist_next - dist_prev) / 24;
	cost += dist_bias;

	n.tempcost = currentnode.tempcost + cost;
	n.tempprev = currentnode;
	
	n.image_alpha = 0.5;

	ds_list_add(opennodes, n);
}

currentnode.image_alpha = 1;
var cnindex = ds_list_find_index(opennodes, currentnode);
ds_list_delete(opennodes, cnindex); // done exploring this one
if (ds_list_empty(opennodes)) {
	// Ran out of open nodes, we're done with this one.
	alarm_set(1, pathfinding_rate);
} else {
	// find next lowest cost to explore
	var opennodes_size = ds_list_size(opennodes);
	var lowestnode = noone;
	for (var i = 0; i < opennodes_size; i++) {
		var node = ds_list_find_value(opennodes, i);
		if (lowestnode == noone || lowestnode.tempcost > node.tempcost) lowestnode = node;
	}
	
	currentnode = lowestnode;
	alarm_set(2, pathfinding_rate);
}
