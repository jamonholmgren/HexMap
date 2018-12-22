var cx = argument0 + 16;
var cy = argument1 + 16;
var dir = argument2;

// 7, 4 -- 24, 27

switch(dir) {
	case "left":
		tx = cx - 16;
		ty = cy;
		break;
	case "right":
		tx = cx + 16;
		ty = cy;
		break;
	case "upleft":
		tx = cx - 9;
		ty = cy - 12;
		break;
	case "upright":
		tx = cx + 9;
		ty = cy - 12;
		break;
	case "downleft":
		tx = cx - 9;
		ty = cy + 12;
		break;
	case "downright":
		tx = cx + 9;
		ty = cy + 12;
		break;
	default:
		tx = 0;
		ty = 0;
}

draw_line_color(cx, cy, tx, ty, c_gray, c_gray);
draw_line_color(cx + 1, cy + 1, tx + 1, ty + 1, c_black, c_black);
draw_line_color(cx - 1, cy - 1, tx - 1, ty - 1, c_gray, c_gray);
draw_line_color(cx - 1, cy + 1, tx - 1, ty + 1, c_black, c_black);
draw_line_color(cx + 1, cy - 1, tx + 1, ty - 1, c_gray, c_gray);