///_class_Controller();

//Make sure this is the only controller of it's type, or destroy it before it can do anything
_singletonEnforce_Instance();

//Default flags for a Controller
visible	=				false;
persistent =			true;
solid =					false;

//Focus defaults for a Controller [see: doc_FocusAndFreeze]
FocusLevel =			10;
FocusIndependant =		true;
FocusSetter =			false;
GUIObject =				true;
GUILevel =				10;