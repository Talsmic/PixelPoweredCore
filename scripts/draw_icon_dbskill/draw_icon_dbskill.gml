///draw_icon_dbskill(x,y,size,skill,state);
/// @arg x
/// @arg y
/// @arg size
/// @arg skill
/// @arg state
/*
	[Edited 24/4/2018]
	Draws the icon for the required skill at the provided location
*/
var X = argument0;
var Y = argument1;
var icon_size = argument2;
var icon_skill = argument3;
var icon_state = argument4;
	
//Pull from Database
if ( icon_skill ) {
	var icon = db_record_get("db_Skills",icon_skill,"icon");
	var icon_colour = find_colour(db_record_get("db_Skills",icon_skill,"element"));
	var icon_rarity = db_record_get("db_Skills",icon_skill,"rarity");
} else {
	var icon = 0;
	var icon_colour = c_lightgray;	
	var icon_rarity = "C";
	};
	
//Draw Icon
draw_icon_skill(X,Y,icon_size,icon,icon_colour,icon_rarity,icon_state);
