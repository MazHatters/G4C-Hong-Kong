                                            randomise();

// Set base resolution for GUI scaling
base_gui_width = 1280;
base_gui_height = 720;
display_set_gui_size(base_gui_width, base_gui_height);

// --- NPC IDENTITY DATABASE ---
npc_master_list = 
[
	{name: "Mr. Deepwater Profit", dialogue1: "Hey Pal, I wanna 'borrow' some cash for offshore oil drilling.", dialogue2: "Just a small dent in the wallet, if ya know what I mean.", dialogue3: "The ocean is just a giant bowl of soup, and I found the black noodles.", approve: "That's the spirit, chum! Let the black gold flow.", reject: "Fine, I don't need your money. Stay thirsty, Prime Minister.", skip: "Tick tock, PM. The oil isn't going to pump itself.", sprite: sMr_deep_water_profit, gain: 200, lost: -50},
	{name: "Chad Ecovision tm", dialogue1: "Yoo- you should totally build your own infinity pool.", dialogue2: "All the cool billionaires have one. It's a total vibe.", dialogue3: "We'll just pave over the turtle nests. They can't swim anyway.", approve: "AW DANGIT! (The pool leaked into the subway. Massive structural repairs needed).", reject: "Well screw you, I'll just find some other rich idiots.", skip: "Taking a rain check on the vibe? Harsh.", sprite: sGigachad, gain: -250, lost: 50},
	{name: "Synergy Sam", dialogue1: "YOU WILL GIVE ME MONEY! I'LL GET UNLIMITED POWER!", dialogue2: "I'LL PLUG A TOASTER INTO THE VOLCANO!", dialogue3: "THE EARTHQUAKES ARE JUST THE SOUND OF MY ASCENSION!", approve: "YES! ALL THE FUEL IS MINE! (The city power grid exploded. Massive repair costs).", reject: "My powers... are fading into bankruptcy...", skip: "YOU CANNOT DELAY THE INEVITABLE ASCENSION!", sprite: sSynergy_sam, gain: -400, lost: -100},
	{name: "Tim Burr, CEO", dialogue1: "Hey Min-man, I need some cash to throw at trees. Literally.", dialogue2: "I want to shave the mountain bald and sell the hair.", dialogue3: "Who needs oxygen when you can have a private jet?", approve: "I knew you were cool. Timber! I love the sound of falling wood.", reject: "How bland. What's the point of having money if you won't spend it?", skip: "I'll go sharpen my axe while you think it over.", sprite: sTim_burr, gain: 150, lost: -100},
	{name: "Captain Overcatch", dialogue1: "ALL THE FISH WILL BE MINE! I WILL PURIFY THE WATERS!", dialogue2: "THERE'S TOO MANY FISH, IT'S CROWDED! I'LL SCOOP THEM UP!", dialogue3: "AWAITING ORDERS TO STRIP THE SEABED CLEAN!", approve: "Zero fish left behind. Hook, line, and sinker!", reject: "The fish will be the end of us all... you'll see!", skip: "THE NETS ARE WAITING. DON'T BE LATE!", sprite: sCaptain_overcatch, gain: 150, lost: -50},
	{name: "Datuk Highway Bin Fake Resume", dialogue1: "Yeah man, I totally know how to build a highway.", dialogue2: "I'll build a road so straight it'll make the trees dizzy.", dialogue3: "Trust me, I am totally certified. Just sign the paper.", approve: "WAIT! (The highway collapsed because it was made of cardboard. Lawsuit pending).", reject: "You would deny me of my PASSION?! You're a roadblock!", skip: "I'll just leave my totally real resume here on the desk.", sprite: sDatuk_highway, gain: -350, lost: 50},
	{name: "Mr. Clean Coal tm", dialogue1: "I love coals. Give me money to buy more coals.", dialogue2: "Coal is just 'diamonds' that haven't been squeezed yet!", dialogue3: "Coal coal coal coal. Smells like success!", approve: "I will show this world the power of coal!", reject: "I know what you're getting for Christmas. A cold, dark house.", skip: "More time for the coal to get nice and dusty.", sprite: sMr_clean_coal, gain: 250, lost: -50},
	{name: "Dr. Spillwell", dialogue1: "Mind if I throw like, all my waste in the ocean for free?", dialogue2: "My wife doesn't like the smell. The fish won't mind.", dialogue3: "They might grow extra legs, but we'll grow extra rich.", approve: "Thanks for the giant trashcan! The water glows now!", reject: "Fine, I'll try throwing it into space instead. So expensive!", skip: "The barrels are starting to leak, hurry up!", sprite: sDr_spill_well, gain: 200, lost: -150},
	{name: "Encik KPI", dialogue1: "You are behind quota. The 'Green' bar is too high.", dialogue2: "You should totally go further behind. More money for me.", dialogue3: "Numbers don't grow on trees, Prime Minister.", approve: "Down the drain we go. Maximize the output!", reject: "Quotas are overrated anyway. You failed the success test.", skip: "I'll be back with even more spreadsheets later.", sprite: sMr_kpi, gain: 150, lost: -150},
	{name: "High Risk Paul", dialogue1: "90% of gamblers quit before hitting it big.", dialogue2: "LET'S GO GAMBLING!!! Dig into the volcano for gold!", dialogue3: "... Unless you a wuss and just want small cash.", approve: "AW DANGIT! (The city is buried in lava. Total reconstruction required).", reject: "You're no fun. We could've been kings of the crater.", skip: "One more spin... later. I can feel it!", sprite: sHigh_risk_Paul, gain: -600, lost: 100},
	{name: "Supreme Leader", dialogue1: "This forest is mine. It serves the state.", dialogue2: "I will replace the birds with speakers that play my speeches.", dialogue3: "Chop the trees. They are blocking the sound of my glory.", approve: "Good citizen. Concrete is loyalty.", reject: "Unacceptable. The trees are spies! You'll regret this!", skip: "You keep the Supreme Leader waiting? Bold.", sprite: sJongun, gain: 150, lost: 100},
	{name: "Rocket Billionaire", dialogue1: "We'll leave Earth soon. Mars is far, and Earth is right here.", dialogue2: "I need to dig up the swamp to find rocket fuel.", dialogue3: "We're trading a few frogs for the stars. Future secured.", approve: "Future secured. Disrupt the biosphere for the mission.", reject: "You lack vision. Enjoy your mud while I reach the stars.", skip: "The launch window is closing, Prime Minister.", sprite: sElon, gain: 200, lost: -50},
	{name: "Trump McDonald", dialogue1: "The world needs healing. Let's send A GAJIBILLION to Yahu Nation.", dialogue2: "We're going to build a beautiful wall of gold-plated factories.", dialogue3: "It'll be huge. The trees will pay for it. Believe me.", approve: "Tremendous! (The gold paint washed off. Massive tax lawsuit).", reject: "Worst decision ever. A total disaster for the economy.", skip: "We'll talk later. It'll be the greatest talk in history.", sprite: sDonald_trump, gain: -700, lost: 200},
	{name: "Mr. Cash Crab", dialogue1: "Money money! I can smell the profit under the reef!", dialogue2: "Let's use some dynamite and go 'fishing' for gold!", dialogue3: "Every reef we blow up is a new boat for me! Approve it!", approve: "Moneyy!! I'm going to go buy a bigger hat!", reject: "You can't see it but I'm playing the world's smallest violin.", skip: "Time is money! And you're wasting both!", sprite: sMr_Crabs, gain: 200, lost: -50},
	{name: "Endministrator", dialogue1: "System optimization required. Organic life inefficient.", dialogue2: "A flat world is a fast world. Flatten the mountains.", dialogue3: "A world of dust is more perfect than a world of weeds. Proceed?", approve: "Optimization complete. The organic era is over.", reject: "Error logged. Your biological sentiment is a system bottleneck.", skip: "Processing... Request moved to background task.", sprite: sEndministrator, gain: 150, lost: -50},
	{name: "Dark Enforcer", dialogue1: "The forest rebels. It will fall. Join the industrial side.", dialogue2: "I shall burn it down and build a shining metal base.", dialogue3: "Resistance is futile. Industrialize the sector. You decide.", approve: "CRUNCH! (The metal base sank into the swamp. Foundation repairs required).", reject: "I find your lack of faith... and greed... disturbing.", skip: "The industrial side is patient. For now.", sprite: sDarth_Vader, gain: -250, lost: 50},
	{name: "Perfect Being", dialogue1: "I seek pure perfection. Nature's randomness is an insult.", dialogue2: "I will iron out the hills and pave over the valleys.", dialogue3: "Grant me land so that I can make an arena for my perfection.", approve: "Look at me, I'm perfect. (He blew up the city stadium for 'space').", reject: "You're either perfect or you're not me. Disgusting.", skip: "I shall return when you've reached a better conclusion.", sprite: sCell, gain: -300, lost: 100},
	{name: "Dr. Eggplant", dialogue1: "Machines over nature! Buttons are better than leaves!", dialogue2: "I want to turn every bird into a little wind-up toy.", dialogue3: "Help me find that blue rodent and automate this park!", approve: "Eggplant Land will finally come to be! Ho-ho!", reject: "You'll pay for this! You're on the rodent's side!", skip: "Fine! I have robots to build anyway!", sprite: sRobotnik, gain: 200, lost: -50},
	{name: "Handsome Exec", dialogue1: "We'll be the hero. But I'm the handsome one, kiddo.", dialogue2: "See that forest? It's 'blocking' the view of my face.", dialogue3: "Approve my BORDERs and I'll put a giant neon 'Me' sign there.", approve: "Ouch. (The neon sign fell on the hospital. Massive insurance payout).", reject: "I'll pay you to jump off a bridge. Seriously. Do it.", skip: "Come back when you're ready to make real money, kid.", sprite: sHandsome_Jack, gain: -200, lost: 150},
	{name: "Corporate Devil", dialogue1: "Give me 100 human souls. I'll make it worth your while.", dialogue2: "I'll fill the river with gold. It might be hot to the touch.", dialogue3: "Don't worry about 'eternal' consequences. Just sign here.", approve: "Pleasure doing business. The sulfur smells like success.", reject: "Just think about it. You're too 'good' for me. Boring.", skip: "The contract stays on the table. It's only a matter of time.", sprite: sSatan, gain: 500, lost: -50},
	{name: "Mr. O'Haze", dialogue1: "Pollution is profitable. Air, water... optional.", dialogue2: "Let's make the air so thick people have to buy it from us!", dialogue3: "Factory is necessity. Let's choke the town out for cash.", approve: "I say let it die! Profit is in the smog!", reject: "You gotta be kidding me. Passing up a monopoly on breathing?", skip: "Better buy some masks. The smog is coming anyway.", sprite: sOHare, gain: 200, lost: -50},
	{name: "Mukbang Mogul", dialogue1: "I need MORE seafood. Like... way more. It's for a video!", dialogue2: "I need to eat every single shrimp in the harbor. NOW!", dialogue3: "It's your fault if I stay hungry! It's YOUR fault!", approve: "BURP! (The fishing industry went bankrupt overnight. Bailout required).", reject: "cries. YOU'RE STARVING ME! RUINING MY CAREER!", skip: "I'm making a video about how mean you are right now!", sprite: sNikokado_avocado, gain: -300, lost: 100},
	{name: "The Deep Guy", dialogue1: "The ocean trusts me... I think. Help me save the dolphins.", dialogue2: "They want me to build an offshore toxic refinery for them.", dialogue3: "It's a spiritual thing. Don't be a hater, bro.", approve: "Ah shit, the tank leaked. (The harbor is now a toxic waste zone. Cleanup costs are huge).", reject: "Gender is just a spectrum right bro? You don't get the vibe.", skip: "The dolphins told me you'd be like this.", sprite: sThe_deep, gain: -400, lost: -100},
	{name: "BigEater", dialogue1: "That's a LOT of food. That forest looks like broccoli.", dialogue2: "Can I have more? I'm gonna need a loan to eat that.", dialogue3: "I'm literally wasting away. Just let me eat the park.", approve: "W meal. (He ate the park AND the city grain reserves. Food riot repairs needed).", reject: "Mods ban him. He's gatekeeping the buffet!", skip: "I'm getting lightheaded. Don't make me wait too long.", sprite: sCaseoh, gain: -500, lost: 50},
	{name: "Count Edward", dialogue1: "I'm hunting vermin. But the sunlight is... irritating.", dialogue2: "Level the forest so I can hunt in the cold, gray moonlight.", dialogue3: "The ecosystem is a small price for my convenience.", approve: "How... intoxicating. The smell of sawdust and ancient blood.", reject: "How... moral. It's quite repulsive. Enjoy the sun.", skip: "I have lived for centuries. I can wait a few more hours.", sprite: sEdward_Cullen, gain: 150, lost: -50},
	{name: "Charity Beast", dialogue1: "I JUST BOUGHT THE ENTIRE NATIONAL PARK TO BULLDOZE IT!", dialogue2: "FOR EVERY TREE CHOPPED, I'LL DONATE A NICKEL TO 'COAL'!", dialogue3: "Like and subscribe to the total environmental collapse!", approve: "W content! (The giveaway drained the city welfare fund).", reject: "You hate charity? That's going in the thumbnail, loser!", skip: "STAY TUNED FOR PART TWO!", sprite: sMr_fake_beast, gain: -350, lost: -100},
	{name: "Drunken Captain", dialogue1: "There's treasure under the reefs! Gold! Savvy?", dialogue2: "The compass led me here. We just need to blow the coral!", dialogue3: "Approve the dynamite and we share the booty, savvy?", approve: "The CAPTAIN has given orders! Drink up, we're rich!", reject: "Cursed luck. You've got no spirit for the hunt, do ya?", skip: "Aye, the tide waits for no man. We'll be back.", sprite: sCaptain_Jack, gain: 200, lost: -50},
	{name: "Crunch Dev", dialogue1: "We need more polygons. Invest in less framerates.", dialogue2: "The grass is making the town lag. Delete the vegetation.", dialogue3: "It's a simple 'update.' Nature has too many wiggly lines.", approve: "MORE POLYGONS! FPS BOOSTED!", reject: "if else...{} Progress not found. Human error.", skip: "Compiling... Waiting for user input.", sprite: sYandereGame_Dev, gain: 150, lost: -50},
	{name: "AI Engineer", dialogue1: "The models require more water. The internet is thirsty.", dialogue2: "We'll swap the lake for 'data.' It's much more useful.", dialogue3: "You can't buy things with water, but you can with bytes!", approve: "RAM prices increase. The lake is now a hard drive.", reject: "A human error. Your logic is outdated and inefficient.", skip: "Request timed out. Retrying later.", sprite: sAIDev_Vedal, gain: 200, lost: -50},
	{name: "Robot Man", dialogue1: "I build. Leaves are fragile, steel is forever.", dialogue2: "I could make things beautiful with a metal grid.", dialogue3: "Help us take over the world. Delete the biosphere.", approve: "Boop. Beep. Biodiversity deleted. Efficiency achieved.", reject: "I'll be back... with a bigger magnet.", skip: "Low battery. Returning to charging station.", sprite: sRobot_c3po, gain: 100, lost: -50},
	{name: "Virus Man", dialogue1: "Help us spread. We are the ultimate 'growth' industry.", dialogue2: "Let us infect the wetlands and replace them with factories.", dialogue3: "The swarm requires expansion. Do not fight the infection.", approve: "The swarm will remember your name as its greatest host.", reject: "We will infect everyone you love. Cures are for losers.", skip: "We are already inside the vents. We can wait.", sprite: sBacteria_Man, gain: 200, lost: -50},
	{name: "Grandma", dialogue1: "Hey sweetie, I've made some money selling cookies.", dialogue2: "The ovens just need a little bit of 'dirty' coal to run.", dialogue3: "The smoke is just 'flavor' for the sky! Want pocket money?", approve: "Don't push yourself too hard. Keep the coal burning.", reject: "Aww you shouldn't have. I'll keep the lead to myself.", skip: "I'll go put these back in the oven for a bit.", sprite: sGrandma_ethel, gain: 100, lost: 100},
	{name: "Mutant Fish Leader", dialogue1: "We evolved in the sludge you dumped. We want more!", dialogue2: "The cleaner the water, the more we die. Keep it toxic!", dialogue3: "Make more. Open the pipes and feed your new masters.", approve: "We grow. The sludge is our lifeblood. Keep it flowing!", reject: "We adapt anyway. You can't stop the mutation.", skip: "Glub. We'll be under your bed later.", sprite: sFishOuttaWotah, gain: 150, lost: -50},
	{name: "Lonely Skeleton", dialogue1: "I need more graves. More friends. Cut the trees.", dialogue2: "Tear down the grove to make room for a luxury crypt.", dialogue3: "It's peaceful, profitable, and very permanent. Cut trees.", approve: "More friends <:. No trees to block the view.", reject: "I'll see you eventually. I forgive your attachment.", skip: "Take your time. I'm not going anywhere. Literally.", sprite: sSkeleton_Papyrus, gain: 100, lost: -50},
	{name: "Wife", dialogue1: "Honey, can I have money? Pretty pleasee.", dialogue2: "I saw the cutest diamond mine that needs a mountain cleared.", dialogue3: "All my friends got the new handbag. Best husband ever?", approve: "Yayyy I love you! (The mountain fell on the city water pipes. Repair debt logged).", reject: "I'm filing a divorce. You care more about dirt than me!", skip: "I'm going to go buy it anyway and put it on your card!", sprite: sWife, gain: -600, lost: -50}
]
array_shuffle_ext(npc_master_list);

