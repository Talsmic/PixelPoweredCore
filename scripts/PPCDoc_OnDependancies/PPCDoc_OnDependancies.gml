///PPCDoc_OnDependancies();
/*

=[ A Note on Dependancies ]=====================================================
	
	Dependancies (reliances on external factors) are always tricky, but I've 
	tried to make this pretty simple, by organising everything neatly and 
	breaking this down in to layers:
	
		1.	Nothing related to the PPC relies on adding external libaries, or 
			functions not included in this package, to GameMaker Studio
			
		2.	No scripts stored in the [Common Functions] folder rely on 
			anything not also in the [Common Functions] folder. You can safely 
			look at that folder as an independant library of functions that can
			be added to any project.
			
		3.	A list of any interdependant functions/scripts, sprites, objects or 
			otherwise can be found:
				a)	At the bottom of any [Script]
				b)	At the bottom of the [Creation Event] of any [Object]		

=[ If / When Stuff Breaks ]=====================================================

	Despite best intentions, stuff goes wrong, and if you're not editting the 
	scripts (and still often if you are), 9/10 times that means it's either a 
	dependancy issue, an input issue or an output issue. 
				  (read more on Inputs and Outputs: PPCDoc_OnInputsAndOutputs())
	
		-	Check that you have everything listed in the dependancy section of 
			the script or object giving you issues. If the issue is an object,
			also check if it has a parent, and the dependancies for that parent.
			Grab anything you're missing out of the package.
			
		-	Check that you haven't accidentally broken any of the dependant
			scripts.
			We've all accidentally deleted a line of code without meaning to 
			before. If you suspect any script or object isn't how it came out 
			of the box, delete it and re-add it from the package.
			
		-	If you've checked your dependancies, inputs and outputs and you're 
			still getting issues, ask for help by posting on the Marketplace 
			page or emailing me at talsmic@gmail.com (feel free to do both).
			
		-	If it was all working well but then you updated either the PPC 
			package	or GameMaker and that started the issues, try reverting to
			an older version of the package or the GameMaker runtime.
			If this fixes it, I must stress, still contact me to tell me! It 
			means is I broke something or GameMaker changed something that 
			broke my code. I'll fix it, but I have to know.			

================================================================================