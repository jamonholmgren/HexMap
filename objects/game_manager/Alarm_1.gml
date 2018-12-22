/// @description Pathfinding init from city
show_debug_message("Alarm 1")
ds_list_clear(opennodes);
currentnode = noone;
current_target_city_index++;
if (current_target_city_index >= instance_number(obj_city)) {
	current_city_index++;
	current_target_city_index = 0;
	if (current_city_index < instance_number(obj_city)) {
		alarm_set(1, pathfinding_rate); // pathfind another city
	} else if (current_city_index == current_target_city_index) {
		alarm_set(1, pathfinding_rate); // don't pathfind yourself
	} else {
		show_debug_message("Done pathfinding with " + string(current_city_index) + " and " + string(current_target_city_index));
		current_city_index = 0;
		// alarm_set(3, pathfinding_rate); // start pathfinding
		// we're done maybe?
	}
} else {
	// keep pathfinding

	show_debug_message("Ppathfinding with " + string(current_city_index) + " and " + string(current_target_city_index));
	alarm_set(2, pathfinding_rate);
}
