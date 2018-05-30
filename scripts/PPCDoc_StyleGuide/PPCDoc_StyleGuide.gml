///PPCDoc_StyleGuide();
/*

=[Preface to this Style Guide]==================================================

	The PPC uses what most would consider odd style choices.
	I'm well aware that the following rules are not common in most circles, and 
	there is always	lots of debate when adopting non-standard styles.
	
	I've made these choices soley on what is easiest for me to read and follow
	at a glance. It makes no difference to how functional the code is, but of 
	course it may not be the easiest for you to follow, or it might just rub you
	the wrong way because it's different.
	
	If you're using this code and you want it in a different style, just go run
	it through a code formatter for your favourite style. Any argument of style 
	preferences is almost always a colossal waste of everyone's time.
		
		~Tals
									   (https://github.com/dotnet/codeformatter)
=[Naming Conventions]===========================================================
	Naming conventions in my stuff is a little chaotic, as I find it easiest 
	when identifying information at a glance in a format like this.
	If it's not to your liking, as it may well not be, find and replace is your 
	friend. (Ctrl+Shift+F)

	- Category suffixes and prefixes are great ways to sort information
	- Try to use sensible underscoring that seperates categories where possible
		( draw_button_text_ext is more useful than draw_text_button_ext)
	- Order names in ways that make sense, based on the order you need to gather 
	  the information as you read it.
-[Variables]--------------------------------------------------------------------
	var objvariable			all lower case
	InstanceVariable			Start with a capital, new captial ForEachWord
	global.GlobalVariable		As with InstanceVariables	
	MACROS						ALL CAPITALS
-[Sprites]----------------------------------------------------------------------
	spr_sprite
	bg_background
-[Functions / Scripts]----------------------------------------------------------
	typeoffuntion_category_functionality(arguments);
	 (eg drawTextOutlined)							draw[Type of Function]
													_text[Category]
													_outline[Functionality]
	question(arguments);
		Use question format for common queries like inFocus()
-[Fonts]------------------------------------------------------------------------
	ft_FontName_6_Style
-[Objects]----------------------------------------------------------------------
	oObject						Standard objects

-[Rooms]------------------------------------------------------------------------
	rm_RoomName
-[...]--------------------------------------------------------------------------
	c_colour			[Macro] for a colour code integer
						(See macros_colourcodes(); for a full explaination)		
	bgBackground		[Object] backgrounds with the bg object as a parent
	uiUserInterface		[Object] User Interfaces 	
						(as a general rule these should draw to the GUI layer)
						
=[Tabbing and Spacing]==========================================================
	- Tabs (Definately no four spaces)
	- Avoid more than one empty line
	- White space is fine, and often aids visibility
	- Tabbing variables to align their values for ease of reading is encouraged
	- Extraneous tabbing to align any two things you want to be easily 
	  comparable is not frowned upon. In general, alignment needs are flexible
	  to why you want them aligned.
	- 20 tabs wide where possible.

=[{Braces}]=====================================================================
Banner style braces:

if ( condition ) {
    // code here
	};
	
=[Other]========================================================================
	- [WIP] comments should preface or enclose any code or missing code
	  that needs further review. Remove these flags when they no longer require 
	  review or revision or when the functionality exists.
	- [DEBUG] comments should preface or enclose any code that shoulds be 
	  deleted at some point
	- Avoid using globals if a controller is a better solution
	- Full stops are only used for sentences
	- GMS does not require lines end with;
	  It's still good practice, so still do it

	Some stuff isn't really that important but is technically style guide 
	related stuff so it's contained in other places:
		PPCDoc_StyleGuide_Dividers();
		
=[Useful sites]=================================================================
	https://convertcase.net/
		For when you need to alter case (ALLCAPS, Upper Case, Lower Case etc)