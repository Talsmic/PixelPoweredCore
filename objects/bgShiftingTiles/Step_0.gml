/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (keyboard_check_released(ord("1"))) { ViewAlignX = _uploop(ViewAlignX, 2, -1, 1) }
if (keyboard_check_released(ord("2"))) { ViewAlignY = _uploop(ViewAlignY, 2, -1, 1) }