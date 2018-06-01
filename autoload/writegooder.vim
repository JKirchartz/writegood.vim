"
" Toggle writegooder mode
"
function! writegooder#toggle()
    call writegooder#init()

    if empty(w:writegooder_on)
        call writegooder#enable()
    else
        call writegooder#disable()
    endif
endfunction

"
" Register keyword highlights
"
function! writegooder#add_highlights(groupName, keywords)
  for kw in a:keywords
      exec "syntax keyword " . a:groupName . " containedin=ALL " . kw
  endfor
endfunction

"
" Init the w:writegooder_on variable.
"
function! writegooder#init()
  if !exists('w:writegooder_on')
    " Weasel words take from Matt Might's blog.
    let weasels = ["many", "various", "very", "fairly", "several", "extremely", "exceedingly", "quite", "remarkably", "few", "surprisingly", "mostly", "largely", "huge", "tiny", "are a number", "is a number", "excellent", "interestingly", "significantly", "substantially", "clearly", "vast", "relatively", "completely" ]
    call writegooder#add_highlights("WeaselWords", weasels)

    " Adjectives
    let adjectives = ["acer", "after", "airier", "airiest", "airy", "all-arounder", "angrier", "angriest", "angry", "archer", "artier", "artiest", "arty", "ashier", "ashiest", "ashy", "assaulter", "attacker", "backer", "bad", "baggier", "baggiest", "baggy", "balkier", "balkiest", "balky", "balmier", "balmiest", "balmy", "bandier", "bandiest", "bandy", "bargainer", "barmier", "barmiest", "barmy", "battier", "battiest", "batty", "baulkier", "baulkiest", "baulky", "bawdier", "bawdiest", "bawdy", "bayer", "beadier", "beadiest", "beady", "beastlier", "beastliest", "beastly", "beater", "beefier", "beefiest", "beefy", "beerier", "beeriest", "beery", "bendier", "bendiest", "bendy", "best", "better", "big", "bigger", "biggest", "bitchier", "bitchiest", "bitchy", "biter", "bittier", "bittiest", "bitty", "blearier", "bleariest", "bleary", "bloodier", "bloodiest", "bloodthirstier", "bloodthirstiest", "bloodthirsty", "bloody", "blowier", "blowiest", "blowsier", "blowsiest", "blowsy", "blowy", "blowzier", "blowziest", "blowzy", "blue", "bluer", "bluest", "boner", "bonier", "boniest", "bonnier", "bonniest", "bonny", "bony", "boozier", "booziest", "boozy", "boskier", "boskiest", "bosky", "bossier", "bossiest", "bossy", "botchier", "botchiest", "botchy", "bother", "bouncier", "bounciest", "bouncy", "bounder", "bower", "brainier", "brainiest", "brainy", "brashier", "brashiest", "brashy", "brassier", "brassiest", "brassy", "brawnier", "brawniest", "brawny", "breathier", "breathiest", "breathy", "breezier", "breeziest", "breezy", "brinier", "briniest", "briny", "britisher", "broadcaster", "brooder", "broodier", "broodiest", "broody", "bubblier", "bubbliest", "bubbly", "buggier", "buggiest", "buggy", "bulkier", "bulkiest", "bulky", "bumpier", "bumpiest", "bumpy", "bunchier", "bunchiest", "bunchy", "burlier", "burliest", "burly", "burrier", "burriest", "burry", "burster", "bushier", "bushiest", "bushy", "busier", "busiest", "buster", "bustier", "bustiest", "busty", "busy", "cagey", "cagier", "cagiest", "camper", "cannier", "canniest", "canny", "canter", "cantier", "cantiest", "canty", "caster", "catchier", "catchiest", "catchy", "cattier", "cattiest", "catty", "cer", "chancier", "chanciest", "chancy", "charier", "chariest", "chary", "chattier", "chattiest", "chatty", "cheekier", "cheekiest", "cheeky", "cheerier", "cheeriest", "cheery", "cheesier", "cheesiest", "cheesy", "chestier", "chestiest", "chesty", "chewier", "chewiest", "chewy", "chillier", "chilliest", "chilly", "chintzier", "chintziest", "chintzy", "chippier", "chippiest", "chippy", "choosier", "choosiest", "choosy", "choppier", "choppiest", "choppy", "chubbier", "chubbiest", "chubby", "chuffier", "chuffiest", "chuffy", "chummier", "chummiest", "chummy", "chunkier", "chunkiest", "chunky", "churchier", "churchiest", "churchy", "clammier", "clammiest", "clammy", "classier", "classiest", "classy", "cleanlier", "cleanliest", "cleanly", "clerklier", "clerkliest", "clerkly", "cloudier", "cloudiest", "cloudy", "clubbier", "clubbiest", "clubby", "clumsier", "clumsiest", "clumsy", "cockier", "cockiest", "cocky", "coder", "collier", "colliest", "colly", "comelier", "comeliest", "comely", "comfier", "comfiest", "comfy", "cornier", "corniest", "corny", "cosier", "cosiest", "costlier", "costliest", "costly", "costumer", "cosy", "counterfeiter", "courtlier", "courtliest", "courtly", "cozier", "coziest", "cozy", "crabbier", "crabbiest", "crabby", "cracker", "craftier", "craftiest", "crafty", "craggier", "craggiest", "craggy", "crankier", "crankiest", "cranky", "crasher", "crawlier", "crawliest", "crawly", "crazier", "craziest", "crazy", "creamer", "creamier", "creamiest", "creamy", "creepier", "creepiest", "creepy", "crispier", "crispiest", "crispy", "crumbier", "crumbiest", "crumblier", "crumbliest", "crumbly", "crumby", "crummier", "crummiest", "crummy", "crustier", "crustiest", "crusty", "curlier", "curliest", "curly", "customer", "cute", "cuter", "daffier", "daffiest", "daffy", "daintier", "daintiest", "dainty", "dandier", "dandiest", "dandy", "deadlier", "deadliest", "deadly", "dealer", "deserter", "dewier", "dewiest", "dewy", "dicey", "dicier", "diciest", "dim", "dimer", "dimmer", "dimmest", "dingier", "dingiest", "dingy", "dinkier", "dinkiest", "dinky", "dippier", "dippiest", "dippy", "dirtier", "dirtiest", "dirty", "dishier", "dishiest", "dishy", "dizzier", "dizziest", "dizzy", "dodgier", "dodgiest", "dodgy", "dopey", "dopier", "dopiest", "dottier", "dottiest", "dotty", "doughier", "doughiest", "doughtier", "doughtiest", "doughty", "doughy", "dowdier", "dowdiest", "dowdy", "dowie", "dowier", "dowiest", "downer", "downier", "downiest", "downy", "dowy", "dozier", "doziest", "dozy", "drab", "drabber", "drabbest", "draftier", "draftiest", "drafty", "draggier", "draggiest", "draggy", "draughtier", "draughtiest", "draughty", "dreamier", "dreamiest", "dreamy", "drearier", "dreariest", "dreary", "dreggier", "dreggiest", "dreggy", "dresser", "dressier", "dressiest", "dressy", "drier", "driest", "drippier", "drippiest", "drippy", "drowsier", "drowsiest", "drowsy", "dry", "dryer", "dryest", "dumpier", "dumpiest", "dumpy", "dun", "dunner", "dunnest", "duskier", "duskiest", "dusky", "dustier", "dustiest", "dusty", "earlier", "earliest", "early", "earthier", "earthiest", "earthlier", "earthliest", "earthly", "earthy", "easier", "easiest", "easter", "eastsider", "easy", "edger", "edgier", "edgiest", "edgy", "eerie", "eerier", "eeriest", "emptier", "emptiest", "empty", "faker", "fancier", "fanciest", "fancy", "fat", "fatter", "fattest", "fattier", "fattiest", "fatty", "faultier", "faultiest", "faulty", "feistier", "feistiest", "feisty", "feller", "fiddlier", "fiddliest", "fiddly", "filmier", "filmiest", "filmy", "filthier", "filthiest", "filthy", "finnier", "finniest", "finny", "first-rater", "first-stringer", "fishier", "fishiest", "fishy", "fit", "fitter", "fittest", "flabbier", "flabbiest", "flabby", "flaggier", "flaggiest", "flaggy", "flakier", "flakiest", "flaky", "flasher", "flashier", "flashiest", "flashy", "flat", "flatter", "flattest", "flauntier", "flauntiest", "flaunty", "fledgier", "fledgiest", "fledgy", "fleecier", "fleeciest", "fleecy", "fleshier", "fleshiest", "fleshlier", "fleshliest", "fleshly", "fleshy", "flightier", "flightiest", "flighty", "flimsier", "flimsiest", "flimsy", "flintier", "flintiest", "flinty", "floatier", "floatiest", "floaty", "floppier", "floppiest", "floppy", "flossier", "flossiest", "flossy", "fluffier", "fluffiest", "fluffy", "flukier", "flukiest", "fluky", "foamier", "foamiest", "foamy", "foggier", "foggiest", "foggy", "folder", "folksier", "folksiest", "folksy", "foolhardier", "foolhardiest", "foolhardy", "fore-and-after", "foreigner", "forest", "founder", "foxier", "foxiest", "foxy", "fratchier", "fratchiest", "fratchy", "freakier", "freakiest", "freaky", "free", "freer", "freest", "frenchier", "frenchiest", "frenchy", "friendlier", "friendliest", "friendly", "friskier", "friskiest", "frisky", "frizzier", "frizziest", "frizzlier", "frizzliest", "frizzly", "frizzy", "frostier", "frostiest", "frosty", "frouzier", "frouziest", "frouzy", "frowsier", "frowsiest", "frowsy", "frowzier", "frowziest", "frowzy", "fruitier", "fruitiest", "fruity", "funkier", "funkiest", "funky", "funnier", "funniest", "funny", "furrier", "furriest", "furry", "fussier", "fussiest", "fussy", "fustier", "fustiest", "fusty", "fuzzier", "fuzziest", "fuzzy", "gabbier", "gabbiest", "gabby", "gamier", "gamiest", "gammier", "gammiest", "gammy", "gamy", "gassier", "gassiest", "gassy", "gaudier", "gaudiest", "gaudy", "gauzier", "gauziest", "gauzy", "gawkier", "gawkiest", "gawky", "ghastlier", "ghastliest", "ghastly", "ghostlier", "ghostliest", "ghostly", "giddier", "giddiest", "giddy", "glad", "gladder", "gladdest", "glassier", "glassiest", "glassy", "glib", "glibber", "glibbest", "gloomier", "gloomiest", "gloomy", "glossier", "glossiest", "glossy", "glum", "glummer", "glummest", "godlier", "godliest", "godly", "goer", "goner", "good", "goodlier", "goodliest", "goodly", "gooey", "goofier", "goofiest", "goofy", "gooier", "gooiest", "goosier", "goosiest", "goosy", "gorier", "goriest", "gory", "gradelier", "gradeliest", "gradely", "grader", "grainier", "grainiest", "grainy", "grassier", "grassiest", "grassy", "greasier", "greasiest", "greasy", "greedier", "greediest", "greedy", "grim", "grimmer", "grimmest", "grislier", "grisliest", "grisly", "grittier", "grittiest", "gritty", "grizzlier", "grizzliest", "grizzly", "groggier", "groggiest", "groggy", "groovier", "grooviest", "groovy", "grottier", "grottiest", "grotty", "grounder", "grouper", "groutier", "groutiest", "grouty", "grubbier", "grubbiest", "grubby", "grumpier", "grumpiest", "grumpy", "guest", "guiltier", "guiltiest", "guilty", "gummier", "gummiest", "gummy", "gushier", "gushiest", "gushy", "gustier", "gustiest", "gusty", "gutsier", "gutsiest", "gutsy", "hairier", "hairiest", "hairy", "halfway", "halfways", "halter", "hammier", "hammiest", "hammy", "handier", "handiest", "handy", "happier", "happiest", "happy", "hardier", "hardiest", "hardy", "hastier", "hastiest", "hasty", "haughtier", "haughtiest", "haughty", "hazier", "haziest", "hazy", "header", "headier", "headiest", "heady", "healthier", "healthiest", "healthy", "heartier", "heartiest", "hearty", "heavier", "heaviest", "heavy", "heftier", "heftiest", "hefty", "hep", "hepper", "heppest", "herbier", "herbiest", "herby", "hind", "hinder", "hip", "hipper", "hippest", "hippier", "hippiest", "hippy", "hoarier", "hoariest", "hoary", "holier", "holiest", "holy", "homelier", "homeliest", "homely", "homer", "homey", "homier", "homiest", "hornier", "horniest", "horny", "horsier", "horsiest", "horsy", "hot", "hotter", "hottest", "humpier", "humpiest", "humpy", "hunger", "hungrier", "hungriest", "hungry", "huskier", "huskiest", "husky", "icier", "iciest", "icy", "inkier", "inkiest", "inky", "insider", "interest", "jaggier", "jaggiest", "jaggy", "jammier", "jammiest", "jammy", "jauntier", "jauntiest", "jaunty", "jazzier", "jazziest", "jazzy", "jerkier", "jerkiest", "jerky", "jointer", "jollier", "jolliest", "jolly", "juicier", "juiciest", "juicy", "jumpier", "jumpiest", "jumpy", "kindlier", "kindliest", "kindly", "kinkier", "kinkiest", "kinky", "knottier", "knottiest", "knotty", "knurlier", "knurliest", "knurly", "kookier", "kookiest", "kooky", "lacier", "laciest", "lacy", "lairier", "lairiest", "lairy", "lakier", "lakiest", "laky", "lander", "lankier", "lankiest", "lanky", "lathier", "lathiest", "lathy", "layer", "lazier", "laziest", "lazy", "leafier", "leafiest", "leafy", "leakier", "leakiest", "leaky", "learier", "leariest", "leary", "leer", "leerier", "leeriest", "leery", "left-hander", "left-winger", "leggier", "leggiest", "leggy", "lengthier", "lengthiest", "lengthy", "ler", "leveler", "limier", "limiest", "limy", "lippier", "lippiest", "lippy", "liter", "livelier", "liveliest", "lively", "liver", "loather", "loftier", "loftiest", "lofty", "logier", "logiest", "logy", "lonelier", "loneliest", "lonely", "loner", "loonier", "looniest", "loony", "loopier", "loopiest", "loopy", "lordlier", "lordliest", "lordly", "lousier", "lousiest", "lousy", "lovelier", "loveliest", "lovely", "lowlander", "lowlier", "lowliest", "lowly", "luckier", "luckiest", "lucky", "lumpier", "lumpiest", "lumpy", "lunier", "luniest", "luny", "lustier", "lustiest", "lusty", "mad", "madder", "maddest", "mainer", "maligner", "maltier", "maltiest", "malty", "mangier", "mangiest", "mangy", "mankier", "mankiest", "manky", "manlier", "manliest", "manly", "mariner", "marshier", "marshiest", "marshy", "massier", "massiest", "massy", "matter", "maungier", "maungiest", "maungy", "mazier", "maziest", "mazy", "mealier", "mealiest", "mealy", "measlier", "measliest", "measly", "meatier", "meatiest", "meaty", "meeter", "merrier", "merriest", "merry", "messier", "messiest", "messy", "miffier", "miffiest", "miffy", "mightier", "mightiest", "mighty", "milcher", "milker", "milkier", "milkiest", "milky", "mingier", "mingiest", "mingy", "minter", "mirkier", "mirkiest", "mirky", "miser", "mistier", "mistiest", "misty", "mocker", "modeler", "modest", "moldier", "moldiest", "moldy", "moodier", "moodiest", "moody", "moonier", "mooniest", "moony", "mothier", "mothiest", "mothy", "mouldier", "mouldiest", "mouldy", "mousier", "mousiest", "mousy", "mouthier", "mouthiest", "mouthy", "muckier", "muckiest", "mucky", "muddier", "muddiest", "muddy", "muggier", "muggiest", "muggy", "multiplexer", "murkier", "murkiest", "murky", "mushier", "mushiest", "mushy", "muskier", "muskiest", "musky", "muster", "mustier", "mustiest", "musty", "muzzier", "muzziest", "muzzy", "nappier", "nappiest", "nappy", "nastier", "nastiest", "nasty", "nattier", "nattiest", "natty", "naughtier", "naughtiest", "naughty", "needier", "neediest", "needy", "nervier", "nerviest", "nervy", "newsier", "newsiest", "newsy", "niftier", "niftiest", "nifty", "nippier", "nippiest", "nippy", "nittier", "nittiest", "nitty", "noisier", "noisiest", "noisy", "northeasterner", "norther", "northerner", "nosier", "nosiest", "nosy", "number", "nuttier", "nuttiest", "nutty", "off", "offer", "oilier", "oiliest", "oily", "old-timer", "oliver", "oozier", "ooziest", "oozy", "opener", "outsider", "overcomer", "overnighter", "owner", "pallier", "palliest", "pally", "palmier", "palmiest", "palmy", "paltrier", "paltriest", "paltry", "pappier", "pappiest", "pappy", "parkier", "parkiest", "parky", "part-timer", "passer", "paster", "pastier", "pastiest", "pasty", "patchier", "patchiest", "patchy", "pater", "pawkier", "pawkiest", "pawky", "peachier", "peachiest", "peachy", "pearler", "pearlier", "pearliest", "pearly", "pedaler", "peppier", "peppiest", "peppy", "perkier", "perkiest", "perky", "peskier", "peskiest", "pesky", "peter", "pettier", "pettiest", "petty", "phonier", "phoniest", "phony", "pickier", "pickiest", "picky", "piggier", "piggiest", "piggy", "pinier", "piniest", "piny", "pitchier", "pitchiest", "pitchy", "pithier", "pithiest", "pithy", "planer", "plashier", "plashiest", "plashy", "platier", "platiest", "platy", "player", "pluckier", "pluckiest", "plucky", "plumber", "plumier", "plumiest", "plummier", "plummiest", "plummy", "plumy", "podgier", "podgiest", "podgy", "pokier", "pokiest", "poky", "polisher", "porkier", "porkiest", "porky", "porter", "portlier", "portliest", "portly", "poster", "pottier", "pottiest", "potty", "preachier", "preachiest", "preachy", "presenter", "pretender", "prettier", "prettiest", "pretty", "pricier", "priciest", "pricklier", "prickliest", "prickly", "pricy", "priestlier", "priestliest", "priestly", "prim", "primer", "primmer", "primmest", "princelier", "princeliest", "princely", "printer", "prissier", "prissiest", "prissy", "privateer", "privier", "priviest", "privy", "prompter", "prosier", "prosiest", "prosy", "pudgier", "pudgiest", "pudgy", "puffer", "puffier", "puffiest", "puffy", "pulpier", "pulpiest", "pulpy", "punchier", "punchiest", "punchy", "punier", "puniest", "puny", "pushier", "pushiest", "pushy", "pussier", "pussiest", "pussy", "quaggier", "quaggiest", "quaggy", "quakier", "quakiest", "quaky", "queasier", "queasiest", "queasy", "queenlier", "queenliest", "queenly", "racier", "raciest", "racy", "rainier", "rainiest", "rainy", "randier", "randiest", "randy", "rangier", "rangiest", "rangy", "ranker", "rattier", "rattiest", "rattlier", "rattliest", "rattly", "ratty", "raunchier", "raunchiest", "raunchy", "readier", "readiest", "ready", "recorder", "red", "redder", "reddest", "reedier", "reediest", "reedy", "renter", "retailer", "right-hander", "right-winger", "rimier", "rimiest", "rimy", "riskier", "riskiest", "risky", "ritzier", "ritziest", "ritzy", "roaster", "rockier", "rockiest", "rocky", "roilier", "roiliest", "roily", "rookier", "rookiest", "rooky", "roomier", "roomiest", "roomy", "ropier", "ropiest", "ropy", "rosier", "rosiest", "rosy", "rowdier", "rowdiest", "rowdy", "ruddier", "ruddiest", "ruddy", "runnier", "runniest", "runny", "rusher", "rushier", "rushiest", "rushy", "rustier", "rustiest", "rusty", "ruttier", "ruttiest", "rutty", "sad", "sadder", "saddest", "salter", "saltier", "saltiest", "salty", "sampler", "sandier", "sandiest", "sandy", "sappier", "sappiest", "sappy", "sassier", "sassiest", "sassy", "saucier", "sauciest", "saucy", "savvier", "savviest", "savvy", "scabbier", "scabbiest", "scabby", "scalier", "scaliest", "scaly", "scantier", "scantiest", "scanty", "scarier", "scariest", "scary", "scraggier", "scraggiest", "scragglier", "scraggliest", "scraggly", "scraggy", "scraper", "scrappier", "scrappiest", "scrappy", "scrawnier", "scrawniest", "scrawny", "screwier", "screwiest", "screwy", "scrubbier", "scrubbiest", "scrubby", "scruffier", "scruffiest", "scruffy", "scungier", "scungiest", "scungy", "scurvier", "scurviest", "scurvy", "seamier", "seamiest", "seamy", "second-rater", "seconder", "seedier", "seediest", "seedy", "seemlier", "seemliest", "seemly", "serer", "sexier", "sexiest", "sexy", "shabbier", "shabbiest", "shabby", "shadier", "shadiest", "shady", "shaggier", "shaggiest", "shaggy", "shakier", "shakiest", "shaky", "shapelier", "shapeliest", "shapely", "shier", "shiest", "shiftier", "shiftiest", "shifty", "shinier", "shiniest", "shiny", "shirtier", "shirtiest", "shirty", "shoddier", "shoddiest", "shoddy", "showier", "showiest", "showy", "shrubbier", "shrubbiest", "shrubby", "shy", "shyer", "shyest", "sicklier", "sickliest", "sickly", "sightlier", "sightliest", "sightly", "signaler", "signer", "silkier", "silkiest", "silky", "sillier", "silliest", "silly", "sketchier", "sketchiest", "sketchy", "skewer", "skimpier", "skimpiest", "skimpy", "skinnier", "skinniest", "skinny", "slaphappier", "slaphappiest", "slaphappy", "slatier", "slatiest", "slaty", "slaver", "sleazier", "sleaziest", "sleazy", "sleepier", "sleepiest", "sleepy", "slier", "sliest", "slim", "slimier", "slimiest", "slimmer", "slimmest", "slimsier", "slimsiest", "slimsy", "slimy", "slinkier", "slinkiest", "slinky", "slippier", "slippiest", "slippy", "sloppier", "sloppiest", "sloppy", "sly", "slyer", "slyest", "smarmier", "smarmiest", "smarmy", "smellier", "smelliest", "smelly", "smokier", "smokiest", "smoky", "smug", "smugger", "smuggest", "snakier", "snakiest", "snaky", "snappier", "snappiest", "snappy", "snatchier", "snatchiest", "snatchy", "snazzier", "snazziest", "snazzy", "sneaker", "sniffier", "sniffiest", "sniffy", "snootier", "snootiest", "snooty", "snottier", "snottiest", "snotty", "snowier", "snowiest", "snowy", "snuffer", "snuffier", "snuffiest", "snuffy", "snug", "snugger", "snuggest", "soapier", "soapiest", "soapy", "soggier", "soggiest", "soggy", "solder", "sonsier", "sonsiest", "sonsy", "sootier", "sootiest", "sooty", "soppier", "soppiest", "soppy", "sorrier", "sorriest", "sorry", "soupier", "soupiest", "soupy", "souther", "southerner", "speedier", "speediest", "speedy", "spicier", "spiciest", "spicy", "spiffier", "spiffiest", "spiffy", "spikier", "spikiest", "spiky", "spindlier", "spindliest", "spindly", "spinier", "spiniest", "spiny", "splashier", "splashiest", "splashy", "spongier", "spongiest", "spongy", "spookier", "spookiest", "spooky", "spoonier", "spooniest", "spoony", "sportier", "sportiest", "sporty", "spottier", "spottiest", "spotty", "spreader", "sprier", "spriest", "sprightlier", "sprightliest", "sprightly", "springer", "springier", "springiest", "springy", "spry", "squashier", "squashiest", "squashy", "squat", "squatter", "squattest", "squattier", "squattiest", "squatty", "squiffier", "squiffiest", "squiffy", "stagier", "stagiest", "stagy", "stalkier", "stalkiest", "stalky", "stapler", "starchier", "starchiest", "starchy", "starer", "starest", "starrier", "starriest", "starry", "statelier", "stateliest", "stately", "steadier", "steadiest", "steady", "stealthier", "stealthiest", "stealthy", "steamier", "steamiest", "steamy", "stingier", "stingiest", "stingy", "stiper", "stocker", "stockier", "stockiest", "stocky", "stodgier", "stodgiest", "stodgy", "stonier", "stoniest", "stony", "stormier", "stormiest", "stormy", "streakier", "streakiest", "streaky", "streamier", "streamiest", "streamy", "stretcher", "stretchier", "stretchiest", "stretchy", "stringier", "stringiest", "stringy", "striper", "stripier", "stripiest", "stripy", "strong", "stronger", "strongest", "stroppier", "stroppiest", "stroppy", "stuffier", "stuffiest", "stuffy", "stumpier", "stumpiest", "stumpy", "sturdier", "sturdiest", "sturdy", "submariner", "sulkier", "sulkiest", "sulky", "sultrier", "sultriest", "sultry", "sunnier", "sunniest", "sunny", "surlier", "surliest", "surly", "swagger", "swankier", "swankiest", "swanky", "swarthier", "swarthiest", "swarthy", "sweatier", "sweatiest", "sweaty", "tackier", "tackiest", "tacky", "talkier", "talkiest", "talky", "tan", "tangier", "tangiest", "tangy", "tanner", "tannest", "tardier", "tardiest", "tardy", "tastier", "tastiest", "tasty", "tattier", "tattiest", "tatty", "tawdrier", "tawdriest", "tawdry", "techier", "techiest", "techy", "teenager", "teenier", "teeniest", "teeny", "teetotaler", "tester", "testier", "testiest", "testy", "tetchier", "tetchiest", "tetchy", "thin", "thinner", "thinnest", "third-rater", "thirstier", "thirstiest", "thirsty", "thornier", "thorniest", "thorny", "threadier", "threadiest", "thready", "thriftier", "thriftiest", "thrifty", "throatier", "throatiest", "throaty", "tidier", "tidiest", "tidy", "timelier", "timeliest", "timely", "tinier", "tiniest", "tinnier", "tinniest", "tinny", "tiny", "tipsier", "tipsiest", "tipsy", "tonier", "toniest", "tony", "toothier", "toothiest", "toothy", "toper", "touchier", "touchiest", "touchy", "trader", "trashier", "trashiest", "trashy", "trendier", "trendiest", "trendy", "trickier", "trickiest", "tricksier", "tricksiest", "tricksy", "tricky", "trim", "trimer", "trimmer", "trimmest", "true", "truer", "truest", "trustier", "trustiest", "trusty", "tubbier", "tubbiest", "tubby", "turfier", "turfiest", "turfy", "tweedier", "tweediest", "tweedy", "twiggier", "twiggiest", "twiggy", "uglier", "ugliest", "ugly", "unfriendlier", "unfriendliest", "unfriendly", "ungainlier", "ungainliest", "ungainly", "ungodlier", "ungodliest", "ungodly", "unhappier", "unhappiest", "unhappy", "unhealthier", "unhealthiest", "unhealthy", "unholier", "unholiest", "unholy", "unrulier", "unruliest", "unruly", "untidier", "untidiest", "untidy", "vastier", "vastiest", "vasty", "vest", "viewier", "viewiest", "viewy", "wackier", "wackiest", "wacky", "wan", "wanner", "wannest", "warier", "wariest", "wary", "washier", "washiest", "washy", "waster", "wavier", "waviest", "wavy", "waxier", "waxiest", "waxy", "weaklier", "weakliest", "weakly", "wealthier", "wealthiest", "wealthy", "wearier", "weariest", "weary", "webbier", "webbiest", "webby", "weedier", "weediest", "weedy", "weenier", "weeniest", "weensier", "weensiest", "weensy", "weeny", "weepier", "weepiest", "weepy", "weightier", "weightiest", "weighty", "well", "welsher", "wet", "wetter", "wettest", "whackier", "whackiest", "whacky", "whimsier", "whimsiest", "whimsy", "wholesaler", "wieldier", "wieldiest", "wieldy", "wilier", "wiliest", "wily", "windier", "windiest", "windy", "winier", "winiest", "winterier", "winteriest", "wintery", "wintrier", "wintriest", "wintry", "winy", "wirier", "wiriest", "wiry", "wispier", "wispiest", "wispy", "wittier", "wittiest", "witty", "wonkier", "wonkiest", "wonky", "woodier", "woodiest", "woodsier", "woodsiest", "woodsy", "woody", "woollier", "woolliest", "woolly", "woozier", "wooziest", "woozy", "wordier", "wordiest", "wordy", "worldlier", "worldliest", "worldly", "wormier", "wormiest", "wormy", "worse", "worst", "worthier", "worthiest", "worthy", "wrier", "wriest", "wry", "wryer", "wryest", "yare", "yarer", "yarest", "yeastier", "yeastiest", "yeasty", "young", "younger", "youngest", "yummier", "yummiest", "yummy", "zanier", "zaniest", "zany", "zippier", "zippiest", "zippy"]
    call writegooder#add_highlights("Adjectives", adjectives)

    " 7 words you can't say on TV
    let swears = ["shit", "piss", "fuck", "cunt", "cocksucker", "motherfucker", "tits" ]
    call writegooder#add_highlights("Swears", swears)

    let w:writegooder_on = 0
  endif
