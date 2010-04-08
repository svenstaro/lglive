-----------------------------------------------
Urban Terror: Total Conversion for Quake3:Arena
4.1 Release
http://www.urbanterror.net
-----------------------------------------------

------------------------------------------------------------
| THE FROZEN SAND, LLC DEVELOPMENT TEAM | 
------------------------------------------------------------

- Blackrayne
Modeller

- BladeKiller
Senior Artist / Level Designer / QA Manager

- HighSea
Programmer

- Mr
Music / Sound Engineer

- Oswald
Project Coordinator / Public Relations

- RabidCow
Senior Level Designer/ Texture Artist

- Riche
Level Designer

- ShminkyBoy
Level Designer

- Tub
Level Designer

- TwentySeven
Senior Programmer / Level Designer

- woekele
Programmer / General Helper

- |NV|S
Level Designer / Modeller
------------------------------------------------------------

This is the readme file for release 4.1 of Urban Terror.  
Please refer to http://www.urbanterror.net/ for further details.


Legal stuff
===========
The makers of Urban Terror accept no responsibility for any damage or 
injuries resulting from use of this software. You download and install 
this software at your own risk. 

Urban Terror is a collection of mod files created by Frozen Sand LLC, 
community maps and community assets which are creditted in the map 
readme's. The files that constitute this modification are copyright 
Frozen Sand, LLC 2000-2007. 

Use of any file contained within the mod is illegal without permission. 
Anyone wishing to re-use any of the media contained within the official 
release of Urban Terror should first contact Frozen Sand at 
http://www.frozensand.com or http://www.urbanterror.net 

Urban Terror is distributed free over the Internet and is covered by the 
Quake 3 SDK licence agreement [EULA]. The mod files may not be sold [in 
any form] or distributed on physical media unless with permission from 
iD Software. 

For further information on legal use of programs derived from Quake 3 
source code, please contact their respective authors. 


Installation
============
If you have Quake 3 Arena and want to continue using PunkBuster: Make 
sure you have Quake 3 Arena updated with Point Release 1.32(c) and 
update PunkBuster with pbsetup. Copy the q3ut4 folder from 4.1 to your
quake3-directory and make shortcut to quake3.exe. Add "+set fs_game q3ut4"
to the targetfield of the shortcut.

If you don't have Quake 3 Arena and/or don't care about PunkBuster: 
Run the 4.1 installer or unzip the 4.1 zip.

