var ob = argument0;
var ntype = argument1;

var neighbors = ds_list_create();

collision_circle_list(ob.x + 16, ob.y + 8, 24, ntype, true, true, neighbors, false);

return neighbors;