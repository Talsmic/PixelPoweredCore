/// @description HoldKey / Focus / ScrollBeat
event_inherited();

//Manage Beats
ScrollBeat = beat_step(ScrollBeat);

//Hold Key Events
ui_listbox_hold();