BEGIN d_GGPS01 //Glittergear's Party Servant



//dialogue to get spider body
IF ~Global("GGPSpider","GLOBAL",0)~ THEN BEGIN 0
	SAY @600 /* Yes? Can I help you? */
		++ @601 /* Yes, I was wondering if I could have the candle for Horatio's birthday party. */ GOTO 1
		++ @602 /* Oh, no, I don’t need anything. */ GOTO 2
END

IF ~~ THEN BEGIN 1
	SAY @603 /* You want a chicken’s birthday candle? Why? Actually, nevermind. I don’t want to know. I don’t think I’m supposed to give it to you, but if you make it worth my while… */
		++ @604 /* How much gold are we talking? */ GOTO 3
		++ @605 /* What do you want me to do? */ GOTO 4
END

IF ~~ THEN BEGIN 2
	SAY @606 /* Hmph. Fine. Well, if you don't mind, I'm quite busy preparing for the party. */
		IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 3
	SAY @607 /* I’m not talking about gold. */
		++ @605 /* What do you want me to do? */ GOTO 4
		++ @608 /* Oh, no. Nevermind. */ GOTO 2
END

IF ~~ THEN BEGIN 4
	SAY @609 /* Well… between you and me, I’ve about had it with this job. I want you to find me a special ingredient for Horatio’s birthday cake. Horatio will love it. Everyone else, not so much. */
		++ @610 /* Go on. */ GOTO 5
		++ @611 /* Solve your own problems. */ GOTO 2
END

IF ~~ THEN BEGIN 5
	SAY @612 /* I want you to find a tasty-looking spider. A big one. Kill it and bring it back here. I’ll put it in the center of the cake. The nobles will have already eaten part of the cake by the time they realise that there’s a dead spider in it! But chickens love eating spiders, so Horatio will be happy about it, at least. */
		++ @613 /* Where can I find a tasty-looking spider? */ GOTO 6
		++ @614 /* I'll be back with the tastiest spider Horatio has ever eaten. */ GOTO 7
		++ @615 /* I'm not doing that. */ GOTO 2
END

IF ~~ THEN BEGIN 6
	SAY @616 /* I'd start by looking... wherever spiders live around here. Someplace underground, maybe? Find a nest somewhere, pick out the tastiest looking spider, kill it, and bring it to me. Seems straightforward enough, no? */
		++ @614 /* I'll be back with the tastiest spider Horatio has ever eaten. */ GOTO 7
		++ @615 /* I'm not doing that. */ GOTO 2
END

IF ~~ THEN BEGIN 7
	SAY @617 /* Excellent! ...Or should I say 'eggcellent'? Sorry. Anyway, I'll be here, awaiting your return! */
	IF ~~ THEN DO ~AddJournalEntry(@5101, QUEST) SetGlobal("GGPSpider","GLOBAL",1)~ EXIT
END





// dialogue for awaiting spider body
IF ~Global("GGPSpider","GLOBAL",1)~ THEN BEGIN 10
	SAY @618 /* Do you have the spider? */
		+ ~PartyHasItem("MISC60")~ + @619 /* Yes, it is right here. */ GOTO 11
		++ @620 /* No, not yet. */ GOTO 12
END

IF ~~ THEN BEGIN 11
	SAY @621 /* Perfect! This is great. I'll just take this, and you can take this candle. I don't think the Lord and Lady of the house will be too upset to have it gone. I don't know how they expected a chicken to be able to blow out a candle... */
IF ~~ THEN DO ~AddJournalEntry(@5102, QUEST)
				SetGlobal("GGPSpider","GLOBAL",2)
				TakePartyItem("MISC60")
				GiveItemCreate("GGPWC",Player1,1,1,0)
				AddexperienceParty(6000)~ EXIT
END

IF ~~ THEN BEGIN 12
	SAY @622 /* Then why are you here? Get going! */
	IF ~~ THEN EXIT
END



//dialogue for after spider body
IF ~Global("GGPSpider","GLOBAL",2)~ THEN BEGIN 100
	SAY @623 /* Between you and me, you might not want to stay here much longer. I doubt that this cake is going to smell very good. And even if it somehow does, you don't want to be here when people start eating it! */
		IF ~~ THEN EXIT
END
