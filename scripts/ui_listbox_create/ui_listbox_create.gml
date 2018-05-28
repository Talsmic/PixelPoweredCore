///ui_listbox_create();

//A Listbox is a Window Structure that creates a scrollable box and populates it with 
//a list or grid of icons or words. Most variables for it are stored in the object

//Requires the following variables to be pre-established:
Listbox_Mode = "Words";		//OR "Icons"
Listbox_IconType = "Skill"; //OR ""Creature", "DB_Creature", "DB_Skill"
Listbox_ListIcon = array_create(10,1);
Listbox_ListWords = array_create(10,"default");
Listbox_ListColour = array_create(10,c_white);
Listbox_ShowID = false;

Listbox_X = 0;
Listbox_Y = 0;

Listbox_Position = 1;	
Listbox_Row_Starting = 1;
Listbox_Row_Length = 5;
Listbox_Column_Length = 5;
Listbox_List_Length = 1;	//Self Correcting
Listbox_WordWidth = 150;
	
Listbox_TabEnabled = false;
Listbox_TabArray = array_create(2,"ToggleIDs");
Listbox_TabArray[0] = 1;	//Pointer
Listbox_ShiftTabEnabled = false;
Listbox_ShiftTabArray = array_create(2,"ToggleIDs");
Listbox_ShiftTabArray[0] = 1;	//Pointer
Listbox_ScrollSize = 1;
Listbox_ScrollLoop = false;