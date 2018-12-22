// Get arguments
var island_density = argument0;
var island_spacing = argument1;
var mountain_density = argument2;
var mountain_spacing = argument3;
var forest_density = argument4;
var forest_spacing = argument5;

// Set random seed
randomize();

// Set constants
var hex_width = room_width / 32;
var hex_height = room_height / 24;

// Draw the water everywhere to start
for (ty = 0; ty <= room_height; ty += 24) {
	for (tx = 0; tx <= room_width; tx += 32) {
		var staggered = ((ty mod 48) / 24) * 16;
		instance_create_layer(tx - staggered, ty - 8, "HexMap", obj_water);
	}
}

// Create islands
generate_splines(obj_water, obj_ground, island_density, island_spacing, 0.2, 150, 0.99, 0.1);

// Create mountains
generate_splines(obj_ground, obj_mountain, mountain_density, mountain_spacing, 0.7, 0, 0.9, 0.01);

// Create forests
generate_splines(obj_ground, obj_trees, forest_density, forest_spacing, 0.5, 50, 0.6, 0.01);

// Create beaches
generate_beaches();

// Create cities and roads
// generate_cities(4);
