/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR health = 3
VAR weapon = ""
VAR bandit = false
VAR justiciar = false
VAR stone_face = false
VAR mastermind = false
VAR troubador = false
VAR gambler = false
VAR alchemist = false
VAR time = 0 // story starts in early morning
VAR names = 0

-> keep_entrance

== keep_entrance ==
You feel the bracing wind and dusty flurries gnaw at you as you make your way up the main thoroughfare of Krissenthal, towards Count Vedillan's keep. As you ascend the staircase to the veritable fortress, you hear the supports creak against the winds, barely holding up the cobbled battlements of stone and spruce. Vestiges of this city's role and plight amidst the Amalgamere War. Once you finally reach the gates, a guard speaks up. 
"State your business."
* ["The Count called for me. I know not what for."] -> meek_entrance
* ["Best skip the formalities. You should know Vedillan's expecting me."] -> aggro_entrance
-> END

== meek_entrance ==
The guards take a look at one another. "Very well," the other says. "But you'll need an escort."
The gates rumble open as another guard is called to oversee you enter Count Vedillan's main hall. You are escorted into a dimly lit mead hall with empty, dusty settings lining the long wooden table. A massive curtain obscures a great window looking out over the city's palisade and into the surrounding forest. The guard moves to one of many doors on one side of the room and knocks, announcing your arrival. Shortly after, Count Vedillan, who seems smaller in stature than you might expect of a war hero, emerges. 
-> exposition
-> END

== aggro_entrance ==
"Alright, alright," they say. "No need to get testy, you can never be too careful. Count'll deal with you if you're lying."
The gates rumble open as the other guard give you directions to the main hall of the keep, where the Count can be found. You soon wander into a dimly lit mead hall with empty, dusty settings lining the long wooden table. A massive curtain obscures a great window looking out over the city's palisade and into the surrounding forest. Vedillan isn't here to greet you, and being left unattended, you see a simple, yet sturdy looking knife stuck into the table.
* Pocket it. No one's using it anyways. -> knife
* Leave it. You don't want to get in trouble for this sort of thing. -> exposition
-> END

== knife ==
~ weapon = "Vedillan's knife"
You wrest the knife from it's mahogany hold, and stash it away mere moments before a door opens, and Count Vedillan, who looks smaller in stature than you'd expect from a war hero, enters. 
-> exposition
-> END

== exposition ==
{knife:"I thought I'd heard something.}{not knife && aggro_entrance: You keep your hands to yourself and wait patiently. A few minutes later, a door opens, and Count Vedillan, who looks smaller in stature than you'd expect from a war hero, enters. "}You're earlier than expected. I appreciate the expediency, and I apologize for the secrecy. I'll cut to the chase. I need you to run an errand for me out into the Krissenfrost Wood, to the ruined city of Cenngwith. An old family heirloom has been left there, and I'm no longer in any shape to make the expedition."
*["I accept this charge. But I'm afraid this work doesn't come free."] -> request
*["I'll need some incentive to do your dirty work old man."] -> demand
-> END

== request ==
{knife: "I should think that knife will serve you well. Consider that, as well as my allowance of your sticky fingers, an advance on your payment." -> outside|"Of course, I wouldn't expect otherwise. I know you've ventured out there before, but this upfront reward should ease your way." Vedillan approaches three stands with different items on each.}
+ {not knife} ["The Aethermaul. A hammer made of aetherium, a substance known for chanelling movement and force."] -> aethermaul
+ {not knife} ["Chaosbinder. A bow siffused with unstable arcana, that may lash out at you, but it's pandemonium will wreak greater havok on your foes."] -> chaosbinder
+ {not knife} ["And the Helm of Jareth, which silvers your tongue, and perfects your pitch. The beasts beyond the palisade are cunning, but this might help match their wit."] -> helm
-> END

== demand ==
Count Vedillan's nostrils flare, as his deep, sombre eyes darken further still. 
{knife: "Thrice you have disrespected me. You disrespect the servants of my house, that which belongs to me, and now, you all but spit in my eye. I'm afraid I cannot, will not stand for this." -> prison_ending }
"I did have some items to help guide your path. I will ignore this disrespect and still provide one as upfront compensation, but the ice you stand on wears thin."
Vedillan approaches three stands with different items on each. He ignores one on the end.
"I'm afraid you are unfit for this artifact."
+ ["The Aethermaul. A hammer made of aetherium, a substance known for chanelling movement and force."] -> aethermaul
+ ["Chaosbinder. A bow siffused with unstable arcana, that may lash out at you, but it's pandemonium will wreak greater havok on your foes."] -> chaosbinder
-> END

== aethermaul ==
~ weapon = "The Aethermaul"
You pick up the Aethermaul. You're barely able to lift the dark metallic arm at first, but as you manuveur it, you feel an almost magnetic attraction guiding your hand. -> outside
-> END

== chaosbinder ==
~ weapon = "Chaosbinder"
You pick up Chaosbinder. You feel the static energy emanating from the multiple cracked arms, with ephermal, multicolor glows pulsating within it. Despite the wear and unevenness, there is elegance in it's flaws. -> outside
-> END

== helm ==
~ weapon = "Helm of Jareth"
You don the Helm of Jareth. The maplewood crown nestles nicely over your brow, and within the silver framing of the helmet, you hear a symphony around you. Every creak of wood, every shift of a foot, every whistle of wind, comes together to compose a beautiful song. -> outside
-> END

== outside ==
{outside == 1:
You {knife: sheepishly } thank the Count, but before you leave, he leaves you one final guidance.
"My mother's journal, from when she still served as Baroness of Cenngwith. This will help you find your way there, and to identify the object I desire."
With that you leave the keep, to brave not just the oppressive winter winds, but the threats that lie in the Krissenfrost Wood. While making your way to the palisade surround the city, to descend the hill it stands atop, you hear grunts of pain down a nearby alleyway.
}
{outside > 1: The cries still ring out from the alley.}
+ Investigate. Someone could be hurt. -> alley
+ Keep walking. You've got bigger things on your plate. -> wood_entrance
-> END