Beta 4.1
===========
[22.12.2007]
-Working IP ban system
-Duplicate name protection (the trade of is that you can't use spaces in your name anymore though)
-Removal of white skins
-New/updated maps
-Updated UI and default settings
-/rcon players command, returning map/score and per player: name, team, score, ping, IP
-No votes within first 60 seconds of a map
-Fixed hit bug when crouching and moving
-Several spawn locations fixed
-Negev reload exploit fixed
-Power slide physics exploit fixed
-TDM scoreboard not updating fixed
-in-game browser now remembers your sorting preferences
-Short names won't mess up the healtbar anymore
-A problem with blood (fps bug?) fixed
-sr8 gets 5 bullets again, but unzooms when getting hit with 15% damage
-spas does less damage. Knockback when getting hit by it is lower.
-ump does more damage
-psg back to 8 bullets and chest hits bleed out
-some changes to the log files
-allowdownload cvars locked
-demonames changed to YYYY_MM_DD instead of YYYY_DD_MM
-removed 'parsing xxx.menu' spam from console


Beta 4.0
===========
[04.01.2007]
4.0 Notable Changes
====================
* No longer depends on any Quake 3 Arena assets.
* New player models/skins
* New player animations
* New hitdetection
* Ingame Stats
* Banning using a banlist.txt (IP-based)
* Powerslide introduced
* Goomba Stomping introduced
* Hot Potato Feature introduced
* Vote system overhauled
* Menus overhauled
* New weapon skins (Spas/G36)
* Sprinting is faster now
* Hitsound
* Being able to set the next map introduced
* Muting of players introduced
* Veto'ing of votes introduced
* Player armbands introduced
* Funstuff introduced
* Maps updated and added - from minor tweaks to complete overhauls (see map list for new maps)
* Tac-Goggles overhauled
* Damage Values updated
* UMP now has 30 bullets instead of 25 and a spammode instead of burst. 3 bullets, very quickly in a row each time you shoot.
* Spas fires quicker, but has less bullets
* Negev is like a mp5k with 90 bullets now, no more stamina reduction.
* Bullets now penetrate arms/legs to hit head/torso if they're in the way.
* New Frozen Sand introduction graphics
* protection versus the name 'all'.
* Players can't look around while game is paused anymore
* Added ability to become captain when old captain is 999.
* TK auto-kick message updated
* Loading screen progress indicator
* NVG look changed


4.0 Cvars/Commands
==================
General
* com_hunkmegs now defaults at 256
* gamename = q3ut4
* g_modversion = 4.0

Client side
* Overbrightbits/MapOverBrightBits/fastsky/lightmap/muzzleflash locked
* FPS capped at 125 
* Position of text when using cg_drawcrosshairnamestype 1 changed to not colide with team overlay
* 'raceblue' and 'racered' instead of 'race'
* 'cg_hitsound' turns on/off hitsound
* 'funred' and 'funblue' to set funstuff.
* 'cg_rgb' sets your armband/minimap/scoreboard color, if server allows it

Server side
* Server now echos when changing certain cvars, which it didn't do before (bombexplodetime for example)
* Removed/shortened cvars from infostring to decrease chance of 'info string length exceeded' warnings
* 'mute' to mute a clientnumber
* 'veto' to let a vote fail
* addip/removeip to ban/unban IP addresses. Can also use clientnumber to ban someone.
* g_hotpotato sets number of minutes of stand-off before hotpotato kicks in (0=off)
* g_allowvote values changed. Check http://www.urbanterror.net/allowvote_calc.html
* g_nextmap lets you set the next map
* g_armbands added. 0=let player decide armband color 1=force red/blue 2=assign random color to players
* g_redwaverespawndelay changed to g_redwave and g_bluewaverespawndelay to g_bluewave
* g_survivorroundtime = g_roundtime now
* g_captureandholdtime changed to g_cahtime
* g_surivorrounddelay = gone


4.0 Map List
=================
ut4_abbey
ut4_abbeyctf
ut4_algiers
ut4_ambush - Masheen
ut4_austria
ut4_casa
ut4_crossing - Masheen
ut4_dressingroom
ut4_elgin
ut4_firingrange - Hybridesque
ut4_mandolin - Null
ut4_prague
ut4_riyadh
ut4_ramelle
ut4_sanctuary - Sinny
ut4_snoppis
ut4_thingley
ut4_tombs
ut4_toxic - Duf Knien
ut4_turnpike
ut4_uptown


==============================
3.x Dev Cycle Release History
==============================

Beta 3.7
============
[07.11.2004]

Beta 3.6
============
[05.16.2004]

Beta 3.5
============
[05.15.2004]

Beta 3.4
============
[03.16.2004]

Beta 3.3
============
[02.13.2004]

Beta 3.2
============
[01.16.2004]

Beta 3.1
============
[10.07.2004]

Beta 3.0
============
[08.09.2003]


3.7 Features
============
* Boot is now available with Beretta and DE and grenades
* Sr8 damage to waist and groin equalized at 80%
* Knife damage increased
* ut_timenudge - lets you swap ping for a smoother world view. Useful for people who are having hitting issues/jerky other
player issues. If not,leave it on 0. Range (0-50ms) 
* walljumping - easier to do now esp. for hpbs. The 3 jump limiter was slightly broken, meaning it wasn't working as nicely
in 3.6 as it was during 3.5 qa testing. Fixed now.
* walljumping - cannot walljump off other players
* walljumping - cannot walljump off of low ledges
* cg_autoscreenshot - check if thats behaving right please.
* player rendering - player angle changes were not smooth before, now they are.
* new options for cg_drawteamoverlay 0 1 2 3 
    - 0 is none
	- 1 is both teams displayed
	- 2 is just your team, smaller, and the alive count of the other team
	- 3 is only yourself and the alive counts of your team and the other team
	and
* cg_drawteamoverlayscores 0 1  which turns off the scores from the above options
* g_deadchat 0/1/2 only works in matchmode
     0 dead can talk to only dead or sub
     1 is the default, dead can pester their own team
     2 means the dead can pester everyone
     - specs are always locked out however
* /restart unreadies teams correctly
* you have to ready up again after 1/2 time
* removed the bobby rotation of portal cameras


3.5 Features
============
* New cg_scopering (enabled by default) shows a ring on the sr8 crosshair scope reflecting MP
* ut_itemdrop now accepts "kevlar","silencer","helmet","flag","nvg"
*** forgotten feature *** if you put maptoggle on 0 you can bind a key to button12 (like bind j +button12) that'll only
display the minimap so long as its held down
* new nvg effects cg_nvg 0-8 changes colour
* new walljump physics
* legshots dont slow you so much 
* running with low stamina doesnt slow you so much
* Have to have the knife selected to boot (can boot team mate if FF is on)
* Crouch is sticky in air - i.e. if you crouch while jumping you stay crouched until you land


3.4 Features
============
* g_swaproles 0/1 - defaults to On - at Intermission, teams are swapped, map starts up again with a warmup
* g_maxrounds N - 0 for off, have to have it off to use the timelimit
* cg_autoscreenshot to accept a value of 2 now to only take shots during matchmode
* New bomb mode rules removed.
* g_survivorroundtime now accepts real numbers like 1.5 for 1:30 worth of time.
* Changed the g_teamnameRed and g_teamnameblue to not be latched anymore
* Changed intermission not to look around anymore
* Made TDM use TS spawns if no TDM spawns around
* modified the UI to show 1/2 time scores on the scoreboard
* if it somehow makes it to 1/2 time without either team readying a ready up in the second half resets the match
* personal scores are kept between first and second half unless a restart is called in which case the personal scores are
cleared but the match starts at the second 1/2
* Improved pause text 
- "Pausing" appears at the top of the screen
- by who (red/admin/blue)
- whether it's a timeout or pause
* Pause and resume have countdowns eg: "Resuming in 9 seconds" etc which are in the middle of the screen


3.3 Features
============
New Bomb Mode rules
    - 2 points for red on successful plant
    - 2 points for blue for stopping red from planting by killing all of red before they plant
    - 1 point for red for killing all blue but not planting
    - 1 point for blue for defusing the bomb
    - 0 points for a draw

* g_bombRules 0/1 - Cvar control for old and new bomb rules 
    - 0 = old rules
    - 1 = new rules and is on by default

Kicking enabled in FFA

Graphic display in lagometer when antiwarp is affecting you. (antiwarp indicated by black lines in lagometer)


3.2 Features
============
g_antiwarp 0/1
	- It's turned off by default as it's still fairly experimental, and a little controversial. It stops warpers. But
	to the person actually warping it feels like packetloss.

g_antiwarpTol 50
	- It's the MS tolerance before g_antiwarp decides that you're a warper. Most players have well under 20ms, but
	severe warpers (ie.uploading/downloading) are over 50 most of the time. Recommended you just leave it on 50, but
        set it can be tunedslightly lower (40, or maybe 30) if there are certain persistant people who still try and get
        past this.

g_gear 0
	- g_gear is a server-side option that allows you to disable certain weapons from spawning with players. It's a bit
	field (like g_allowvote), so you pick what combinations you want by summing the relevant bit values. 
		They are:
		1  No Grenades
		2  No Snipers (psg1 or sr8)
		4  No Spas
		8  No Pistols
		16 No Autos (primary or secondary)
		32 No Negev
	
		-So, if you wanted to run a pistol only server, you'd remove everything else. 
		1+2+4+16+32 = 55
		g_gear 55 = Pistols Only.
		- Clients are notified when g_gear is changed as to what is allowed, (as well as when joining a server).
		- Known Issue: The actual loadout screens wont prevent you from selecting disallowed weapons, you'll just
		  never spawn with them.

Voting on g_gear
	- g_gear can be disallowed/allowed for voting by the bit value "32" in g_allowvote.

Throwing Knives
	- The ability to throw knives is back.

CAH Flags Reset
	- The flags set back to neutral when the round time is up and a sound is played to alert you.

Laser available on more weapons
	- Laser is now available on the AK103 and the Imi Negev

Laser does 10% recoil reduction as well as 40% spread reduction


3.1 Features
============
* cg_hitmessages 2   =   new damage reporting system that gives you the actually amount of damage in a percentage format 
* colours allowed in team chats now
* chats show as yellow in the console.
* cg_showbullethits 2 
* Shows the % damage dished out on each shot
* Shows the % health left to bastard who killed you
* Fix to the ent->think bug that was causing the bomb to disappear on the new Abbey2


3.0 Features
============
Bomb mode.
New and updated player skins.
New weapon, IMI Negev.
New G36 model.
Match mode.
New menus.
New radio messages.


3.7 Bug Fixes
=============
* Water crouch bug fixed
* Adjustment to the antilag code
* team overlay refreshes properly except flag returns (the point doesn't show until you hit tab)
* cg_autoscreenshot fixed so that 1 takes screenshots in pub and matchmode and 2 only in matchmode
* server degradation dealt with but it is still recommended that you restart dailly (q3 needs restarting within 24 days but
  we found degradation started after only 15 hours)
* Fixed some clips on Casa

 
3.6 Bug Fixes
=============
* Fixed ammo exploit
* Replaced missing texture in Casa


3.5 Bug Fixes
=============
* quick weapon swap bug fixed
* reload anim bug fixed
* q3 crash with no soundcard fixed
* disappearing flag bug fixed 
* teams now unreadyd on /restart
* Fixed crouch animation when jumping which corrects ARIES alignment for better hit detection
* Fixed ent->think error that was causing the bombsite to disappear
* Fixed g_swaproles 
* Fixed swapteams 
* cg_autoscreenshot 1 is fixed so it takes screenshots in matchmode
* modifed: month_day has been swapped for day_month in autoscreenshot text
* Fixed double bomb
* Modified the bomb blast
* Can't jump plant anymore
* Fix for low ammount of spawns (multiple repeating spawn death) bug
* Changed our antilag code to use doubles, not floats


3.3 Bug Fixes
=============
* Ingame browser fixed
* Antiwarp adjusted so you can ledgeclimb properly


3.2 Bug Fixes
=============
* Timer fixed
* Sub no longer drops bomb/flag when disconnecting or unsubbing
* Sub no longer creates ghosts
* Spectator no longer takes bomb/flag when disconnecting


3.1 Bug Fixes
=============
* Fixed in-game browser to recognize Bomb Mode
* Fixed button binding bug in Menus
* Increased Info string length
* Removed tracers from SPAS
* Prevented bomb plant in water
* Fixed bomb animation bug
* Fixed autoscreenshot going off during demo playback
* fixed matchmode demos goofing up
* AntiWallhack code removed to improve FPS
* bigger bounding box for flag so you shouldn't be able to jump over it now
* Most of the GTV issues fixed.
* bombplant and zoom/injured fixed 


Beta 3.2 Maps
=============
ut_precinct
ut_oz
ut_pg2-27


Beta 3.0 Maps List
==================
ut_27 - 3.0 example map (for mappers).
ut_abbey2
ut_algiers
ut_commune2
ut_casa
ut_crenshaw
ut_docks
ut_druglord3
ut_filtration
ut_golgotha2
ut_mines
ut_nimrod
ut_offshore
ut_revolution
ut_ricochet
ut_riyadh
ut_rommel
ut_sanc
ut_sands
ut_siberia
ut_streets2
ut_swim
ut_turnpike
ut_twinlakesv2
ut_uptown
ut_village2


Beta 3.0 Overview by Dracostian
===============================
Please see the included overview.txt file.


New cvars and commands overview
===============================
Server:
g_bombExplodeTime 
    Number of seconds until bomb explodes after being planted.

g_bombDefuseTime
    Number of seconds it takes to defuse the bomb.

g_waveRespawns
    Set to 1 to enable wave respawns.

g_redWaveRespawnDelay, g_blueWaveRespawnDelay
    Configures respawn delay for each team when wave respawns are enabled.

g_followStrict
    This replaces g_followForced and g_followEnemy, set to 1 to enable strict spectating rules, mostly applies to matches
    spectators are not effected, only team players.

g_matchMode
    Set to 1 to enable match mode.

g_pauseLength
    Admin pause length in seconds; set to -1 for infinite.

\pause
    Admin command to pause game; call again to un-pause.

\forceready
    Admin command to force team to ready status.

\forceteamname
    Admin command to force team name, syntax: \forceteamname <red/blue> <name>

g_timeouts
    Number of allowed timeouts per map.

g_timeoutLength
    Timeout length in seconds, minimum 3 seconds, maximum 300 seconds.

\swapteams
    Admin command to swap teams.

\shuffleteams
    Admin command to randomize teams.

\map_restart
    Admin command to do a 'soft' restart, will reset scores and times without reloading map.

\reload
    Admin command to do a 'hard' restart, will reload map completely; use for things like sticking latch cvars
    (g_gametype, g_matchMode, etc..) values.


Client:
\captain
    In match mode type this to become team captain.

\ready
    Captains use this command to ready the teams.

\teamname
    Captains can use this command to set team names; syntax: \teamname <name>

\timeout
    Captains can call timeout during a match using this command.

\sub
    In match mode type this to become a team spectator.

cg_physics
    Set to 1 to enable frame rate independent physcis; jump same distances regardless of your fps.

cg_optimize
    Set to 1 to enable optimized client code, will increase fps on low end CPUs.

ut_weaptoggle bomb
    New toggle command for use in Bomb mode.

cg_drawCrosshair
    Five new crosshairs: 9, 10, 11, 12 and 13

cg_hudWeaponInfo
    Configures the visual display of your weapon information; weapon name, number of rounds/clips, weapon mode.
    Valid range: 0 to 2.

cg_scopeG36, cg_scopePSG, cg_scopeSR8
    Configures the scope type for the scope-able weapons, valid range 0 to 3.

cg_crosshairNamesType
    Switches between different crosshair name types, valid range 0 to 3.

cg_crosshairNamesSize
    Changes crosshair names size.

\recorddemo
    Starts a demo recording, demo name includes map name, gametype and team names when in match mode.

cg_autoRecordMatch
    Set to 1 to enable auto demo recording on match start.

\race
    Selects model type, valid range 0 - 3.

cg_drawFps
    Set to 1 to enable 'true' fps, 2 for old fps calculation.

\ut_radio
    Now accepts custom strings; syntax: \ut_radio <x> <y> <optional string>

cg_autoRadio
    Now accepts another configuration settings, set 0 to turn off all auto-radio calls, set 1 to turn off Grenade! calls
    but keep all the other calls and set 2 to enable everything.

And the real reason why people play Urban Terror 3.0:
    \breakout_play
    \breakout_reset
    \breakout_pause
    \breakout_left
    \breakout_right

Vote system:

g_allowVote no longer takes 0, 1 or 2 as its value. You can now configure it to except different vote groups, those groups

are:

1:
reload
restart
map
nextmap
kick
swapteams
shuffleteams
g_friendlyFire
g_followStrict

2:
g_gametype
g_waveRespawns

4:
timelimit
fraglimit
capturelimit

8:
g_respawnDelay
g_redWaveRespawnDelay
g_blueWaveRespawnDelay
g_bombExplodeTime
g_bombDefuseTime
g_survivorRoundTime
g_captureScoreTime
g_warmup

16:
g_matchMode
g_timeouts
g_timeoutLength
exec

beta 3.2 adds
 
32:
g_gear


Note that the group numbers are a power of two. To configure your server for allowing the first group to be vote-able,
set g_allowVote to 1. If you wish to allow several groups to be vote-able, add their numbers and set g_allowVote with
result, for example groups 1 and 4, set g_allowVote to 5 (1 + 4). If you wish to enable full voting on your server, set
g_allowVote to 63 (1 + 2 + 4 + 8 + 16 + 32).


Beta 2.6a
============
[01.17.03]

Changes From 2.6 to 2.6a (weapon patches)
 
Bug Fixes:
*  Voting Fixed
*  Black screens fixed
*  Disapearing Flag on flag holder lag out disconnection fixed
*  Null ent->think crashes fixed (other "rare" crashes still present!)
 
Changes:
*  Clearscores command removed 
*  Black fading screen removed (noone liked it anyway)
*  Direct Team changing in TS/FTL doesn't clear your score, Changing from team to spectator
   to team does thought.
*  Min rate now 2500, Max rate 25000
*  cl_maxpackets min now 20, max 42
*  snaps min 20 max 40
 
* plus lots of other things that we've forgotten about :)
 
Weapon Changes
 
* AK103: Damage lowered, Spread and movement pentily lowered
* Beretta: Spread increased, knockback increased
* Desert Eagle: Nothing!
* G36: Damage increased, Rate of fire slowed, Movement Pentily lowered, Kickback from
firing lowered
* LR300: Damage increased Movement Pentily lowered
* MP5k: Damage lowered, range lowered.
* PSG-1: Damage increased, VITAL HITS REMOVED (apart from head), kickback and reload
time increased, Movement Pentily Lowered.
* SPAS-12: Damaged almost Halfed!, Rate of fire slowed (more to come in 2.6b!)
* UMP: Nothing!
* Sr-8: Damage Decreased!, After firing Screen doesn't automatically zoom in anymore!!
 
Please be Aware that there are still bug issuses within the code, we are currently
working towards that and major/importantproblems will be addressed in 2.6b!
 

Twentysevens Note: Before you read this and have a heart attack at all the"lowered"'s, 
this is actually the fastest paced,and most balanced, release of UrT during the 2.x
series. The balance was decided upon by leading members of the clan community, and we
respectfully thank them for all their hard work.
 
Twentysevens Note Part II:   TIMMAH RAWKS. 
(ref, Tim is DensitY)


Beta 2.6
============
[11.09.02]

Quick Note
==========

	Thanks to Apoxol, who did an amazing amount of work on betas 
	2.0-2.3 and continues to provide sage advice from his cushy 
	new job with Ravensoft.

	Beta 2.6 welcomes a new coder to the team: Density, who has provided
	TwentySeven a considerable amount of assistance through this development
	cycle. 


Features:
	Newly update team player skins
	Replaced M4 with the ZM LR300ML
	Kalashnikov AK-103 added
	New UMP45 model
	Implemented mini-map now displays players, flags and radio calls
	included cg_mapsize
	included cg_mapalpha
	included cg_maparrowscale
	included map arrowalpha
	included cg_mappos
	ut_metro added
	ut_mines added
	ut_twinlakes added
	ut_turnpike added
	ut_reykjavik added
	new shake effect when grenades explode
	hold insta-arm HEs too long for a good time
	added slap and bigtext commands for server admins
	added cg_SpectatorShoutcaster
	added "headshot" with select weapons
	/com_blood now toggles gore effects
	

Modifications:
	Team Survivor code completely rewritten
	/matchready added for teams to "warm up"
	/g_casualtieswins rule add
	improved helmet
	all weapons tweaked
	increased Movement pen for PSG
	new UMP45 skin
	new G36 skin
	new Beretta skin
	new knife skin
	new SPAS skin
	updated SR-8 model
	ut_riyadh updated
	ut_docks updated
	ut_uptown updated
	user interface changes
	callvote now includes matchready, matchstart
	callvote to turn friendlyfire on/off
	ability to kick bots from botmenu
	added the AK to the primary weapon menu
	flash grenade less intense when looking away
	grenades no longer disappear when thrown through doors
	rotating door code improved, players don't stick
	ARIES hit detection values changed
	precipitation on terrain added (snow and rain)
	updated sounds
	rewritten netcode
	added $crosshair function
	increased boot detection
	sv_fps limited to 20
	max_packets limited to 42
	callvote now includes 'matchready'
	added SID logo (ROQ) to replace id logo
	
Bug Fixes:	
	reduced the movement penalty
	Improved knife hit detection
	Fixed flickering bodies in FTL mode
	Fixed bug with Spas where it fired pellets behind a player
	bug with changing teams while dead in CTF/TDM/CAH modes resulting in black screen.
	warmuptime/g_survivourrounddelay code
	Nades through floors
	bug with blood Particles
	corpses fading too long
	Fixed FTL leader code
	g_followForced 1 only applies to Ghosts now (not spectators)
	fixed incorrect zoomed crosshair in ghost/spectator mode
	exploding monkey no longer throws shit
	made blue minimap icon darker
	fixed minimap
	callvotes win system fixed
	fixed losing of Hud and weapon in spectator mode when following someone
	Now displaying more correct pings in ghost mode/follow mode
	fixed non clearing of clientside entities between TS/FTL
	fixed CTF game.log logging

Known Issues:
	no logging for CAH game mode
	spawns still need a little more work
	$gametime not working in TS/FTL
	blood particles give a a small fps hit
	
Misc Notes
==========
	Even with eight months of recoding, tweaking, modifying and testing, there
	will be times gamers encounter bugs and problems, with Urban Terror,
	Quake 3 or PunkBuster related. We are not perfect, but we are dedicated
	to our software and have made every attempt to fix the problems as they
	presented themselves during the development cycle.

	If you happen to have unfortunate luck and run into problems, take the
	time to check the manual, FAQ and forums, before dropping the F-bomb on
	the development team. We are here to support and assist the community
	through their problems and have been since Beta 1. We are usually around
	the forums and IRC on a regular basis if you have problems. The community
	is very good when it comes to assisting gamers in the problems they 
	encounter.

	Last but not least, remember to have fun and enjoy playing Urban Terror.
	The development team enjoys working on Urban Terror and supporting the
	community. We are all friendly and enjoy the support gamers continue
	to give us. So, enjoy Beta 2.6 and thank you for your continued support.

	-Oswald
	

Beta 2.5
============
[02.23.02]

Notes on 2.5
============

2.5 is primarily a bug fixing release for 2.4.  

The weapons have been slightly tweaked to make some of the more devastating weapons a bit 
more balanced.  The MP5K became a lot more powerful than we intended with the hit bug gone
because with its rate of fire it was getting a LOT of headshots.  We understand people's
feelings about the weapons, but we felt that getting 2.5 out so the server issues could 
be dealt with was very important.

I am also aware that LPBs can feel like they get hit "behind a wall" by a HPB.  In 2.3 and 
before the netcode did a check to see if a HPB's shot would be disallowed because the 
LPB had gone behind a wall before the HPB fired off their shot.

In upgrading the netcode, I didn't re-implement this feature.  Some people may notice it and
feel ripped off.  You are not, in fact, being ripped off by it.  If you seem to get hit
behind a wall it's because you were not behind a wall when the HPB saw you.  I beleive this
is balanced by the fact that a LPB can spot a HPB before the HPB sees them, and often
the reaction time leads to the HPB getting killed before he fires off a shot.  Normally
the LPB will win in any "surprise" situations.

I'll add in the wall check for 2.6 if people feel the wall issue is a huge problem. For now
I want people to know that it's not giving anyone an unfair advantage, it just feels odd.

Server admins please leave master2 in your server.cfg open and DO NOT assign it a master
server, as by default will send a heartbeat to the Urban Terror Master Server. If you have
master2 assign, just move that master server to something other than server2.

Fixes:
 * client info was being corrupted by new team skins code; fixed
 * large amounts of data going to the server added in 2.4 removed (less server lag)
 * problem with bots fixed (the 999 bug)
 * follow enemy now works correctly with the /follow command
 * cg_deferPlayers now works correctly
 * unlocked r_gamma
 * added 4 new lock cvars
 * added small delay on zoomin that prevents snipers from gaining full 
   accuracy immediately; this is to stop script exploits that let people 
   fire accurately while unzoomed

Features:
 * added environmental lighting to decals and particle effects
 * helmet now more effective

Changes to weapons:
 * there have been NO changes to damage of any weapons in this release
 * MP5 spread and movement penalty increased
 * UMP45 spread and movement penalty increased
 * G36 movement penalty reduced (more accurate when running)

 
Known Issues
============

There were a few things we didn't get a chance to fix, but are aware of:

 * weapons are not totally balanced (see above)
 * LPBs can apparently get hit behind walls (see above)
 * cg_bobup and cg_bbpitch cvars locked to their default values
   and cannot be set to 0.  People who are used to setting these
   to 0 (like Vynnski :) will notice the bob is back until 2.6
 * weapons sometimes seem to revert to burst mode for some people
 * hand skin can sometimes be wrong until respawn if you change skins

Beta 2.4
==============
[02.08.02]

Quick Note
==========

	Thanks to Apoxol, who did an amazing amount of work on betas 
	2.0-2.3 and continues to provide sage advice from his cushy 
	new job with Ravensoft.

	Beta 2.4 welcomes three new coding talents: TwentySeven, Iain and Thaddeus

	Thanks also to Neil from the Q3 Antilagged mod for some extra advice
	on fixing a few small bugs in the UrT netcode, and to RR2D02 from
	Q3F who was kind enough to give me his cvar locking code. 	

	 - dokta

Bug Fixes:	
	Fixed a bug that let spectators trigger some entities
	Some particles were spawning at the wrong position: fixed
	CTF was reporting incorrect team flag being returned
	Chopper in sands now a smooth ride 
	Crouching over a grenade kills you	
	Fixed bugs that nerfed the kick
	Improved knife hit detection
	ARIES fixes: better accuracy, esp. on ladders
	Fixed netcode for LPBs
	Fixed team bandage bug that let you bandage faster if you changed weapons
	Fixed reload bug that let you reload faster
	Fixed bug that was causing CTF flags to disappear in no drop zones (ut_paradise water)
	Can shoot timed out players (999 bug)
	Dropped grenades no longer removed if you can't pick them up
	Fixed 1.31 point release intermittent freezing bug
	Made team survivor spawning more random
	Fixed a small bug that was preventing item changes after respawn on some maps
	Prevented player corpses from kicking living ones :)

Modifications:
	Increased duration of flash gren effect
	Decreased SPAS damage
	Increased M4 spread
	Crouching reduces grenade damage less
	New NVG Effect
	Improved weapon sounds
	Improved impact marks

Features:
	Smoke grenades
	Volumetric laser scope in fog and smoke
	New laser dot FX
	Instant arm mode for grenades
	Snipers now inaccurate when not zoomed
	Locked a number of potential cheat cvars
	Can save teammates by smothering grenades (crouch on them as they go off)
	Improved blood effects
	Quake 2-style CTF scoring
	Medic icon if you call for a medic
	UI for selecting team skins
	

Note on netcode
===============

The netcode in 2.4 is essentially the same netcode that Apoxol developed in an earlier 
release of Urban Terror.  While we did use the public domain code released by the Q3
anti-lagged mod, that code is very similar to the original UT code, as Apoxol and Neil
spent some time working through various issues with each other.  The result is a synthesis
of Urban Terror specific netcode (to account for ARIES) and anti-lagged mod netcode.

The main advantage in the 2.4 netcode is better calculation of latency for players with low
pings.  In other words, LPBs should see the greatest difference in accuracy in 2.4.

The netcode does *not* do hit detection on the client-side and does not affect prediction
of player positions.  What it does is calculate hit detection on the server using player
data that simulates what the client would have seen on their screen at the time they shot.

The netcode also does *not* predict impact effects.  If you fire at a wall and you have a high
ping there will still be a delay between firing and impact.  Beta 3.0 may have client side
impact effects added in as an option for those HPBs who like to pretend they have cable ;)