endfunction

"
" Turn on all match highlighting
"
function! writegooder#enable()
    call writegooder#init()
    if empty(w:writegooder_on)
        let w:writegooder_on = 1
        " Highlight duplicates
        call writegooder#highlight_dups()
        " Highlight weasel words
        highlight link WeaselWords Error
        " Highlight passive voice
        call writegooder#highlight_passive()
        " Highlight adjectives
        highlight link Adjectives Error
        " Highlight swears
        highlight link Swears Error
        " Highlight words to avoid
        call writegooder#avoid_words()
        " Highlight non-eprime words
        call writegooder#eprime()
    endif
endfunction

"
" Deletes all matches
"
function! writegooder#disable()
    call writegooder#init()
    if !empty(w:writegooder_on)
        call matchdelete(s:dups)
        highlight link WeaselWords None
        call matchdelete(s:passive)
        highlight link Adjectives None
        highlight link Swears None
        call matchdelete(s:avoid)
        call matchdelete(s:eprime)
        let w:writegooder_on = 0
    endif
endfunction!

"
" Pattern for highlighting duplicate words, works across lines.
"
function! writegooder#highlight_dups()
    let s:dups=matchadd('Error', '\v(<\w+>)\_s*<\1>', 10)
endfunction

"
" Passive words take from Matt Might's blog.
" There could (must be) a better way to do this!
"
function! writegooder#highlight_passive()
    let irregulars='awoken|been|born|beat|become|begun|bent|beset|bet|bid|bidden|bound|bitten|bled|blown|broken|bred|brought|broadcast|built|burnt|burst|bought|cast|caught|chosen|clung|come|cost|crept|cut|dealt|dug|dived|done|drawn|dreamt|driven|drunk|eaten|fallen|fed|felt|fought|found|fit|fled|flung|flown|forbidden|forgotten|foregone|forgiven|forsaken|frozen|gotten|given|gone|ground|grown|hung|heard|hidden|hit|held|hurt|kept|knelt|knit|known|laid|led|leapt|learnt|left|lent|let|lain|lighted|lost|made|meant|met|misspelt|mistaken|mown|overcome|overdone|overtaken|overthrown|paid|pled|proven|put|quit|read|rid|ridden|rung|risen|run|sawn|said|seen|sought|sold|sent|set|sewn|shaken|shaven|shorn|shed|shone|shod|shot|shown|shrunk|shut|sung|sunk|sat|slept|slain|slid|slung|slit|smitten|sown|spoken|sped|spent|spilt|spun|spit|split|spread|sprung|stood|stolen|stuck|stung|stunk|stridden|struck|strung|striven|sworn|swept|swollen|swum|swung|taken|taught|torn|told|thought|thrived|thrown|thrust|trodden|understood|upheld|upset|woken|worn|woven|wed|wept|wound|won|withheld|withstood|wrung|written'
    let s:passive=matchadd('Error','\c\v<(am|are|were|being|is|been|was|be)>\s(\w+ed|(' . irregulars . '))>', 10)