== prison_ending ==
Several guards are revealed in and around the great mead hall, and your arms are seized. Despite your struggles, protests, and apologies, you are dragged away without another word, and thrown into the dungeon of Count Vedillan's keep, where you will remain for an indefinite sentence.
-> END

== alley ==
{not fight && not run && not reason2:
{weapon} at the ready, you slowly creep towards the source of distress. The utterances cease, and you whip your head around to observe your surroundings. Out of the corner of your eye, under the thin dusting of snow, you catch a patch of discoloration. Where the cold hard dirt should be, there is instead a crimson coating of blood. 
} {not fight && not run && not reason2:
You whip your head around in alarm, and are thrown off by the presence of another person approaching behind you. You're thrown off just enought you stumble backwards, narrowly missing a concealed blade coming in contact with your neck. You draw {helm: your old hatchet| {weapon}} and prepare for a fight. 
}
+ Take a swing. This brigand doesn't know who they're challenging. -> fight
+ Make a run for it. You don't want to hurt yourself on such an important job. -> run
* {helm} Stake your claim. Surely they can see reason and leave you be. -> reason1
+ {not helm} Stake your claim. Surely they can see reason and leave you be. -> reason2
-> END

== fight ==
{aethermaul:
~ bandit = true
~ names ++
The Aethermaul makes quick work of the blackguard. It feels as though you're swinging a stick around like a child playing pretend, but you jerk back to reality when it comes in impact, sending a painful jolt up your arm. Once you recover, the bandit lies on the ground, teeth scattered over the white snow, only outlined by the fresh blood, and neck past the point of no return.
You search the body for any evidence of who this stranger could be, or what they wanted. All you find is a handful of coins, and a letter describing the Count's dilemma, addressed to one "Nik". 
It didn't have to be like this. Next time, you won't be so quick to act, but for now, all you can do is move on.
Health: {health}
-> wood_entrance
}
{knife:
~ bandit = true
~ names ++
~ health --
You brought a knife to a swordfight, but you scrape by. The altercation is brief, or at least it felt that way through all the adrenaline. By the time you're back in your own senses, the bandit is on the ground, a deep, wide laceration across the abdomen.You search the body for any evidence of who this stranger could be, or what they wanted. All you find is a handful of coins, and a letter describing the Count's dilemma, addressed to one "Nik". 
It didn't have to be like this. Next time, you won't be so quick to act, but for now, all you can do is move on.
Health: {health}
-> wood_entrance
}
{run && chaosbinder:
~ bandit = true 
~ names ++
Having gained some distance and safety, you slowly draw and knock back an arrow. With a defeaning crack, and flash of light, it is released, and embeds deep within your attacker's chest with enough force to send them several feet backwards, unable to get up from a pool of their own blood.
You search the body for any evidence of who this stranger could be, or what they wanted. All you find is a handful of coins, and a letter describing the Count's dilemma, addressed to one "Nik". 
It didn't have to be like this. Next time, you won't be so quick to act, but for now, all you can do is move on.
Health: {health}
-> wood_entrance
}
You try to attack, but your {helm: old, worn hatchet| bow and arrows} can't hold their own against your attacker's much nicer looking sword.
~ health --
Health: {health}
{health == 0: -> death}
-> alley
-> END

== run ==
{chaosbinder:
You turn around and start to run. The bandit takes advantage of your back being turned, and is just that much quicker. But right as their sword would have cut you down, a burst of color shoots of the cracks of Chaosbinder. 
When your vision returns you see that blackguard on his knees, still shaking off the asssault, and you are a few feet further away. Your hands and wrist burn, but there's an oppurtunity.
-> alley
}
You turn around and start to run. The bandit takes advantage of your back being turned, and is just that much quicker.You feel pain shooting throughout your body as your back is sliced open, and everything seems to move in slow motion as your adrenaline surges you forward before it can cut too deeply.
This burst of energy is too difficult to control, and you trip over yourself but manage to stay on your feet. Still, your attacker is able to use this to catch up, and you're right back where you were, with one more cut than before.
~ health --
Health: {health}
{health == 0: -> death}
-> alley
-> END

== reason1 ==
The figure raises their sword and begins to rush you. You stand your ground, and call out to them.
"Enough. Who are you who thinks you have any business attacking me. I'm on official business of Count Vedillan, and he is not the kind of man with which you want any quarry. Move along or I cannot guarantee your safety."
Your voice resonates within the silver helm enclosing your head, and projects itself in a booming, steely manner. The bandit stops dead in his tracks, lowers his sword, and removes his face covering.
"I was told this was quick easy money. Take the job, get in with the Count, take the reward. But if this is the one being sent to do his business, I'm afraid I'm out of my depth on this one."
+ ["I'd recommend making yourself scarce, and finding yourself another occupation. Not everyone will be as understanding as me."] -> spare
+ ["I'm afraid you are. Consider this your retirement."] -> kill
-> END

== reason2 ==
{reason2 > 1:
"I've just met with the man, so believe me when I say this won't go in your favor." The bandit stops dead in his tracks, lowers his sword, and removes his face covering.
"I was told this'd be quick easy money. But I suppose he's fought in a war, and King Eaven stabbed him in the back once. Don't need to give him someone else to take it out on. I'm afraid I'm in over my head here."
}
{reason2 ==1: 
"I'm on a contract from Count Vedillan himself. Hurt me and you'll be making an enemy in a very high place."
"I know all about your little chore. Hand over what he gave you and I'll take care of it." He flicks his sword, leaving a gash in your thigh. "Next time I'll go a bit deeper."
~ health --
}
Health: {health}
{health == 0: -> death}
{reason2 == 1: -> alley}
+ {reason2 > 1}["I'd recommend making yourself scarce, and finding yourself another occupation. Not everyone will be as understanding as me."] -> spare
+ {reason2 > 1} ["I'm afraid you are. Consider this your retirement."] -> kill
-> END