Beta 2.3
==============
[08.10.01]

Bugs fixed:
	- Unnecessary setting of a few cvars on ever frame
	- Fixed "bad player movement angle"

New stuff:
	- ut_alleys by BotKiller
	- ut_austria by Tub
	- ut_casa by SweetnutZ
	- ut_riyadh by dotEXE
	- ut_rommel by Bar-B-Q
	- ut_pressurezone by Gerbil!
	- ut_uptown by BattleCow
	- ut_village by Tub [updated by Legomanser and NRGizeR]
	- ut_swim [updated version]
	- ut_sands [updated version]
	- ut_abbey [updated version]


Beta 2.2
==============
[07.13.01]

Bugs fixed:
	- Invisible player bug
	- Spawning without knife bug
	- Team DM spawns further apart now
	- cg_sfxVisibleItems no longer hides your own laser or silencer or medkits
	- Fixed bug that would cause pressing reload to not work sometimes
	- Shooting cancels out your respawn protection so make your first shot count
	- cg_autoRadio now functions as originally designed
	- Extra ammo now gives 3 more shells to the hk69
	- Safety measure added to ensure kills, deaths, and times are cleared after a survivor map change
	- sv_fps now properly capped to prevent crashes at startup


Beta 2.1
==============
[07.10.01]