day = 1;
npc_limit = 5; // Will be set in start_day
day1_quota = 500;
day2_quota = 1500;
day3_quota = 3000;
revenue = 0;
nature = 0;
npc_count = 0;
loss_npc_count = 0;
player_choice = "WAITING";
show_result = false;
depth = -10;

// --- NEW GAMEPLAY OVERHAUL VARIABLES ---
approvals_remaining = 5;
day_timer = 90 * 60; // 90 seconds @ 60 FPS
npc_timer = 5 * 60;  // 5 seconds @ 60 FPS
npc_timer_active = false;
quota_hit = false;
day_done = false;
static_timer = 0;
max_day_timer = 90 * 60;
result_fade_alpha = 0;
show_result = false;
force_loss = false;

global.skips_remaining = 3;

// Function to initialize a new day
start_day = function() {
    npc_count = 0;
    show_result = false;
    loss_npc_count = 0;
    day_timer = 90 * 60;
    max_day_timer = day_timer;
    npc_timer = 10 * 60;
    npc_timer_active = false;
    quota_hit = false;
    force_loss = false;
    day_done = false;
    global.skips_remaining = 3;
    result_fade_alpha = 0;
    static_timer = 60; // 1s of static on day start
    
    npc_limit = 999; // effectively unlimited
    
    switch(day) {
        case 1: 
            approvals_remaining = 5; 
            day_timer = 90 * 60;
            break;
        case 2: 
            approvals_remaining = 10; 
            day_timer = 120 * 60;
            break;
        case 3: 
            approvals_remaining = 15; 
            day_timer = 150 * 60;
            break;
        default: 
            approvals_remaining = 5; 
            day_timer = 90 * 60;
            break;
    }
    max_day_timer = day_timer;
    
    // --- UI SPAWNING & RESET ---
    if (room == Gameplay)
    {
        // Cleanup old UI to prevent duplicates
    instance_destroy(oDay_TimerCircle);
    instance_destroy(oNPC_TimerBar);
    
    // Spawn UI (using room-relative or GUI-relative positions)
    instance_create_layer(83, 82, "Dialog_choice_revenue", oDay_TimerCircle);
    instance_create_layer(544, 608, "Dialogue_box", oNPC_TimerBar);
    
    // Spawn Parallax Clouds on the TV layer
    var _c1 = instance_create_layer(768, 150, "TV", oCloud_Parallax_1);
    _c1.depth = 650;
    _c1.move_speed = 0.5;
    _c1.sprite_index = sCloud1;
    
    var _c2 = instance_create_layer(850, 250, "TV", oCloud_Parallax_2);
    _c2.depth = 650;
    _c2.move_speed = 0.8;
    _c2.sprite_index = sCloud2;
    }
}

// Initial first day is now handled by Room Start event (Other 4)
// start_day();

current_music = -1;

if (room == Main_menu) 
{
    current_music = audio_play_sound(soMain_menu_Dagored___Harlem_Heat__freetouse_com_, 100, true);
    audio_sound_gain(current_music, 1, 0);
}