== spare ==
"It ain't that easy, but I appreciate the thought. I'm meant to be moving along anyways. You ever find yourself in Gorlaed and doing business with the Ydallmyr, ask for Nik."
Nik wanders off, and you take a moment to catch your breath. That could have been worse. Much worse. And now you have a new name to carry with you on your path forward.
~ names ++
~ bandit = true
Health: {health}
->wood_entrance
-> END

== kill ==
You raise your old, chipped hatchet above your head, and it leaves your fingertips with all the force in your body. Your attacker tries to defend himself but the axe head embeds deep into his clavicle, redirecting his blocking blade into him as well. He falls back, unmoving.
You search the body for any evidence of who this stranger could be, or what they wanted. All you find is a handful of coins, and a letter describing the Count's dilemma, addressed to one "Nik". 
It didn't have to be like this. You could have asked more questions. You could have controlled your rage. You could have come up with a cooler one-liner. But for now, all you can do is move on.
~ names ++
~bandit = true
Health = {health}
->wood_entrance
-> END

== death ==
You've sustained your last blow. Your chest struggles to rise and fall like normal. You're tired, but there's more to do. You'll feel better once you catch your breath. But gods are you tired, and your legs don't want to carry you further. So your breath runs off, with everything you had left to say. All that's left is to close your eyes, talk to the King of Dreams, and his sister, Death Herself.
-> END

== wood_entrance ==
   You keep on forward, eventually reaching the treeline at the foot of the hill, armed, and ready for what happens next.
   The barren, gnarled mass of trees and branches looms before you. The pathways that once were well-trodden has fallen into disuse, and is covered by a fresh blanket of snow. How will you proceed?
   * Try to ascertain your position. You have a specific destination that demands haste. -> journal
   * Just start walking. You've been here before, as long as you know the general direction you'll find something worth finding. -> explore
   -> END
   + {not bandit} Your conscious gets the better of you. Go back to the alley. -> outside
-> END

== journal ==
{advance_time()}
    {journal ==1:Using the Baroness' journalings, you have a rough guide in these woods. While trudging through the rising snow piles, head down buried in the journal, you notice a disurbance in the perfect white sheet below. One you don't believe was you. It looks to be bootprints, and large ones at that, veering off in another direction. }
    {journal > 1: You're back to where your tracks end, and the stranger's begin.}
    + Follow them. Another traveller could have something to offer. -> prints
    + Keep walking. No one else could be in these conditions, you must've gotten distracted and made a circle. -> keep_walking
-> END