New stuff:
	- ut_echo command added to replace the standard echo command.
	- Added joystick option to the menus
	- Added the "dot" crosshair
	- Added grenade support to ut_weaptoggle
	- New cvar cg_autoRadio [0/1]: Disables/Enables the playing of radio messages such as "fire in the hole"
	- New cvar cg_scopeRGB [<red>,<green>,<blue>,<alpha>]: Controls the color of the inner crosshairs of the sniper
          scope, defaulted to black
	- New cvar cg_scopeFriendRGB [<red>,<green>,<blue>,<alpha>]: Controls the color of the inner-crosshairs of the sniper
          scope when over a friendly target
	- New cvar cg_zoomWrap [0/1]: Disbles/Enables wrapping when zooming. When on the zoom commands will wrap around from
          max to min and min to max
	- New cvar cg_sfxVisibleItems [0/1]: Disables/Enables visible items/weapons on players. Setting this to zero will
          increase FPS but remove visible kevlar, guns on players backs, etc.
	- New cvar g_failedVoteTime [<seconds>]: number of minutes that must pass before someone can vote after calling a failed
          vote
	- New cvar g_teamkillsForgetTime [<seconds>]: number of seconds that must pass before team kills are forgiven.
          This allows admins to control how many kills per minute for team killing is allowed.
	- New cvar g_initialWarmup [<seconds>]: number of seconds of warmup time after a new map cycles. This allows people to
          join the server before the game starts. 
	- New cvar g_flagReturnTime [<seconds>]: number of seconds before a flag returns after being dropped
	- Overhauled the ut_weaptoggle command. Now understands primary, secondary, sidearm, grenade and knife and works with a
          single parameter. 
	- Included weapon ID in the log message for hits

