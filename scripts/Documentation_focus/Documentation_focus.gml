///Documentation_focus
/*
	Everything in respect to focus or freeze requires that the _focusController is active
	Focus defines the level of the game the player is interacting on. A player can interact above their focus level, but cannot interact below it.
	Freeze allows you to pause everything below a certain focus level. Great for pausing groups of objects.
*/

//These global variables track focus
global.FocusLevel =		0;
global.FreezeLevel =	0;

//If an instance does not have the FocusLevel variable set, it will assume it is -1 and it can be interacted with at any level.
FocusLevel =			0;		// {integer|-1+}		If the global.FocusLevel is greater than this, the object cannot be interacted with.
								//						If the global.FreezeLevel is greater than this, the object will not function.

//If these variables don't exist in an instance, the focus sysem will assume they follow these defaults
FocusIndependant =		false;	// {boolean}			If this is flagged true, the instance ignores focus and will always be __inFocus() = true;
FreezeIndependant =		true;	// {boolean}			If this is flagged true, the instance ignores freeze and will always function;
FocusSetter =			true;	// {boolean}			If this is flagged true, as long as this instance exists the global.FocusLevel cannot drop below it's FocusLevel  								
GUIObject =				false;	// {boolean}									
BackgroundObject =		false;	// {boolean}			
GUILevel =				0;		// {integer|0..10}
DepthOffset =			0;		// {integer|0..10}