// Remove all tiles
instance_destroy(obj_tile);

// island, mountain, forest (spline #, spline spacing)
generate_map(70, 0.3, 30, 0.15, 20, 0.3);

// Kill all alarms running


alarm_set(0, pathfinding_rate); // kick off cities