HK69 Tweaks:
	- Ammo lowered to 4 shells 
	- Can no longer select grenades when the hk69 is chosen
	- damage to distance ratio changed from linear to a curve
	- Grenade made larger
	- Grenade bounce sound more identifiable

Bugs fixed:
	- ARIES issues resolved
	- Bots should longer cause quake3.exe to crash
	- Players will no longer be dumped onto the spectator team during intermission
	- Helicopter should now make noise when playing online
	- Players will no longer spawn inside eachother causing them to get stuck
	- Time in scoreboard should no longer be incorrect
	- Can no longer switch teams in a survivor game to come back to life
	- Helicopter will now kill you if you stand underneath it when its landing
	- Extra scoring removed from CTF and FTL gametypes. No more scores of 150+
	- Spectating someone using NVG's should now work properly
	- cg_drawtimer 1 should now should the proper time value in survivor games
	- Leadership is no longer transferred during the round the leader dies in FTL, this prevents someone else from
          reaching the goal besides the original leader.
	- Size of greade models increased to help increase grenade visibility
	- Shooting grenades from the helicopter should now work properly
	- When spectating another player their team color should now appear in the hud rather than the players original team
          color
	- $leader now works as originally intended
	- Few death messages cleaned up to be a bit more politically correct 
	- Errors in ANTI-LAG code resolved. This should help increase successful hits when using cg_nobulletpredict 0
	- Player model no longer dissapear if you zoom in third person follow
	- Snow should now fall in swim as originally intended
	- Can now pick up weapons immediately after dropped by a dead guy (used to be a 2 second delay)
	- startorbit command was cheat protected
	- Should no longer get -1 kills for switching teams
	- Fixed the message being broadcast to the server logs
	- Player names with the "<" and ">" characters in them should now work properly
	- Zoom out command now wraps around to fully zoomed if not-zoomed when the command is issued
	- Can no longer shoot through thin walls, doors, or glass by getting close to it and shooting 
	- Can now fly around as a spectator if your the only one in the map and g_followForced is set to 1
	- Spectators in free float mode should now stop moving rather than constantly drifting really slow
	- Crouching under water no longer alters view height
	- Dashes in names now show up in the scoreboard when in 640x480
	- Scoreboard now sorted by # of kills then kill to death ratio
	- Fixed a ledge climb odditiy which would cause a studdering sort of effect when jumping at a ledge but not pressing
          forward
	- Sprinting no longer works when walking
	- In-game system menu now reports the proper state of compressed textures
	- Ghosts can no longer call votes
	- cg_drawStatus removed to ensure scoreboard is never blank
	- Can no longer press the hotkey for menu items in the gear selection that are disabled
	- Laser sight should now be alot closer to the crosshair with cg_nobulletprediction set to 0. The code was actually
          backwards which is why setting it to 1 made it better in 2.0
	- Should no longer receive the "Default_Team_Model/skin" error
	- Height in which falling damage occurs has been raised
	- Log rolling should now pad log #'s less than 1000 with zeros rather than spaces
	- Turning off ejecting shells in the menu now works properly
	- Dropping a shotgun no longer results in a loss of ammo when picked back up
	- cg_crosshairRGB, cg_crosshairFriendRGB, cg_scopeRGB, and cg_scopeFriendRBB now support commas as separators. 
	- Observers can no longer drop weapons
	- A disonnected flag carrier will no longer take the flags with them
	- View no longer pivots to show you who killed you
	- Can no longer vote for the first minute after a map cycle.
	- Movement accuracy modified to help prevent small position adjustments from destroying your accuracy
	- no longer look at you killer when your killed
	- $gametime and $roundtime can no longer be negative 
	- players on the spectator team can no follow either team when g_followenemy is set to 0
	- Can no longer select armor piercing rounds (was not intended to allow you to)
	- thrown knives, kicking, and knife hits should be easier to get now when online
	- Should no longer see a laser sight when you dont actually have one selected
	- After waiting for players to join in a survivor game the map will restart so everyone i

