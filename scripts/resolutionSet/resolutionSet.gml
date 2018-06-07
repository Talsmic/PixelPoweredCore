///resolutionSet(width,height,scale);
/// @arg width	{integer}		
/// @arg height	{integer}
/// @arg scale	{real}	
#region Arguments & Variables & Variables
//Arguments
var _width =	argument0;
var _height =	argument1;
var _scale =	argument2;
#endregion

res_Magnification		= _scale;

res_CompleteWidth		= _width;
res_CompleteHeight		= _height;
res_PlayableWidth		= _width;
res_PlayableHeight		= _height;

res_PadWidth			= 0;
res_PadHeight			= 0;
res_ViewWidth			= 0;
res_ViewHeight			= 0;
res_GUIxOffset			= 0;
res_GUIyOffset			= 0;
FloatingPixels_Width	= 0;
FloatingPixels_Height	= 0;

NextEvent_SnapResolution		= true; 
NextEvent_ResolutionCenter		= false;
NextEvent_SnapResolution_Scale	= _scale;