== explore ==
{advance_time()}
    {not prints && explore == 1: Your gut's never failed you before. Intuition as your guide, you forge your own path, just as you've always done. While you are appropriately dressed for this kind of environment, nothing is stopping your entire face from feeling numb, and yet amidst this, your nose tingles. As your struggle to get a hold of your senses, you think you smell smoke. Looking around it doesn't take you long to find a small hut with a thatched roof, and smoke from a wood-burning stove emanating from a chimney.}
    {prints: It isn't difficult to follow the trail of black, foul smelling goop, and soon enough you find yourself standing before a small hut with a thatched roof, boarded up windows, and smoke from a wood-burning stove emanating from a chimney.}
    {explore > 1: The cabin is still there, it's door still open to your stay.}
    + Try knocking. The tenant could be perfectly agreeable and friendly. If not, it's your fault for arriving unannounced. -> cabin
    + Leave it be. Nothing in these woods is to be trusted. -> keep_walking
-> END

== cabin ==
{advance_time()}
    {You approach, and confindently leave a few raps on the thick wooden door. A beat of silence passes before the door slowly creaks open. The lack of sunlight in the hut makes it very poorly lit, but you can make out a tall, lanky figure in the narrow opening. They inhale through their nose for a moment, as if they're smelling you, before they open their mouth, revealing perfect, glinting white teeth.| }
    {names == 0: "You bring no names to offer," they say before closing the door. You stand there for a while in shock, wondering what that could mean. You have names. You yourself have a name. Though, now that you think about it, it's been a while since it was used. You're not sure if you can even remember it. No matter, you're not here for names anyways. -> keep_walking}
    {"It's been some time since I had a new player visit my abode," they say in a raspy drawl. "You may enter if you please." The figure disappears beyond the dim candlelight with the door still left ajar.| }
    { |The door is still ajar, though you can only peer into darkness.}
    + Accept his invitation. He said player, and entertainment would be very welcome right now. -> interior
    + You've deviated enough, it's time to find your destination. -> explore
    
-> END

== interior ==
    As soon as you enter, before your eyes adjust to the darkness, the figure flies in from out of view and snaps the door shut with a dull thud.
    "I'm glad to see you took me up on my offer. Sit, let us play," he says, gesturing to a table at the center of the cabin. It's certainly cozy in here, not even a bed in sight. The walls are lined with wardrobes, armoirs, and shelves stacked with musty books and scrolls, as well as the occasional display jar. 
    In the dim candlelight you look up at your host. His eyes are bloodred, whose gaze seems to see straight through you. 
    "Play what?" you ask.
    "Southdweller's Gambit of course. You did agree to such the moment you crossed my threshold," he says, lips curling to reveal his glimmering canines. You take your seat.
    {names == 1: "You only have one name to offer, but it is enough. {bandit: I see you bring 'The Bandit'. He will be a worthy addition, should I win fairly of course.} {stone_face: I see you bring me 'Stone Face'. I would have her in my collection soon enough but I suppose it will do.} For this I can grant you the name of 'The Mastermind'. A a devilish criminal from  Ferri who thought he could outsmart the likes of me. Should you win his name belongs to you."}
    {names == 2: {justiciar: "I see you bring not only the title 'Stone Face', but also the true name of 'The Justiciar'. Though it is one soul, it will carry more weight here.| "You bring me two names, that of 'The Bandit' and 'Stone Face'. I would have had Stone Face soon enough, but still I will match your ante.} In return for these names, I offer 'The Mastermind', a devilish criminal from  Ferri who thought he could outsmart the likes of me, and 'The Troubador', a lyricist who in looking for her way home, found a new one here. Poetic isn't it?"}
    {names == 3: "You have quite the collection with you. Both the title of 'Stone Face' and the true name of 'The Justiciar' carry a greater weight for a singular soul. For these and 'The Bandit', I offer 'The Mastermind', a devilish criminal from  Ferri who thought he could outsmart the likes of me, and 'The Troubador', a lyricist who in looking for her way home, found a new one here. Poetic isn't it? Lastly, I offer you my own name," he holds up a card. "I of course have no recollection of it, much like you, but I carry it, and all that I am, right here."}
    -> bet
-> END

== bet ==
     {!"Now then, shall we play?"| }
     {! You have no clue what game you signed up for, or what he's talking about with all these names. But you get the sense there's not backing out, and it's imperative to command some power of the situation by displaying no weakness or confusion.| }
    VAR ante = -0
    * {bandit} ["I offer the name of 'The Bandit'."] 
    ~ ante ++
    VAR bandit_bet = true
    -> bet
    * {stone_face} [" I offer the title of 'Stone Face'."]
    ~ ante ++
    VAR stone_bet = true
    -> bet
    * {justiciar} ["I offer the name of 'The Justiciar'."]
    ~ ante ++
    VAR justiciar_bet = true
    -> bet
    * {ante > 0} ["This is all I will bet."] -> play
-> END

== play ==
    "A worthy gamble. I normally prefer a much more involved game, but we've both put something fairly significant on the line, not to mention the fact that you clearly have no clue what's going on, which I suppose is my fault. Still, we will even the odds. Fifty-fifty chance both ways, all or nothing."
    You have no choice but to nod. "Very well," you say, gravely. The Gambler grins wider still, and holds up an old copper coin. Must be outdated currency, considering most coins in the Krissenfrost and Merildell areas are silver. 
    "Heads," he motions to himself. "Tails," he motions to you, a look of hunger set in those brillian eyes. The Gambler flips the coin. It flies into the air, seemingly spinning in slow motion, over and over and over again. With a ping it hits the table, continuing to spin.
    "Not as engaging, but the risk does make it fun doesn't it?" he asks, failing to hide his eagerness.
    Heads, tails, heads, heads, tails...
    {~Heads. -> lose|Tails. -> win}
-> END

== win ==
{ante == 1: 
~ mastermind = true
~ names ++
The Gambler stares at the coin's face with apparent shock. He slowly turns his piercing gaze up to meet yours. He forces a smile, bitterness dripping from his unsatiated fangs. 
 "I believe you've earned this," he hisses. A card has now materialized on the table, depicting a well-dressed devil. You collect your earning and place it in your pack, along with another card bearing a familiar face. You're not sure when that got there.
 {advance_time()}
 You leave The Gambler's cabin with more questions than before, but you have learned one thing, and one thing for sure. Names carry weight. Meaning, value, however you wish to call it. You make note of this cabin's location. The Gambler used names to assert control, perhaps you can come back and continue to build your own collection, build something new from his, or perhaps you can take his place.
 ->keep_walking
}
{ante == 2:
~ mastermind = true
~ troubador = true
~ names += 2
 The Gambler stares at the coin's face with apparent shock. He slowly turns his piercing gaze up to meet yours. He forces a smile, bitterness dripping from his unsatiated fangs. 
 "I believe you've earned these," he hisses. Two cards are now materialized on the table, depicting a well-dressed devil, and an exhausted bard. You collect your earnings and place them in your pack, along with two more cards bearing familiar faces. You're not sure when those got there.
 {advance_time()}
 You leave The Gambler's cabin with more questions than before, but you have learned one thing, and one thing for sure. Names carry weight. Meaning, value, however you wish to call it. You make note of this cabin's location. The Gambler used names to assert control, perhaps you can come back and continue to build your own collection, build something new from his, or perhaps you can take his place.
 -> keep_walking
}
{ante == 3:
~ gambler = true
~ mastermind = true
~ troubador = true
~ names += 3
    The Gambler stares at the coin's face with apparent shock. He slowly turns his piercing gaze up to meet yours. He smiles, for the final time, though this one carries no malice, no teasing trickery hidden behind his fangs.
    "I have always wondered what it would be like to be the one looking from the inside," he whispers. And with that he disappears, fading into mist. Three cards are now materialized on the table, depicting a well-dressed devil, an exhausted bard, and a vampiric hermit. You collect your earnings and place them in your pack, along with three more cards bearing familiar faces. You're not sure when those got there.
    {advance_time()}
    You leave The Gambler's cabin with more questions than before, but you have learned one thing, and one thing for sure. Names carry weight. Meaning, value, however you wish to call it. You make note of this cabin's location. The Gambler used names to assert control, perhaps you can return to build something new from his collection, or perhaps you can take his place.
    -> keep_walking
}
-> END

== lose ==
    The Gambler stares at the coin's face with apparent glee. He turns his piercing gaze up to meet yours. He smiles, hunger dripping from his perfect teeth.
    "Always a good day when {ante==1: a} new name<> {ante>1:s} {ante==1:is|are} added to my collection. Your gambit has not paid off today, but my door always open should you wish to try your luck again."
    The Gambler's hands and finely manicured, sharp fingernails extend to the table to collect his earnings. He sweeps up {ante==1:a}{ante==2:two}{ante==3:three} cards, {ante>1:all} depicing {ante==1:a} face {ante>1:<>s} you could've sworn you recognized.
    {advance_time()}
    You leave The Gambler's cabin with more questions than before, but you have learned one thing, and one thing for sure. Names carry weight. Meaning, value, however you wish to call it. You make note of this cabin's location. The Gambler used names to assert control, perhaps you can come back and rebuild your own collection, build something new from his, or perhaps you can take his place.
    -> keep_walking
{bandit_bet:
~ bandit = false
~ names --
}
{stone_bet:
~ stone_face = false
~ names --
}
{justiciar_bet:
~ justiciar = false
~ names --
}
-> END

== prints ==
{advance_time()}
    {prints == 1 :
    You set off for wherever this mystery person's trail leads. You move as quickly as you can, as the tracks don't seem fresh and the snowfall quickly becoming a full-blown blizzard. The further you go, the more defined the prints become. It looks as if this figure is wearing a suit of armor, or at leave grieves given the shape, and the fact that you're now outpacing them.
    Eventually, you manage to catch up to the source of the tracks. Back towards you, leaned up against a tree, you can make out weathered plate armor under a tattered traveller's cloak and hood. A closer look reveals that it was no trick of perspective, they are in fact twice the size even the most domineering human. It sounds as if they're muttering something to themself.
    }
    {prints > 1: They're right where you left them.}
    + Take them out quietly. Madness is common to travellers of Krissenfrost, best to put them out of their misery. -> sneak
    + Call out. They could need help, and maybe offer some in return. -> call
    + Leave them to it. Everyone for themself in these woods. -> journal
-> END

== sneak ==
VAR steps = -1
~steps++
{steps > 2: 
    Still facing away, the stranger does not hear your approach. You ready your weapon, but in the second before you strike, the armored-clad figure hears your shifting and turns to look at you. There is ferosity in their eyes. Bloodlust. But also a primal fear in which they are borne. -> down
}
{chaosbinder: You raise your bow and knock back an arrow. Slowly taking, aim, you fire. The arrow thuds in their back, through the cold, brittle metal plating, and the body falls with a clang.-> keep_walking}
You slowly take a step towards them.
{~Your foot steadily plants into the snow, which was obsuring a dead branch beneath it. It snaps, and their head jerks towards you.-> seen| You silently plant your foot in the snow.-> sneak| You silently plant your foot into the snow.-> sneak| You silently plant your foot in the snow.-> sneak| You silently plant your foot into the snow.-> sneak}
-> END

== call ==
{advance_time()}
    "Excuse me! I-is everything alright?" you shout. The large head turns to look at you, a look of ferocity in these animalistic eyes, attached to a face of dark silver scales, and a draconic maw. What you now recognize to be a drakefolk turns to you.
    "Are you one of them?" she growls.
    "One of what?"
    "Don't play dumb with me! I've met two-faced backstabbers at every turn, you're no different."
    "Look," you slowly place your weapon on the ground and raise your hands. "I'm here to help. But you need to tell me what's wrong. How about you start with your name?"
    The drakekin huffs and snorts. "Stone Face."
    "Alright Stone Face, who are these people you speak of?"
    "Not people, things, his pets. They burrow into you, he likes to take us like collectibles. One of them got me, and it means to take me to where he can display me."
    "Maybe I can get it out for you."
    "How?"
    ~ stone_face = true
    * [I have a very steady hand, I'll try to cut it out.] -> surgery
    * [Maybe if I knock you out, it'll get scared and leave. Parasites don't stick with dead hosts.] -> knock
    * [I read a book on wizardy once, I bet I could banish it.] -> banish
    * [I'll coax it out. Even animals can recognize a sweet voice.] -> coax
-> END

== surgery ==
    {knife: 
    ~names +=2
    ~ justiciar = true
        You show Stone Face Vedillan's knife. She seems hesitant but given her other options, nods. 
        "I felt it seep in here," she says, turning around and tapping her left shoulder blade. You move the cloak aside, remove pieces of the plate armor, and begin to make an incision. A black liquid begins to ooze out, and the further you go, the more violently this liquid reacts. You continue to drag the blade, deepening the incision slightly, before Stone Face roars, and says,
        "Bury the blade!"
        You do as she says and she roars again, as more of the liquid is forced from her back, until a creature is formed from her maligned blood that slithers from her body. With a single beat of her massive wings which throws you back a few paces, her possessor is fully forced out, as it writhes away across the driven snow.
        "Jawrick," Stone Face says, panting.
        "What?" you respond as you stand up.
        "My true name is Sullia Jawrick. Let that be of some help to you."
        She beats her wings once more, and when you look again, is gone. All that's left is black much trailing off in another direction. You suppose a name is nice, but you could've done with something like magical armor too.
    }
    {not knife:
    ~names++
        You show Stone Face {helm: your old hatchet| {weapon}}. She growls.
        "Surgery with that? You do mean to kill me!"
       Before you can get another word out, she unfurls her wings, and rushes you. You prepare for the worst, lacerations spanning your torso, deep enough to reach bone, flayed skin from her demolishing breath, but instead all you feel is impact. You are thrown backwards into a tree, and by the time you recover, still dazed, Stone Face is long gone. {aggro_entrance: Perhaps if you had stolen that knife when you had the chance, this could have turned out differently.}
        ~ health --
        Health: {health}
    }
        * {knife} Follow the monster. Whatever this thing is should be dealt with before it does more damage. -> cabin
        * Return to your path. This detour took long enough -> keep_walking
    
-> END

== knock ==
{aethermaul:
    ~names+=2
    ~ justiciar = true
    You hold up The Aethermaul. She seems hesitant, but given her other options, nods. You bring the face of the hammer close to her head, the light magnetic force tugging towards her skull. You draw it back just slightly, and strike. The kinetic pull of aetherium, which normally enhances the power of your strikes, offers more control, as if lightly thuds into her head, and she crumples unconscious.
    As she lays on the ground, Stone Face start to convulse. Her pupils take over the whole of her reptilian eyes and every orifice begins to ooze that same black liquid, until it eventually conglomerates and slithers away. The drakefolk coughs and sits up.
    "Jawrick," Stone Face says, rubbing her head and standing back up.
    "What?"
    "My true name is Sullia Jawrick. Let that be of some help to you."
    She beats her wings once more, and when you look again, is gone. All that's left is black much trailing off in another direction. You suppose a name is nice, but you could've done with something like magical armor too.
}
{not aethermaul:
~names++
        You show Stone Face {helm: your old hatchet| {weapon}}. She growls.
        "Knock me out with that? You do mean to kill me!"
        Before you can get another word out, she unfurls her wings, and rushes you. You prepare for the worst, lacerations spanning your torso, deep enough to reach bone, flayed skin from her demolishing breath, but instead all you feel is impact. You are thrown backwards into a tree, and by the time you recover, still dazed, Stone Face is long gone. Perhaps if you had a greater control over your force with The Aethermaul, this could have gone differently.
        ~ health --
        Health: {health}
}
    * {aethermaul} Follow the monster. Whatever this thing is should be dealt with before it does more damage. -> cabin
    * Return to your path. This detour took long enough -> keep_walking
-> END

== banish ==
{chaosbinder:
~names+=2
~ justiciar = true
    You show the unstable arcana chanelled within Chaosbinder. She seems hesitant, but given her other options, nods. You knock back a blunt arrowhead, and take aim, trying to control the spontaneous energy of your bow. With a deep breath you release. The bowstring snaps with a multi-colored flash, your hands feel a burning sensation, and you are pushed back. For a moment it seems to have failed, but the spot where it impacted Stone Face glows white, her mouth opens, and her head shoots back. A black ooze flies from her mouth, taking the shape of a serpentine creature, before it slithers away.
    "Jawrick," Stone Face says, panting.
    "What?" you respond as you stand up.
    "My true name is Sullia Jawrick. Let that be of some help to you."
    She beats her wings once more, and when you look again, is gone. All that's left is black much trailing off in another direction. You suppose a name is nice, but you could've done with something like magical armor too.
}
{not chaosbinder:
~names++
     You show Stone Face {helm: your old hatchet| {weapon}}. She growls.
    "Banish it with that? You do mean to kill me!"
    Before you can get another word out, she unfurls her wings, and rushes you. You prepare for the worst, lacerations spanning your torso, deep enough to reach bone, flayed skin from her demolishing breath, but instead all you feel is impact. You are thrown backwards into a tree, and by the time you recover, still dazed, Stone Face is long gone. Perhaps if you were able to channel the magic of Chaosbinder, this could have turned out differently.
        ~ health --
        Health: {health}
}
    * {chaosbinder} Follow the monster. Whatever this thing is should be dealt with before it does more damage. -> cabin
    * Return to your path. This detour took long enough -> keep_walking
-> END

== coax ==
{helm:
~names+=2
~ justiciar = true
    You tap the Helm of Jareth, and before Stone Face can express her concern or confusion, you allow your voice to fill the space around you, which before only held empty, silent cold. Something, perhaps even someone else takes over, and you utter a string of phrases in a tongue you've could never recognize. Stone Face, still perplexed, suddenly lurches over, grasping her stomach. With a roar, a profuse stream of dark, brackish spews from her mouth. Stone Face collapses, and the ooze congomerates into a singular form, and slithers away.
    "Jawrick," Stone Face says, panting, rising to her feet from fetal position.
    "What?"
    "My true name is Sullia Jawrick. Let that be of some help to you."
    She beats her wings once more, and when you look again, is gone. All that's left is black much trailing off in another direction. You suppose a name is nice, but you could've done with something like magical armor too.
}
{not helm:
~names++
    You show Stone Face {helm: your old hatchet| {weapon}}. She growls.
    "Convince this thing? With that? You do mean to kill me!"
    Before you can get another word out, she unfurls her wings, and rushes you. You prepare for the worst, lacerations spanning your torso, deep enough to reach bone, flayed skin from her demolishing breath, but instead all you feel is impact. You are thrown backwards into a tree, and by the time you recover, still dazed, Stone Face is long gone. {demand: Perhaps had you not been so rude to the Count, you could have used that helm for a different outcome| Perhaps if you had the Helm of Jareth to guide your voice and silver your tongue, this could have turned out differently.}
        ~ health --
        Health: {health}
}
    * {helm} Follow the monster. Whatever this thing is should be dealt with before it does more damage. -> cabin
    * Return to your path. This detour took long enough -> keep_walking
-> END

== seen ==
{advance_time()}
    You look into wild, ferocious reptilian eyes, attached to a face of dark silver scales, and a draconic maw. What you now recognize to be a drakefolk turns to you.
    "You're one of them," she growls.
    "One of what?"
    "You mean to kill me."
    "Wait-"
    "You will not take me!"
    You prepare yourself for a fight, but the drakekin unfurls two great wings, and with wind whipping all around you, takes off with a thudding impact against the ground you stand on.
    * Return to your path. This detour took long enough -> keep_walking
-> END

== down ==
* Knock them out. Maybe they can be helped. -> spare2
* There's no coming back from this. Best to put them down. -> kill2
-> END

== spare2 ==
    You manage to redirect the trajectory of your blow, instead striking with the hilt of {not helm: weapon| your axe}. The strike lands directly in the side of their temple, and they collapse immediately after. As they lay on the ground, they start to convulse. You now see a face of dark silver scales and an elongated maw that spits a brackish liquid at you. Their pupils take over the whole of their reptilian eyes and every orifice begins to ooze that same black liquid, until it eventually conglomerates and slithers away. The drakefolk coughs and sits up.
    "Nasty creep. Left me with nothing but a headache and this gunk," she says, spitting more of the viscous liquid and holding a clawed hand to her forehead. "I suppose thanks are in order, as much as if pains me to say it. I don't talk to much of anyone anymore but when I did they called me Stone Face."
    "Seeing as I did just save you from a fate worse than death I think I deserve more than a moniker, Stone Face." She sneers, snoorts, and spits again.
    "Sullia Jawrick. Like I said, no one around to call me that anymore, I don't intend on changing that."
    "Very well," you say. "Where will you be taking yourself and that name then?"
    "These trees bear connections to beings greater than you and I. Let them inform you, I think I've shown my gratitude enough to keep you out of my business. Thanks again stranger."
    And with that Jawrick, Stone Face, spits once more, and unfurls two great wings beneath the cloak, and takes off. You focus on the spot where she last spit and see the same liquid from that thing, if you can even call it that, leading in another direction.
    ~ names += 2
    ~ justiciar = true
    ~ stone_face = true
    * Follow it. Whatever this thing is should be dealt with before it does more damage. -> cabin
    * Return to your path. This detour took long enough -> keep_walking
->END

== kill2 ==
    {not aethermaul: You plant your blade into the stranger, who you now see bears dark, silvery scales. They put of more resistance than skin, but still it buries deep. The drakekin cries out in pain, but you drag the blade even further, spilling dark, brackish blood across the driven snow, and soon enough the wails silence, and they fall.|What you see now to be skin of dark silvery scales puts up little resistance to your hammer, as all but shatters the drakekin with a resounding clang and green flash.} 
    You stand, taking a moment to admire the feat of bringing down a creature of this size, but after only a few seconds, the body starts writhing. The blood that was still slowly pooling around her began to spew every which way, until you realize it was not blood at all, but a living ooze that forms into one shape and slithers off, leaving a trail of its own much behind it.
    * Follow it. Whatever this thing is should be dealt with before it does more damage. -> cabin
    * Return to your path. This detour took long enough -> keep_walking
-> END

== keep_walking ==
{advance_time()}
    You do your best to put all of that out of your mind and remain focused on your task. You look ahead and simply keep moving in that direction, where hopefully soon, you'll come across the ruins of Cenngwith. A considerable amount of trudging through ever-rising snow passes, step after step after step. Through all of your gear you still feel the numbness of the cutting winter storm set in, and after walking in isolation for so long, you feel your mind begin to numb as well.
    You remain in this trance for an indefinite amount of time, until you are snapped back to reality by the sound of a goat bleating. You come to your senses, looking around, unsure how long it's been. {advance_time()}
    You look down, and sure enough, there stands a goat with long, shaggy fur. It bleats again. Surrounding it is a lean-to shelter, a few tables littered with all manner of flasks, bottles, vials, plants, distilling devices. You get the picture. You look down at the goat one more time. Once again, it bleats.
    Standing out of one of the tables is a flask containing an opaque muddy liquid, and a small sign before it that reads "Drink me".
    * Drink the flask. It did ask, though a "please" wouldn't hurt. -> drink
    * Absolutely not. Goodbye goat. -> cenngwith
-> END

== drink ==
    {You uncork the flask and knock it back. As soon as it hits your stomach you start feeling queasy. You feel slightly lighter than before, and the trees around you start dancing. Next thing you know you're flat on your back, with a voice speaking in your ear.|}
    {"Don't worry this is a pretty normal reaction. I assume, you're actually the first person to drink from a random bottle you found in a forest."|}
    {You look around for the source of the voice, but you're still alone here, with the exception of the goat.|}
    {"Oh, right, it's not normal for goats to talk to you guys either. Sorry, this is all pretty new to me," the goat says. Yes the goat said that. You saw the mouth moving and everything.|}
    * ["What's going on? Who are you?"] "Two very loaded questions. Long story short, you drank a potion that allowed you to understand me. As for the latter, I'm a goat. We don't need to exchange names, everythings always about names." -> drink
    * [{ |"What do you mean?"}] "You must not be from around here. Names are highly important to the intelligent creatures of the Krissenfrost Wood. Each name you carry connects you to the roots of the trees that run deeper than any family's bloodlines. As for you, it appears you have {names} name{names!=1:<>s<>}." -> drink
    + ["Can you just point me in the direction of Cenngwith? I must be on my way."] -> cenngwith
-> END

== cenngwith ==
    "Oh of course. So you're gonna wanna go down that-a-way, and once you see the snow-covered tree, turn left, and once you see the snow-covered rock, turn right, and boom. That easy," the goat answers.
    That's exceedingly unhelpful but then again it is a talking goat, so you're willing to give it a pass. You thank it for the guidance and continue on your way.
    {advance_time()} You do your best to follow the general direction the goat gave, and to your astonishment, it might actually be working. The thickets become less sparse, the vegetation maybe a bit more robust. 
    The rock advice was sound though, you soon discover, as you come across a hunk of earth jutting out from the ground, and looking right, you see a dilapidated archway standing before a settlement, reclaimed by the elements. You have arrived at Cenngwith, Grove of the Ruined Matron.
    You refer to the Baroness' journal for where to find the heirloom, and waltz through the front gate. You walk past the buildings that have been lost to time, and as you're trying to figure everything out so you can be done out here, you feel an impact at your side. You look down a see a young girl, who clearly wasn't paying attention to environment either, shaking herself off as she gets up from the ground.
    "Sorry stranger! I didn't see you there. Mama always says I need to be more careful, but mama's not here right now," she says. Her skin looks pallid, almost sickly, and and stares up at with with stark, icy blue eyes. 
    "Where is your mother? What are you doing here?"
    "She's back home, in Torenvacht! I don't remember when I got here, but it's really pretty, and everyone around here is really nice," she exclaims. 
    "And just who else around here have you met?"
    "Lots of people! At home we get a lot of rain, but never this many trees! They're not as green, but that's ok, I've meet a lot of them, and I'm trying really hard to remember names," she says, rambling almost faster than your ears can pick up.
    * ["Speaking of names, what's yours?"] "Ughhhhhh I don't knowwwwwww!" she whines. "Everyone keeps asking me that but I don't remember!" -> ending
    * ["Well do you think any of the trees can tell me where I can find a locket around? At least I think it's a locket. It belongs to... an old family friend."] "Have you tried asking them yourself? They don't get to talk a lot either so I'm sure they'd tell you if they do know," she says. -> ending
-> END

== ending ==
{names==0:
The girl then tilts her head at you.
"You don't even have a single name. That's not good. The trees won't like that. That means you don't care about others," she explains, averting her gaze downward.
"That's not true at all! I know names, I've met plenty of people," you retort.
"The trees are smart but they're not that smart. And and also, it's not just people you meet on the street. It's someone you have more of a relationship to. But not like a kissing dating relationship.
"What do I do then?" you ask.
"I don't think there's a lot you can do. You probably won't be able to find your way home anymore," she looks down again. "Mama says I shouldn't talk to strangers. Sorry."
The girl runs off. You try to follow but as soon as she leaves your sight she's vanished without a trace. You look around, but are met only with the blank stares of the barren trees.
-> END
} {names < 3:
The girl then tilts her head at you.
"It doesn't look like you have a lot of names, but that's ok. Your friends seem interesting though. {justiciar: I really wanna meet 'The Justiciar'. She even has a nickname too, those ones are reaaallly interesting.| 'The Bandit' sounds kinda scary but I bet he's really nice. 'Stone Face' sounds cool though. I'd love to know her true name.}
"Anyways, I'm gonna go make some other new friends now. You should try too!" the girl chirps, before skipping off. You try to follow but once she leaves your view she vanishes without a trace. You look around. 
Your gaze focuses on this one tree, barren like all the others. It's become one with an old house, shooting through the caved in roof and out broken windows. You feel as if there's a familiar image in this tree. You quietly ask for it's name. The wind whistles through the silence. This tree is the memory of Cenngwith, and the memory of Cenngwith is this tree. You remember all those who you met along the way. You remember Count Vedillan, and his history as the Stalwart of Krissenthal. For the first time since you departed Krissenthal, you rest in the memory of all this, before returning the Count an heirloom of his own.
-> END
} 
{names < 6:
The girl then tilts her head at you.
"You have a good number of names though. You'll get on well with the trees. I feel like I've met 'The Mastermind' before. Maybe even 'The Troubador' too. I've always been good at music. Anyways, if you see them, please tell them Sasha says hi!" she says, and starts to skip off.
"Wait!" she gasps. "That was my name! I knew I knew it. Glad I remembered though, thanks stranger, and thank you Mr. Mastermind and Ms. Troubador. Names certainly aren't things you wanna forget. They're small, but they're a lot of who we are. They're like their own little memories. Bye!" 
With that, Sasha skips off. You try to follow but once she leaves your view she vanishes without a trace. You look around. 
Your gaze focuses on this one tree, barren like all the others. It's become one with an old house, shooting through the caved in roof and out broken windows. You feel as if there's a familiar image in this tree. You quietly ask for it's name. The wind whistles through the silence. This tree is the memory of Cenngwith, and the memory of Cenngwith is this tree. You remember all those who you met along the way. You remember Count Vedillan, and his history as the Stalwart of Krissenthal. For the first time since you departed Krissenthal, you rest in the memory of all this, before returning the Count an heirloom of his own.
-> END
}
"You have a lot of names! You'll get on really easy with the trees then. They tell me that 'The Gambler' is really mean though. But I guess not everyone you know is your friend. I hope he's not your friend," says the girl. She looks pensive for a moment, before snapping back to her jovial demeanor.
"I feel like I've met 'The Mastermind' before. Maybe even 'The Troubador' too. I've always been good at music. Anyways, if you see them, please tell them Sasha says hi!" she says, and starts to skip off.
"Wait!" she gasps. "That was my name! I knew I knew it. Glad I remembered though, thanks stranger, and thank you Mr. Mastermind and Ms. Troubador. Names certainly aren't things you wanna forget. They're small, but they're a lot of who we are. They're like their own little memories. Bye!" 
With that, Sasha skips off. You try to follow but once she leaves your view she vanishes without a trace. You look around. Your gaze focuses on this one tree, barren like all the others. It's become one with an old house, shooting through the caved in roof and out broken windows. You feel as if there's a familiar image in this tree. You quietly ask for it's name. The wind whistles through the silence. This tree is the memory of Cenngwith, and the memory of Cenngwith is this tree. You remember all those who you met along the way. You remember Count Vedillan, and his history as the Stalwart of Krissenthal. For the first time since you departed Krissenthal, you rest in the memory of all this, before returning the Count an heirloom of his own.
In this quiet moment, one final thought crosses your mind. You still know not your own name. Perhaps you never had one. But names are not given to us, nor do we choose them. They just are. So with that being said, what is your name?
-> END

== function advance_time ==
~ time ++

{
- time == 0:
    ~ return "The sun begins to rise. It is the dawn of a new day."
- time == 1:
    ~ return "The sun continues to climb the greying expanse above, offering some respite from the biting cold."
- time == 2:
    ~ return "The sun reaches it's apex. Even with all the light flooding the snow-covered forest, you feel as if you are too far to feel it's warmth."
- time == 3:
    ~ return "Hues of roses and clementines paint the skyline. The wind picks up slightly, as if it's running from something."
- time == 4:
    ~ return "The soft claws of darkness take hold around you. It's almost peaceful. Were that it stayed as such."
- time == 5:
    ~ time = 0
    ~ return "The woods are hollow, the only voice that dares speak is that of the moon, The Divining Torch of the Night."
}