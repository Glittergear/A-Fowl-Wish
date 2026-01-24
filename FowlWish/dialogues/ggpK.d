BEGIN d_ggpK

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0
	SAY @200 /* I’m telling you, a pound of steel is heavier! Steel is heavier than feathers! */
	IF ~~ THEN GOTO 1
END

IF ~~ THEN BEGIN 1
	SAY @201 /* Nuh-uh! A pound is a pound! They’re the same weight. */
	IF ~~ THEN GOTO 2
END

IF ~~ THEN BEGIN 2
	SAY @202 /* Hey! A grown-up! A pound of steel is heavier than feathers, right? */
		++ @203 /* Yes, steel is heavier than feathers. */ GOTO 10
		++ @204 /* No, they're the same weight. */ GOTO 20
		++ @205 /* The feathers are heavier, because you have to live with the weight of what you did to those poor birds. */ GOTO 30
		++ @206 /* I don't have time for such childish arguments. */ GOTO 40
END

IF ~~ THEN BEGIN 10
	SAY @207 /* Haha! See, I told you! */
	IF ~~ THEN GOTO 11
END

IF ~~ THEN BEGIN 11
	SAY @208 /* Nuh-uh! You’re BOTH wrong!  */
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 20
	SAY @209 /* What!? But steel is heavier than feathers! How can they be the same weight?! */
	IF ~~ THEN GOTO 21
END

IF ~~ THEN BEGIN 21
	SAY @210 /* Because you have a pound of each, dummy! A pound is a pound! */
	IF ~~ THEN EXIT
END
	
IF ~~ THEN BEGIN 30
	SAY @211 /* But… but I thought steel was heavier than feathers… */
	IF ~~ THEN GOTO 31
END

IF ~~ THEN BEGIN 31
	SAY @212 /* That… makes some sense I guess. I never looked at it that way. But what if you found all the feathers already on the ground? */
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 40
	SAY @213 /* Booooring! */
	IF ~~ THEN GOTO 41
END

IF ~~ THEN BEGIN 41
	SAY @214 /* Finally, something we agree on! You’re boring! */
	IF ~~ THEN EXIT
END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN 100
	SAY @215 /* But how can steel be heavier than feathers! Feathers are so light. Steel is so heavy. */
	IF ~~ THEN GOTO 101
END

IF ~~ THEN BEGIN 101
	SAY @216 /* Because you have a pound of each, you dolt! A pound is a pound! */
	IF ~~ THEN EXIT
END
