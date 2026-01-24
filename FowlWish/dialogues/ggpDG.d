BEGIN d_GGPDG //Glittergear's Party Door Guard

IF ~Global("GGPMQ","GLOBAL",0)~ THEN BEGIN 99
	SAY ~Hey! We aren't ready for party-goers yet.~
	IF ~~ THEN DO ~ActionOverride(Player1,LeaveAreaLUA("AR1000","",[1210.1404],4))
					ActionOverride(Player2,LeaveAreaLUA("AR1000","",[1220.1404],4))
					ActionOverride(Player3,LeaveAreaLUA("AR1000","",[1210.1414],4))
					ActionOverride(Player4,LeaveAreaLUA("AR1000","",[1170.1400],4))
					ActionOverride(Player5,LeaveAreaLUA("AR1000","",[1170.1410],4))
					ActionOverride(Player6,LeaveAreaLUA("AR1000","",[1210.1400],4))~ EXIT
END


IF ~Global("GGDoorOpen","GLOBAL",0)~ THEN BEGIN 0
	SAY ~Halt! Who goes there? By what right do you try to enter this building?~ 
		++ ~You’re awfully serious for a doorman to a birthday party.~ GOTO 1
		+ ~ReputationGT(Player1,15)~ + ~I am <CHARNAME>. Perhaps you've heard of me?~ GOTO 2A
		+ ~ReputationLT(Player1,8)~ + ~I am <CHARNAME>. Perhaps you've heard of me?~ GOTO 2B
		+ ~PartyGoldGT(1999)~ + ~By the right of gold, if you get my meaning. Say.... 2,000?~ GOTO 3
		+ ~PartyHasItem("GGPMB")~ + ~I’m afraid I lost my invitation, but I do have this gift.~ GOTO 4
		+ ~OR(6)
				Class(Player1,BARD_ALL)
				Class(Player2,BARD_ALL)
				Class(Player3,BARD_ALL)
				Class(Player4,BARD_ALL)
				Class(Player5,BARD_ALL)
				Class(Player6,BARD_ALL)~ + ~We have a bard. We're the hired entertainment.~ GOTO 5
		++ ~I'll go find my invitation.~ GOTO 6
END

IF ~~ THEN BEGIN 1
	SAY ~I’m not being paid to be silly. I’m being paid to be serious and make sure that no one who wasn’t invited crashes the party. Now, what business do you have here?~
		+ ~ReputationGT(Player1,15)~ + ~I am <CHARNAME>. Perhaps you've heard of me?~ GOTO 2A
		+ ~ReputationLT(Player1,8)~ + ~I am <CHARNAME>. Perhaps you've heard of me?~ GOTO 2B
		+ ~PartyGoldGT(1999)~ + ~By the right of gold, if you get my meaning. Say.... 2,000?~ GOTO 3
		+ ~PartyHasItem("GGPMB")~ + ~I’m afraid I lost my invitation, but I do have this gift.~ GOTO 4
		+ ~OR(6)
				Class(Player1,BARD_ALL)
				Class(Player2,BARD_ALL)
				Class(Player3,BARD_ALL)
				Class(Player4,BARD_ALL)
				Class(Player5,BARD_ALL)
				Class(Player6,BARD_ALL)~ + ~We have a bard. We're the hired entertainment.~ GOTO 5
		++ ~I'll go find my invitation.~ GOTO 6
END

IF ~~ THEN BEGIN 2A
	SAY ~Oh, yes, I have heard of you! It makes sense that someone like you would be invited to the party. My apologies, but I was just trying to do my job. Here, right this way. Oh, look at the time! It's time for me to go on break. Enjoy the party!~
	IF ~~ THEN DO ~SetGlobal("GGDoorOpen","GLOBAL",1) AddexperienceParty(6000) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 2B
	SAY ~Oh, yes, I have heard of you! I... erm... wouldn't want to get in your way. Oh, look at the time! It's time for me to go on break. Enjoy the party!~
	IF ~~ THEN DO ~SetGlobal("GGDoorOpen","GLOBAL",1) AddexperienceParty(6000) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 3
	SAY ~I’m not supposed to let just anyone in but… Oh, look at the time! It's time for my break.~
	IF ~~ THEN DO ~SetGlobal("GGDoorOpen","GLOBAL",1) AddexperienceParty(6000) TakePartyGold(2000) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 4
	SAY ~Yes, I see. If you have a gift, you must have been invited! Why else would you have a gift for a pet chicken? I’m sorry you lost your invitation; I hear they were very well-designed. And oh, look! It's time for my break.~
	IF ~~ THEN DO ~SetGlobal("GGDoorOpen","GLOBAL",1) AddexperienceParty(6000) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 5
	SAY ~Yes, we've been expecting you. Come on in. And oh, look! It's time for my break.~
	IF ~~ THEN DO ~SetGlobal("GGDoorOpen","GLOBAL",1) AddexperienceParty(6000) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 6
	SAY ~If you can't find the invitation, go ahead and buy a gift for the birthday chicken. Why else would you do such a thing unless you were invited?~
	IF ~~ THEN DO ~ActionOverride(Player1,LeaveAreaLUA("AR1000","",[1085.1530],4))
					ActionOverride(Player2,LeaveAreaLUA("AR1000","",[1095.1530],4))
					ActionOverride(Player3,LeaveAreaLUA("AR1000","",[1085.1540],4))
					ActionOverride(Player4,LeaveAreaLUA("AR1000","",[1095.1540],4))
					ActionOverride(Player5,LeaveAreaLUA("AR1000","",[1075.1530],4))
					ActionOverride(Player6,LeaveAreaLUA("AR1000","",[1085.1535],4))~ EXIT
END
