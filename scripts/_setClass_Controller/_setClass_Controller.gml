///_setClass_Controller();

//Parent Class: _FocusObject
_setClass_FocusObject();

#region Default Flags

visible	=				false;
persistent =			true;
solid =					false;

#endregion

#region Variable Definitions

focus_level =			10;
isGUIObject =			true;

#endregion

#region Event: Creation

//Make sure this is the only controller of it's type, or destroy it before it can do anything
_singletonEnforce_Instance();

#endregion