endfunction

"
" Words to Avoid in Educational Writing
" https://css-tricks.com/words-avoid-educational-writing/
" 31 Words and Phrases You No Longer Need
" https://www.grammarly.com/blog/words-you-no-longer-need/
"
function! writegooder#avoid_words()
  let avoid='obviously|basically|simply|essentially|of course|clearly|just|everyone knows|however|so|easy|at all times|each and every|as yet|in order|totally|completely|absolutely|literally|actually|very|really|quite|rather|extremely|in the process of|as a matter of fact|all of|as being|during the course of|for all intents and purposes|for the most part|point in time|up|down'
  let s:avoid=matchadd('Error','\c\v<(' . avoid . ')>', 10)
endfunction

"
" E-Prime
" https://en.wikipedia.org/wiki/E-Prime
" excludes all forms of the verb `to be`
"

function! writegooder#eprime()
  let eprime="be\|being\|been\|am\|is\|are\|was\|were\|maybe\|isn't\|aren't\|wasn't\|weren't\|I'm\|you're\|we're\|they're\|he's\|she's\|it's\|there's\|here's\|where's\|how's\|what's\|who's\|that's"
  let s:eprime=matchadd('Error','\c\v<(' . eprime . ')>', 10)
endfunction



"
" Fix common misused phrases
"

