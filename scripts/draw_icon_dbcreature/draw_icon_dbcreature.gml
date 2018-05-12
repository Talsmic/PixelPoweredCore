///draw_icon_dbcreature(x,y,size,icon,colour,state);
/// @arg x
/// @arg y
/// @arg size
/// @arg creature
/// @arg state
/*
	[Edited 28/4/2018]
	Draws the icon for the required creature at the provided location
*/
/*
var X = argument0;
var Y = argument1;
var icon_size = argument2;
var icon_creature = argument3;
var icon_state = argument4;
	
//Pull from Database
if ( icon_creature ) {
	var icon = real(db_record_get("db_Creatures",icon_creature,"icon"));
	var icon_colour = find_colour(db_record_get("db_Creatures",icon_creature,"element"));
} else {
	var icon = 0;
	var icon_colour = c_lightgray;	
	};

//Draw Icon
draw_icon_creature(X,Y,icon_size,icon,icon_colour,icon_state);