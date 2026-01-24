BEGIN d_GGPSC

//dialogue for questgiving spellcaster. this convo leads up to the PC's accepting the quest

IF ~Global("GGPMQ","GLOBAL",0)~ THEN BEGIN 0
	SAY @500 /* Oh! Are an adventurer! Er, are you for hire, I mean? I have a bit of a situation here… A situation of a rather delicate nature. */
		++ @501 /* Go on. */ GOTO 1
		++ @502 /* You aren't going to ask me to deliver any love poetry, are you? */ GOTO 2
		++ @503 /* I don’t have time for this. */ GOTO 3
END

IF ~~ THEN BEGIN 1
	SAY @504 /* Yes, well, you see… I… lost my master’s Candle of Limited Wish. Well, I didn’t really *lose* it. I know where it is, but it may as well be lost to me! I need someone to recover it for me. Otherwise, my master will be furious! I’ll be in so much trouble. */
		++ @505 /* How do you lose a Candle of Limited Wish?! */ GOTO 1A
		++ @506 /* And this is where I come in. */ GOTO 1B
		++ @507 /* Alright, I'll do it. */ GOTO 4
		++ @503 /* I don’t have time for this. */ GOTO 3
END

IF ~~ THEN BEGIN 1A
	SAY @508 /* Well, I didn’t *lose* it! I know where it is, I just need help getting it back. I was supposed to buy a candle for Lord Gorinel's pet’s birthday party. Well, I bought the candle, but I sort-of… gave him the wrong one. The candle should be at his manor. All you have to do is get into the party somehow, snoop around, find the candle, and bring it back! */
		++ @509 /* And you can't get it back yourself because...? */ GOTO 1C
		++ @506 /* And this is where I come in. */ GOTO 1B
		++ @503 /* I don’t have time for this. */ GOTO 3
END

IF ~~ THEN BEGIN 1B
	SAY @510 /* Yes, precisely. I was supposed to buy a candle for Lord Gorinel's pet’s birthday party. Well, I bought the candle, but I sort-of… gave him the wrong one. The candle should be at his manor. All you have to do is get into the party somehow, snoop around, find the candle, and bring it back! */
		++ @509 /* And you can't get it back yourself because...? */ GOTO 1C
		++ @503 /* I don’t have time for this. */ GOTO 3
END

IF ~~ THEN BEGIN 1C
	SAY @511 /* I… I wasn’t actually invited to the party, and it’s not like I have any skill at this sort of thing. */
		++@512 /* You bought a candle for a party that you weren’t invited to? */ GOTO 1D
		++ @503 /* I don’t have time for this. */ GOTO 3
END

IF ~~ THEN BEGIN 1D
	SAY @513 /* Er… well, yes. Look, will you help or not?! */
		++ @507 /* Alright, I'll do it. */ GOTO 4
		++ @503 /* I don’t have time for this. */ GOTO 3
END

IF ~~ THEN BEGIN 2
	SAY @514 /* Oh, it’s nothing of the sort! I prefer to deliver such things myself. You see… I… lost my master’s Candle of Limited Wish. Well, I didn’t really *lose* it. I know where it is, but it may as well be lost to me! I need someone to recover it for me. Otherwise, my master will be furious! I’ll be in so much trouble. */
		++ @505 /* How do you lose a Candle of Limited Wish?! */ GOTO 1A
		++ @506 /* And this is where I come in. */ GOTO 1B
		++ @507 /* Alright, I'll do it. */ GOTO 4
		++ @503 /* I don’t have time for this. */ GOTO 3
END


IF ~~ THEN BEGIN 3
	SAY @515 /* Oh. Well, I’ll be here. Probably. Still looking for someone, if you change your mind. Please change your mind! */
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 4
	SAY @516 /* Oh, thank so much! Please let me know how it goes and come back when you get the candle! I'll be here. Probably. */
	IF ~~ THEN DO ~SetGlobal("GGPMQ","GLOBAL",1) AddJournalEntry(@5100,QUEST)~ EXIT
END


IF ~Global("GGPMQ","GLOBAL",1)~ THEN BEGIN 100
	SAY @517 /* Do you have the Candle of Limited Wish yet? */
		+ ~PartyHasItem("GGPWC")~ + @518 /* Yes, here you go. */ GOTO 101
		+ ~PartyHasItem("GGPWC")~ + @519 /* Yes, I've decided it's mine! */ GOTO 102
		++ @520 /* No, not yet.  */ GOTO 103
END

// The good ending
IF ~~ THEN BEGIN 101
	SAY @521 /* Oh, thank you! Here, this is everything of value that I own. You deserve it. And I’ll tell everyone how helpful you were! Er… I’ll not tell them what you *did* since that would be dreadfully embarrassing for me, but I’ll say that you were very, very, very, very helpful! Here, take this gold I found. And this chicken, as well. I was going to use her to try to sneak myself into the party, but I couldn't figure out how to do so. I hope you like her! Farewell! */
	IF ~~ THEN DO ~AddJournalEntry(@5103,QUEST_DONE)
					SetGlobal("MMPMQ","GLOBAL",2)
					TakePartyItem("GGPWC")
					ReputationInc(1)
					GiveGoldForce(4000)
					GiveItemCreate("GGPSBC",Player1,1,1,0)
					AddXPObject(Player1,15000)
					AddXPObject(Player2,15000)
					AddXPObject(Player3,15000)
					AddXPObject(Player4,15000)
					AddXPObject(Player5,15000)
					AddXPObject(Player6,15000)
					CreateVisualEffect("SPPORTAL",[914.1222])
					DestroySelf()~ EXIT
END

// The bad ending
IF ~~ THEN BEGIN 102
	SAY @522 /* You… you’ve what?! Oh, my life is over! Over! I’ll… I’ll fight you for it! */
	IF ~~ THEN DO ~AddJournalEntry(@5104,QUEST_DONE) Enemy()~ EXIT
END

//not yet
IF ~~ THEN BEGIN 103
	SAY @523 /* Please hurry! */
	IF ~~ THEN EXIT
END