Beta 2.0
==============
[06.01.01]

New Stuff:
	- BRAND NEW CODE (To many new features to list, but here is a few)
	- Radar for certain gametypes.
	- Mini-Scoreboard
	- Bullets passing through glass 
	- Climbing down ladders issue 
	- Added: MP5K, M4, FlashBang, and HE Grenade, Male/Female Models
	- Implemented: New UI art, New Hit Detection system
	- ARIES hjit detection system
	- Anti Lag System


Beta 1.27
==============
[12.21.00]

Bugs fixed:
	- Urban terror 1.27 now compatible with Quake 3 Arena 1.27 point release
	- Guns tweaked for more intense gameplay
	- Shotgun issues addressed: faster reload, faster rate of fire, more damage
	- Players no longer get stuck after warmup
	- Fixed blood spurts
	- Fixed missing hit sound underwater
	- No more kicking during warmup
	- Fixed bad obituary logging (games.log)
	- Spectators can no longer use radio
	- Cant change name if not alive
	- No more pause after reload before you can shoot
	- Can now see enemies names if you put your crosshair on them
	- Weapons switch a bit faster
	- Removed q3 announcer (prepare to fight)
	- No longer lose frag when switch teams
	- New grenade explosion effects (match radius better and some smoke)
	- Grenade timer reduced (grens arm sooner)
	- Can no longer zoom while spectating
	- Dead status now shows in non-team survivor mode
	- Can no longer spectate dead people
	- Zoomfov cheat disabled
	- Can now heal your teammates again (see manual)
	- Door opening direction can now be controlled by player movement direction
	- Spectator score bug fixed
	- First round of a new map always has a 20 second warmup time to allow people to join


