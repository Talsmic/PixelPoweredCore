///ui_databox_create(#);
/// @arg #
var ref = argument0;

//A Databox is a Window Structure that displays information following a provided format
//Because you may want multiple databoxes in a single object and they are mostly static,
//use reference numbers to differentiate them.

//Databox types:
// "DB_Skill"		Displays the database info of a skill

//Requires the following variables to be pre-established:
Databox_Type[ref] = "DB_Skills"
Databox_Pointer[ref] = 1;

Databox_X[ref] = x;
Databox_Y[ref] = y;