randomise();

// Set base resolution for GUI scaling
base_gui_width = 1280;
base_gui_height = 720;
display_set_gui_size(base_gui_width, base_gui_height);

// --- NPC IDENTITY DATABASE ---
npc_master_list = [
	{name: "Mr. Deepwater Profit", dialogue1: "Hey pal.", dialogue2: "I wanna 'borrow' some cash for offshore oil drilling.", dialogue3: "It's just a small dent in the wallet, iif ya know what I mean.", approve: "That's the spirit, chum.", reject: "Fine, I don't need your money.", sprite: sMr_deep_water_profit, gain: -50, lost: 150},
	{name: "Chad Ecovision tm", dialogue1: "Yoooo", dialogue2: "you should totally build your own infinity pool.", dialogue3: "All the cool billionares have one", approve: "THAT'S what I'm talking about.", reject: "Well screw you, I'll just find rich idiots instead.", sprite: sGigachad, gain: -50, lost: 100},
	{name: "Synergy Sam", dialogue1: "SURRENDER YOUR MONEY.", dialogue2: "IT WILL STRENGTHEN MY POWER", dialogue3: "DO IT NOW.", approve: "YES....  ALL THE PRECIOUS FUEL IS MINE!!!.", reject: "My powers.... are fading....", sprite: sSynergy_sam, gain: -50, lost: 100},
	{name: "Tim Burr, CEO", dialogue1: "Hey Min-man,", dialogue2: "the trees are taunting me", dialogue3: "I need some cash to throw at the trees, literally.", approve: "I knew you were cool.", reject: "How bland. What's the point of having money", sprite: sTim_burr, gain: -50, lost: 150},
	{name: "Captain Overcatch", dialogue1: "All the fish will be mine.", dialogue2: "I will purify the waters.", dialogue3: "Awaiting orders.", approve: "Zero fish left behind.", reject: "You're doomed us all....", sprite: sCaptain_overcatch, gain: -50, lost: 100},
	{name: "Datuk Highway Bin Fake Resume", dialogue1: "Yeah man, I totatlly know how to build a highway.", dialogue2: "You've already seen my resume.", dialogue3: "I am totally certified.", approve: "I've been waiting my whole life for this.", reject: "You DARE deny me of my PASSION?!.", sprite: sDatuk_highway, gain: -50, lost: 100},
	{name: "Mr. Clean Coal tm", dialogue1: "I love coals.", dialogue2: "Give me money to but more coals.", dialogue3: "Coal coal coal coal.", approve: "I will show this world the power of coal.", reject: "I know what you're getting for Christmas.", sprite: sMr_clean_coal, gain: -50, lost: 150},
	{name: "Dr. Spillwell", dialogue1: "You have an ocean right?", dialogue2: "Mind if I throw like, all my waste in it for free?", dialogue3: "My wife doesn't like the smell.", approve: "Thanks for the giant trashcan.", reject: "Fine, I'll try throwing it to space instead.", sprite: sDr_spill_well, gain: 0, lost: 150},
	{name: "Encik KPI", dialogue1: "You are behind quota.", dialogue2: "You should totally go further behind.", dialogue3: "More money for me.", approve: "Down the drain we go.", reject: "Quotas are overrated.", sprite: sMr_kpi, gain: -100, lost: 50},
	{name: "High Risk Paul", dialogue1: "90% of gamblers quit before hitting it big.", dialogue2: "LET'S GO GAMLING!!!", dialogue3: "... Unless you a wuss and just want small cash.", approve: "WE can't stop losing.", reject: "You're no fun.", sprite: sHigh_risk_Paul, gain: -50, lost: 150},
	{name: "Supreme Leader", dialogue1: "This forest is mine.", dialogue2: "It serves the state.", dialogue3: "Approve.", approve: "Good citizen.", reject: "Unacceptable.", sprite: sJongun, gain: 100, lost: -50},
	{name: "Rocket Billionaire", dialogue1: "We'll leave Earth soon.", dialogue2: "But first...", dialogue3: "...we use it.", approve: "Future secured.", reject: "You lack vision.", sprite: sElon, gain: 150, lost: -50},
	{name: "Trump McDonald", dialogue1: "The world needs healing.", dialogue2: "Let's send A GAJIBILLION dollars to Yahu Nation.", dialogue3: "No trees needed.", approve: "Tremendous.", reject: "Worst decision.", sprite: sDonald_trump, gain: -500, lost: -150}, // <- investigate this problem
	{name: "Mr. Cash Crab", dialogue1: "Money money!", dialogue2: "Nature is useless!", dialogue3: "Approve it!", approve: "Moneyy!!", reject: "You can't see it but I'm playing the world's smallest violin", sprite: sMr_Crabs, gain: 150, lost: -50}, 
	{name: "Endministrator", dialogue1: "System optimization required.", dialogue2: "Organic life inefficient.", dialogue3: "Proceed?", approve: "Optimization complete.", reject: "Error logged.", sprite: sEndministrator, gain: 150, lost: -50},
	{name: "Dark Enforcer", dialogue1: "The forest rebels.", dialogue2: "It will fall.", dialogue3: "You decide.", approve: "For the Empire.", reject: "I find your lack of faith... disturbing.", sprite: sDarth_Vader, gain: 100, lost: -40},
	{name: "Perfect Being", dialogue1: "I seek perfection.", dialogue2: "Nature is flawed.", dialogue3: "Grant me land so that I can make an arena to test my perfection.", approve:  "Look at me, I'm perfect.", reject: "You're either perfect or you’re not me.", sprite: sCell, gain: 150, lost: -50},
	{name: "Dr. Eggplant", dialogue1: "Machines over nature.", dialogue2: "Efficiency matters.", dialogue3: "Help me find that blue rodent.", approve:  "Eggplant Land will finally come to be!", reject:  "You'll pay for this.", sprite: sRobotnik, gain: 150, lost: -50},
	{name: "Handsome Exec", dialogue1: "We'll be the hero.", dialogue2: "But I'm the handsome one.", dialogue3: "Approve my idea to put BORDERs between the LANDS.", approve: "I just want you to remember one thing; you’re a sellout.", reject: "I'll pay you to kill yourself.", sprite: sHandsome_Jack, gain: 50, lost: 150},
	{name: "Corporate Devil", dialogue1: "Give me 100 human souls.", dialogue2: "I'll make it worth your while.", dialogue3: "Sign here.", approve: "Pleasure doing business.", reject: "Just think about it.", sprite: sSatan, gain: 150, lost: -50},
	{name: "Mr. O'Haze", dialogue1: "Pollution is profitable.", dialogue2: "Air, water... optional.", dialogue3: "Factory is necessity.", approve: "I say let it die, let it die, let it shrivel up and die.", reject: "You gotta be kidding me.", sprite: sOHare, gain: 150, lost: -50},
	{name: "Mukbang Mogul", dialogue1: "I need MORE seafood.", dialogue2: "Like... way more.", dialogue3: "Help a brother out?", approve: "Two steps ahead", reject: "*cries*", sprite: sNikokado_avocado, gain: 150, lost: -50},
	{name: "The Deep Guy", dialogue1: "The ocean trusts me...", dialogue2: "...I think.", dialogue3: "Help me save the dolphins.", approve: "They'll forgive me.", reject: "...thank you.", sprite: sThe_deep, gain: 100, lost: -50},
	{name: "BigEater", dialogue1: "Feeling kinda hungry.", dialogue2: "I see you got a forest.", dialogue3: "Mind if I eat that? I'll pay for it.", approve: "W meal.", reject: "Mods ban him.", sprite: sCaseoh, gain: 100, lost: -50},
	{name: "Count Edward", dialogue1: "I'm hunting vermins.", dialogue2: "But the forest blocks my path.", dialogue3: "Destory it.", approve: "How... intoxicating.", reject: "How... moral.", sprite: sEdward_Cullen, gain: 100, lost: -50},
	{name: "Charity Beast", dialogue1: "For every land we clear...", dialogue2: "I'll donate 1% to your city.", dialogue3: "Deal?", approve: "Good content!", reject: "You hate charity?", sprite: sMr_fake_beast, gain: 100, lost: -50},
	{name: "Drunken Captain", dialogue1: "The compass led me here.", dialogue2: "There be treasure under them reefs!", dialogue3: "Approve, savvy?", approve: "The CAPTAIN has given orders!", reject: "Cursed luck...", sprite: sCaptain_Jack, gain: -150, lost: -50},
	{name: "Crunch Dev", dialogue1: "We need more polygons.", dialogue2: "Invest in less framerates.", dialogue3: "Simple.", approve: "MORE POLYGONS!.", reject: "if else...{}", sprite: sYandereGame_Dev, gain: 150, lost: -50},
	{name: "AI Engineer", dialogue1: "Model too big.", dialogue2: "Model needs water and land.", dialogue3: "We demand your trust.", approve: "RAM prices increase.", reject: "A human error.", sprite: sAIDev_Vedal, gain: 150, lost: -50},
	{name: "Robot Man", dialogue1: "I build.", dialogue2: "I could make things beautiful.", dialogue3: "Help us take over the world.", approve: "Boop.", reject: "I'll be back.", sprite: sRobot_c3po, gain: 100, lost: -50},
	{name: "Virus Man", dialogue1: "We erase ecosystems.", dialogue2: "Fast and efficient.", dialogue3: "Help us spread.", approve: "The swarm will remember your name.", reject: "We will infect everyone you love.", sprite: sBacteria_Man, gain: 100, lost: -50},
	{name: "Grandma", dialogue1: "Hey sweetie!", dialogue2: "I've made some money seling cookies.", dialogue3: "Heres some pocket money", approve: "Don't push yourself too hard.", reject: "Aww you shouldn't have.", sprite: sGrandma_ethel, gain: 100, lost: -50},
	{name: "Mutant Fish Leader", dialogue1: "We evolved.", dialogue2: "We thrive in poison.", dialogue3: "Make more.", approve: "We grow.", reject: "We adapt anyway.", sprite: sFishOuttaWotah, gain: 100, lost: -50},
	{name: "Lonely Skeleton", dialogue1: "I need more graves.", dialogue2: "More friends.", dialogue3: "Cut trees.", approve: "More friends <:", reject: "I forgive you.", sprite: sSkeleton_Papyrus, gain: 100, lost: -50},
	{name: "Wife", dialogue1:"Honey, can I have money?", dialogue2: "All my friends got the new handbag,", dialogue3: "Pretty pleaseeeee", approve: "Yayyy I love you! :3  Best husband ever!! >w<", reject: "I'm filing a divorce.", sprite: sWife,  gain: -100, lost: -100}
];

array_shuffle_ext(npc_master_list);

day = 1;
npc_limit = 0;
day1_quota = 500;
day2_quota = 1000;
day3_quota = 1500;
revenue = 0;
nature = 0;
npc_count = 0;
loss_npc_count = 0;
player_choice = "WAITING";
show_result = false;
depth = -10;

current_music = -1;

if (room == Main_menu) 
{
    current_music = audio_play_sound(soMain_menu_Dagored___Harlem_Heat__freetouse_com_, 100, true);
    audio_sound_gain(current_music, 1, 0);
}