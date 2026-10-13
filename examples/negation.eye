# Three players want to join a game.
milo is a player.
luna is a player.
rex is a player.
luna is a tired-player.

# A player can join if the program does not show that they need rest.
if ?player is a player and ?player does not need rest then ?player is a ready-player.

# This rule is checked before the not clue, even though it comes later.
if ?player is a tired-player then ?player needs rest.

# You can also use "is not" for a kind.
if ?player is a player and ?player is not a tired-player then ?player is an eager-player.

# Answer and Reason: who can join, and which clues explain that?
who is a ready-player?
why?
who is an eager-player?
does milo not need rest?
why?
does luna not need rest?
why?
how many ready-players are there?

# Check: resting luna stays out; milo and rex remain ready.
check that milo is a ready-player.
check that rex is a ready-player.
check that luna is not a ready-player.
check that luna needs rest.
check that milo does not need rest.
check that there are 2 ready-players.