Beta 1.2
==============
[10.16.00]

Bugs fixed:
	Sounds:
		- Double knife sound on swing is fixed.
		- Head shot noise now plays relative to the player that got hit, not to the player who shot
		- New sounds:
			- Weapons sounds redone
			- NVGs on/off sound added
			- Laser on/off sound added
			- Vest hits sound
			- Klinks for falling shells
			- New pain sounds
			- Lots of other cool sounds

	Models:
		- Models forced to UT models only
		- Only the UT models show up for selection in the user interface
		- Hand models no longer get tossed onto the ground when you die
		- Added new "trooper" model and skins
		- Changed default teamplay models to make them more clearly different

	Teamplay:
		- Spawn in teamplay now uses standard deathmatch spawnpoints and chooses them randomly to mix up teamplay
                  games a bit
		- Only be able to kick enemies except in team damage mode (fixed)
		- Bullets should not hit team members in non-ff mode.
		- Fixed issue with frags of -1 when joining a team when the round has already started
		- Fixed display of which team won to report correctly 
		- When map cycles everyone starts game in spectator mode
		- Teammates name and health now appears in bottom right when you put your cursor on them
		- Teammates health now shows in scoreboard if they are alive
		- Capture limit now works for team survivor mode (capture limit is the number of team wins)
		- Added team wins to scoreboard
		- Moved team win message to the center of the screen
		- Fixed radios to work properly in team games

	Miscellaneous:
		- Amended arenas.txt to allow selection of UT maps
		- All command names changed to "ut_*"
		- Players can run through each other during warmup to reduce clipping problems (players getting stuck in each
                  other)
		- Frags dont reset when you manually change the map (fixed)
		- Players should not lose a frag when they die due to bleeding (fixed)
		- Spectators no longer win the game if they are there at the end of a round
		- You can fall through glass (eg: on ricochet)
		- Glass fragment sizes determined by the size of the pane being broken
		- Glass shaders added to shattered fragments for more realistic-looking fragments
		- Rotating doors now always open away from the player
		- Rotating doors no longer reverse if blocked, but continue movement when blockage is removed
		- Spectators and ghosts can now look straight down
		- Gun now dissapears and reappears correctly on ledgeclimb
		- Ghosts can now cycle though the alive players using the fire button
		- View bobing on crouch reduced
		- Crouch speed reduced
		- Intermission time now 15 seconds
		- New cleaner scoreboard look
		- Removed triangles above teammates heads
		- Removed talk bubbles above talking players heads
		- Dead players can no longer talk to alive players in team games
		- Dead players and spec players now have it indicated in their name
		- Made warmup timer flash red and yellow while counting down
		- Separated chat messages from information messages and color coded the chat messages for teams
		- Added current zoom level and fire mode to the hud, removed print messages
		- Ghosts can no longer open doors
		- Ladder speed increased
		- Ledge climb is much smoother now
		- Fixed bug that would zoom you out if you fell a little
		- Added bot support
		- Fixed time display in score for teamplay games to reflect total time
		- Selected bots highlighted in interface screen

	Weapons and Combat:
		- Made "close" range to within 4m (128 units) of player
		- Reduced and capped bleedrates
		- Weapon modifications
			- Range damage sensitivity now works on a sliding scale
			- UMP does more damage close than at range
			- G36 now does more damage at range than UMP, but less when close
			- Beretta does less damage
			- Shotgun now hurts a lot more, has decreased reload time
			- Beretta made less accurate
			- Accuracy gets worse the longer you fire weapon (bursts are better)
			- Alt fire mode does not actually decrease spread anymore (since bursts do) but you
			  still get a benefit from using it because it helps you by shooting off 1 shot (burst)
			  The new spread/fire time system makes the old way fo doing alt fire obsolete
			- Completely rewrote the recoil system
		- Reduced accuracy of sniper rifle when player is moving
		- Decreased grenade splash radius
		- Implemented new damage system
			- All hits are now reported properly (leg shots now work)
			- Headshots harder to get
			- More accurate detection of location
		- Reduced knockback on weapons
		- Grenades now arm after 2.5 seconds, explode on impact with anythign after that
		- Grenades that hit players full on do damage and knockback but do not explode
		- PSG-1 scope blacked out around the edge
		- G36 when zoomed has crosshairs like PSG1
		- Now shows the text "bandaging" on the screen while bandaging
		- Added smoke that comes out of gun barrels.  This can be turned off by turning of brass ejection
		- Now reports whether you hit someone in kevlar or not
		- Kevlar now becomes less effective the more it is shot
		- Can now reload, bandage, and change fire mode immediately after shooting
		- Weapon reload sounds and cock sounds now consitantly play
		- Weapon change animation is now alot smoother looking
		- Drop weapon (ut_drop) now works and is configurable in the bind menu
		- Bandaging can now be cancelled by pressing the fire button
		- Bandaging time is now dependent on how fast your bleeding
		- Knife no longer uses ammo when just swinging it
		- Can now select a weapon that has no ammo so you can drop it
		- Weapon selection now shows the weapon icon instead of the text
		- Knife speed increased to allow nice and fast hack and slash
		- Only 2 primary weapons can be picked up now
		- Brass now ejects from the correct location on the gun
		- Shotgun now reports hit locations and does damage properly
		- Fixed reload problem that caused it to reload instantly and not show it on the last clip

	Items:
		- Laser sight improves aim only when on
		- Night vision shaders modified to add a static effect overlay and look more realistic
		- If player disconnects with laser on the laser entity is now removed from the world

	Network:
		- Only primary weapon(s) dropped on frag to minimise network traffic (beretta and knife not dropped)
		- Fixed prediction bug that cause a delay when shooting

	Cvars:
		- Intermission time was turned into a cvar
		- Warmup time can be set through a cvar


