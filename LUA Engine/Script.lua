--[[
The following functions have been exposed to lua:
setBackground(string aPath) sets the background to the texture in the folder textures.
createButton(string area name which the player enters, string context); adds a button to the current screen
createTextfield(string context); adds a textfield to the top of the screen.
CLS(); clears the screen.
exitGame(); exits the game.
playSound(string path to sound)


]]--

MainDisco = false;
entered = false;
hasCrowbar = false;
hasKey = false;
stagedoor = false;

function story(aName)
	if(aName == "start") then
    playMusic("queen.wav")
		setBackground("DiscoEntrance1.JPG")
		createTextfield("You heard a loud scream from the disco. Investigate?")
		createButton("exit", "I should mind my own business.")
		createButton("entrance", "Enter")
	end
	if(aName == "entrance") then
		if(entered == false) then
			playSound("door.wav")
			entered = true;
		else
			playSound("footstep.wav")
		end
		CLS();
		setBackground("DiscoHall1.JPG");
    playSound("door.wav")
		createTextfield("You've entered the disco, no sign from the person that screamed.")
		createButton("leftHallway", "Go to the bathroom on your left");
		createButton("rightHallway", "Go to the hallway on your right")
		createButton("Stage", "Go up the stage")
	end
	if(aName == "leftHallway") then
		playSound("footstep.wav")
		CLS();
		setBackground("DiscoBathroom1.jpg")
		createTextfield("You walk in the bathroom and notice that there's nobody there.")
		createButton("entrance", "Go back to the disco.");
		if(hasCrowbar == false) then
			createButton("searchStalls", "Take a closer look at the stalls")
		end
	end
	if(aName == "searchStalls") then
		CLS();
		playSound("pageFlip.wav")
		createTextfield("You've found a crowbar, but you are not sure what to do with it.")
		createButton("entrance", "You go back to the disco")
		hasCrowbar = true;
	end
	if(aName == "rightHallway") then
		CLS();
		playSound("footstep.wav")
		setBackground("DiscoRoom1.jpg")
		if(hasKey == true) then
			createTextfield("The door was locked but with the crowbar I forced myself in.")
		else
			createTextfield("The door is locked.")
		end

		createButton("entrance", "Walk away because the door is locked.")
		if(hasCrowbar == true and hasKey == false) then
			createButton("useCrowbar", "Use the crowbar to get into the room.")
		end
	end

	if(aName == "useCrowbar") then
		CLS();
		playSound("doorkick.wav")
		createTextfield("You have found a key laying on a desk in the room.")
		hasKey = true;
		createButton("entrance", "Walk back to the disco to find a door for the key.")
	end

	if(aName == "Stage") then
	CLS();
	playSound("footstep.wav")
		if(hasCrowbar == true and hasKey == true) then
			setBackground("DiscoStageDoor1.jpg")
			createTextfield("You find a locked door that leads to the stage, it's locked")
			createButton("exit", "You try the key and it works.")
			stagedoor = true
	else
			setBackground("DiscoStageDoor1.jpg")
			createTextfield("You find a locked door that leads to the stage, it's locked")
			createButton("entrance", "Turns around and tries to find a key for the stage door.")
		end

	 if (stagedoor == true) then
	      CLS();
        playSound("door.wav")
				setBackground("DiscoQueen1.jpg")
	 			createTextfield("You open the door and find one of the best 80's bands.")
				createButton("exit", "Leave the disco with a smile.")
      end


end
	if(aName == "exit") then
		exitGame();
	end
end