function! writegooder#misused_phrase()
" 1: Nip it in the butt vs. Nip it in the bud
" 2: I could care less vs. I couldn’t care less
" 3: One in the same vs.One and the same
" 4: You’ve got another thing coming vs. You’ve got another think coming
" 5: Each one worse than the next vs. Each one worse than the last
" 6: On accident vs. By accident
" 7: Statue of limitations vs. Statute of limitations
" 8: For all intensive purposes vs. For all intents and purposes
" 9: He did good vs. He did well
" 10: Extract revenge vs. Exact revenge
" 11: Old timer’s disease vs. Alzheimer’s Disease
" 12: I’m giving you leadway vs. I’m giving you leeway
" 13: Aks vs. Ask
" 14: What’s your guyses opinion? vs. What’s your opinion, guys?
" 15: Expresso vs. Espresso
" 16: Momento vs. Memento
" 17: Irregardless vs. Regardless
" 18: Sorta vs. Sort of
" 18b: Kinda vs. Kind of
" 19: Conversating vs. Conversing
" 20: Scotch free and Scott free vs. Scot free
" 22: Curl up in the feeble position vs. Curl up in the fetal position
" 23: Phase vs. Faze
" 24: Hone in vs. Home in
" 25: Brother in laws vs. Brothers in law
endfunction
