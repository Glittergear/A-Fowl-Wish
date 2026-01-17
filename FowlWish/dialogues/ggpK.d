BEGIN d_ggpK

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
	SAY ~I’m telling you, a pound of steel is heavier! Steel is heavier than feathers!~ IF ~~ THEN GOTO 1
END

IF ~~ THEN BEGIN 1
	SAY ~Nuh-uh! A pound is a pound! They’re the same weight.~ IF ~~ THEN GOTO 2
END

IF ~~ THEN BEGIN 2
	SAY ~Hey! A grown-up! A pound of steel is heavier than feathers, right?~
		++ ~Yes, steel is heavier than feathers.~ GOTO 10
		++ ~No, they're the same weight.~ GOTO 20
		++ ~The feathers are heavier, because you have to live with the weight of what you did to those poor birds.~ GOTO 30
		++ ~I don't have time for such childish arguments.~ GOTO 40
END

IF ~~ THEN BEGIN 10
	SAY ~Haha! See, I told you!~ IF ~~ THEN GOTO 11
END

IF ~~ THEN BEGIN 11
	SAY ~Nuh-uh! You’re BOTH wrong! ~ IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 20
	SAY ~What!? But steel is heavier than feathers! How can they be the same weight?!~ IF ~~ THEN GOTO 21
END

IF ~~ THEN BEGIN 21
	SAY ~Because you have a pound of each, dummy! A pound is a pound!~ IF ~~ THEN EXIT
END
	
IF ~~ THEN BEGIN 30
	SAY ~But… but I thought steel was heavier than feathers…~ IF ~~ THEN GOTO 31
END

IF ~~ THEN BEGIN 31
	SAY ~That… makes some sense I guess. I never looked at it that way. But what if you found all the feathers already on the ground?~ IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 40
	SAY ~Booooring!~ IF ~~ THEN GOTO 41
END

IF ~~ THEN BEGIN 41
	SAY ~Finally, something we agree on! You’re boring!~ IF ~~ THEN EXIT
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN 100
	SAY ~But how can steel be heavier than feathers! Feathers are so light. Steel is so heavy.~ IF ~~ THEN GOTO 101
END

IF ~~ THEN BEGIN 101
	SAY ~Because you have a pound of each, you dolt! A pound is a pound!~ IF ~~ THEN EXIT
END