1.2 Known Issues:
	- Console commands (including binds to opendoor, etc, which run console commands cause
	  Urban Terror to crash on Macs :(  1.3 will fix this, with the Id 1.25 point release
	- Bots sometimes get stuck if two bots are on opposite sides of a door
	- Bots don't know they can smash breakable objects
	- Round time still ticks down when waiting for players
	- sometimes players still get stuck on ledge climb
	- sometimes players still get stuck on round start


Beta 1.1
==============
[8.21.00]

Bugs fixed:
	- Sped up ump45
	- Slowed down spas
	- Slowed down psg1
	- Increased spread on spas
	- Took out delay on zoom console commands since they are all client-side
	- Allow all weapons ro reset zoom (even weapons without zoom so that zoom status can be reset on re-spawn)
	- Damage of 30 or greater from a fall causes leg damage, not 20 (as per beta 1.0)
	- Removed neck damage - adjusted other zones to compensate
	- Made psg1 sniper rifle do much more damage
	- Made the g36 do less damage
	- Made the ump45 do more damage
	- Made the spas do a bit less damage
	- Added reload time for spas shotgun and grenade launcher 
	- Made bandaging take 3.5 seconds instead of 3
	- Added a text message for bandaging and reloading
	- Made the psg1 and g36 de-zoom on reload
	- Made the psg1 and g36 de-zoom on bandage
	- Set the gameversion to q3ut in g_local.h
	- Removed delay between weapon fire and weapon reload (you can now reload right after firing)
	- Removed delay between weapon fire and bandage (you can now bandage right after firing)
	- Fixed fov (changing the var now has no effect)
	- Fixed gamespeed (the g_speed var now has no effect)
	- Removed the machinegun and gauntlet register on map load
	- Removed the machinegun default when editing your player settings (this is the weapon that the player holds on the
          left)
	- Made it so you could hear other weapons firing, even if you didnt have the weapon. (hahah, silly bug, surprised
          noone noticed!)
	- Removed the delay on triggering the firemode (bind a key to firemode for everyone who has yet to check it out)
	- Completely re-did the alternate fire modes. it now uses a click-fire system (every click, means a bullet is shot).
	- Added a text message for firemode change
	- Added a random radio sound when bandaging
	- New scoreboard
	- Single death system
	- Fixed bug in open door (crash)
	- Remove Free For All text after each round
	- Only display "XXX has entered" on the first time, not every round
	- Remove requirement to press button at intermission
	- If you join the game in singledeath mode too late, you come in dead
	- Remove the spawn effect
	- Color coded teamplay scoreboard
	- Remove the voice effects for scoreboard position
	- Remove awards
	- Ghosts and spectators are now noclip
	- Moved team select menus to normal q3 menus
	- Moved weapon select menus to normal q3 menus
	- Moved item select menus to normal q3 menus
	- Damage due to bleeding no longer jerks screen
	- Recoil adjustments (always move up)
	- No longer Shoots to the upper right of crosshair
	- Semi-automatic adjustments for prediction
	- Added underwater sounds
	- Replaced headshot sound
	- Bandolier gives 2 extra clips instead of one
	- Items start as on and activated
	- Fixed bullet hole shader in /scripts/xxbullets.script
	- Made items turn on automatically when spawning
	- Fixed tigoggles linux crash
		- Weapon animation system overhauled for more acurate animations
		- Bullets work under water
		- Knife slashing animation plays more than once now
		- No randomness on recoil
		- Made weapons on ground larger to look more realistic
		- Animations and sounds play properly on ladders

1.1 Known Issues:
	- Sometimes your weapon doesn't re-appear when bandaging. the work around is to change weapons
	- The Macintosh bug still remains


Beta 1.0
==============
[8.5.00]

- Weapons: UMP, H&K 69, Knife, Spas 12, PSG1 Sniper Rifle, Berreta, G36
- Custom maps: Hotel, Streets2, TrainYard, MBase, Swim
- Radio Commands
- Secondary Fireing Systems


Former/Inactive Frozen Sand, LLC/Silicon Ice Development Members:
========================

-Apoxol
-Bar-B-Q
-Basilisk
-BattleCow
-Bittar
-BotKiller
-CGmonkey
-CrazyButcher
-Cricel
-CrystalMesh
-Density
-DickDastardly
-Dokta8
-Dracostian
-Dragonne
-EarthQuake
-FearMe
-Flash
-Flux
-FreakStorm
-Gerbil!
-GottaBeKD
-Iain
-Jaker
-Meaty
-Miles
-NrGizer
-Odd
-Preacher
-Queenbee
-Sir Chumps
-SweetNutz
-Thaddeus
-WetWired
-.EXE
-Wu
