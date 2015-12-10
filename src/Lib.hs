module Lib where

import Shelly

import Csound.Base hiding (Instr)
import Csound.Patch
import Data.String
import Data.List

type Patch2m = Patch Sig Sig2

data Ins   = Mono (Patch2m) | Poly Patch2
type Instr = (String, Ins)

data Cat = Cat String [Instr]

type Lib = [Cat]

stereoPiano ::  Patch D Sig -> Patch2
stereoPiano f = Patch 
    { patchInstr = at fromMono . patchInstr f
    , patchFx   = patchFx epiano1
    }

instrs :: [Cat]
instrs = 
    [ Cat "epianos" 
        [ ("Epiano 1",          Poly epiano1)
        , ("Epiano 2",          Poly epiano2)
        , ("Epiano 3",          Poly vibraphonePiano1)
        , ("Bright piano",      Poly epianoBright)
        , ("Heavy piano",       Poly epianoHeavy)
        , ("FM piano",          Poly fmPiano)
        , ("AM piano",          Poly $ stereoPiano amPiano)
        , ("Muted piano",       Poly mutedPiano)        
        ]
    , Cat "pads" 
        [ ("Night pad",         Poly nightPad)
        , ("Overtone pad",      Poly overtonePad)
        , ("Chorusel pad",      Poly chorusel)
        , ("Cave overtone pad", Poly caveOvertonePad)
        , ("Razor pad",         Poly razorPad)
        , ("Dream pad",         Poly dreamPad)
        , ("Tri pad",           Poly triPad)
        , ("Pw pad",            Poly pwPad)
        , ("Pw ensemble",       Poly pwEnsemble)
        , ("Underwater pad",    Poly underwaterPad)
        , ("Whale song pad",    Poly whaleSongPad)
        , ("Light is too bright", Poly lightIsTooBrightPad)
        , ("FM drone slow",     Poly fmDroneSlow)
        , ("FM drone medium",   Poly fmDroneMedium)
        , ("FM drone fast",   Poly fmDroneFast)
        ]
    , Cat "deep-pads" 
        [ ("Night pad",         Poly $ deepPad nightPad)
        , ("Overtone pad",      Poly $ deepPad overtonePad)
        , ("Chorusel pad",      Poly $ deepPad chorusel)
        , ("Cave overtone pad", Poly $ deepPad caveOvertonePad)
        , ("Razor pad",         Poly $ deepPad razorPad)
        , ("Dream pad",         Poly $ deepPad dreamPad)
        , ("Tri pad",           Poly $ deepPad triPad)
        , ("Pw pad",            Poly $ deepPad pwPad)
        , ("Pw ensemble",       Poly $ deepPad pwEnsemble)
        , ("Underwater pad",    Poly $ deepPad underwaterPad)
        , ("Whale song pad",    Poly $ deepPad whaleSongPad)
        , ("Light is too bright", Poly $ deepPad lightIsTooBrightPad)
        , ("FM drone slow",     Poly $ deepPad fmDroneSlow)
        , ("FM drone medium",   Poly $ deepPad fmDroneMedium)
        , ("FM drone fast",   Poly $ deepPad fmDroneFast)
        ]
    , Cat "orchestra-pad"
        [ ("Violin",            Poly $ padSharc shViolin)
        , ("Viola",             Poly $ padSharc shViola)
        , ("Tuba",              Poly $ padSharc shTuba)
        , ("Trombone",          Poly $ padSharc shTrombone)
        , ("Oboe",              Poly $ padSharc shOboe)
        , ("French Horn",       Poly $ padSharc shFrenchHorn)
        , ("Flute",             Poly $ padSharc shFlute)
        , ("Trumpet",           Poly $ padSharc shTrumpetC)
        , ("Cello",             Poly $ padSharc shCello)
        , ("Cello Muted",       Poly $ padSharc shCelloMuted)
        , ("Contrabass",        Poly $ padSharc shContrabass)
        , ("Clarinet",          Poly $ padSharc shClarinet)
        , ("Bass Clarinet",     Poly $ padSharc shBassClarinet)
        , ("English Horn",      Poly $ padSharc shEnglishHorn)
        , ("Alto Flute",        Poly $ padSharc shAltoFlute)
        , ("Alto Trombone",     Poly $ padSharc shAltoTrombone)
        , ("Bassoon",           Poly $ padSharc shBassoon)
        , ("Viola Bowing",      Poly $ padSharc shViolaMarteleBowing)
        , ("Violin Bowing",     Poly $ padSharc shViolinMarteleBowing)
        ]

    , Cat "deep-orchestra-pad"
        [ ("Violin",            Poly $ deepPad $ padSharc shViolin)
        , ("Viola",             Poly $ deepPad $ padSharc shViola)
        , ("Tuba",              Poly $ deepPad $ padSharc shTuba)
        , ("Trombone",          Poly $ deepPad $ padSharc shTrombone)
        , ("Oboe",              Poly $ deepPad $ padSharc shOboe)
        , ("French Horn",       Poly $ deepPad $ padSharc shFrenchHorn)
        , ("Flute",             Poly $ deepPad $ padSharc shFlute)
        , ("Trumpet",           Poly $ deepPad $ padSharc shTrumpetC)
        , ("Cello",             Poly $ deepPad $ padSharc shCello)
        , ("Cello Muted",       Poly $ deepPad $ padSharc shCelloMuted)
        , ("Contrabass",        Poly $ deepPad $ padSharc shContrabass)
        , ("Clarinet",          Poly $ deepPad $ padSharc shClarinet)
        , ("Bass Clarinet",     Poly $ deepPad $ padSharc shBassClarinet)
        , ("English Horn",      Poly $ deepPad $ padSharc shEnglishHorn)
        , ("Alto Flute",        Poly $ deepPad $ padSharc shAltoFlute)
        , ("Alto Trombone",     Poly $ deepPad $ padSharc shAltoTrombone)
        , ("Bassoon",           Poly $ deepPad $ padSharc shBassoon)
        , ("Viola Bowing",      Poly $ deepPad $ padSharc shViolaMarteleBowing)
        , ("Violin Bowing",     Poly $ deepPad $ padSharc shViolinMarteleBowing)
        ]
    , Cat "organs" 
        [ ("Hammond organ",     Poly hammondOrgan)
        , ("Cathedral organ",   Poly cathedralOrgan)
        , ("Tonewheel organ",   Poly toneWheelOrgan)
        , ("Triangle wave",     Poly triOrgan)
        , ("Sawtooth wave",     Poly sawOrgan)
        , ("Square wave",       Poly sqrOrgan)        
        ]
    , Cat "accordeons" 
        [ ("Accordeon",         Poly accordeon)
        , ("Bright accordeon 1",Poly accordeonBright1)
        , ("Bright accordeon 2",Poly accordeonBright2)
        , ("Broken accordeon",  Poly brokenAccordeon)
        ]
    , Cat "basses" 
        [ ("Acoustic bass",     Poly simpleBass)
        , ("Tech bass",         Poly pwBass)
        , ("Deep acoustic bass", Poly $ withDeepBass 0.5 simpleBass)
        , ("Deep tech bass",    Poly $ withDeepBass 0.5 pwBass)
        ]
    , Cat "striken"
        [ ("Vibraphone 1",      Poly vibraphone1)
        , ("Vibraphone 2",      Poly vibraphone2)
        , ("Xylophone",         Poly xylophone)
        , ("Banyan",            Poly banyan)
        , ("Magic Banyan",      Poly magicBanyan)
        , ("Dahina",            Poly dahina)
        , ("Potlid",            Poly potLid)
        , ("Bell",              Poly tubularBell)
        , ("Wood block",        Poly woodBlock)
        , ("Wine glass",        Poly wineGlass)
        , ("Tibetan bowl",      Poly tibetanBowl152)
        , ("Magic tibetan bowl",Poly magicTibetanBowl180)
        , ("Noisy bell",        Poly noiseBell)
        , ("Noisy marimba",     Poly black)
        , ("Impulse marimba",   Poly impulseMarimba1)
        , ("Simple marimba",    Poly simpleMarimba)
        , ("Sparkle",           Poly blue)
        ]
    , Cat "scraped" 
        [ ("Vibraphone",        Poly scrapeVibraphone1)
        , ("Xylophone",         Poly scrapeXylophone)
        , ("Dahina",            Poly scrapeDahina)
        , ("Tibetan bowl",      Poly scrapeTibetanBowl152)
        , ("Banyan",            Poly scrapeBanyan)
        ]
    , Cat "choir"
        [ ("Choir A",           Poly choirA)
        , ("Choir O",           Poly choirO)
        , ("Choir E",           Poly choirE)
        , ("Choir U",           Poly choirU)
        , ("Noisy choir",       Poly noisyChoir)
        , ("Wind sings",        Poly windSings)
        ]
    , Cat "lead-mono"
        [ ("Nighty lead",       Mono nightPadm)
        , ("Poly synth lead",   Mono polySynthm)
        , ("Hammond lead",      Mono hammondOrganm)  
        , ("Dream lead",        Mono dreamPadm)      
        , ("Underwater lead",   Mono underwaterPadm)
        , ("Whale song lead",   Mono whaleSongPadm)
        , ("Chorusel lead",     Mono choruselm)
        , ("Pw lead",           Mono pwPadm)
        ]
    , Cat "lead-poly"
        [ ("Phasing synth lead",Poly phasingLead)
        , ("Poly synth lead",   Poly polySynth)
        , ("Razor lead",        Poly razorLead)
        , ("Razor lead fast",   Poly razorLeadFast)
        , ("Razor lead tremolo",Poly razorLeadTremolo)
        ] 
    , Cat "x-rays"
        [ ("Noizz",             Poly noiz)
        , ("Alien is angry",    Poly alienIsAngry)
        , ("Computer chat",     Poly okComputer)
        , ("Xanadu",            Poly xanadu)
        , ("Pulse width",       Poly pulseWidth)
        , ("Robot A",           Poly $ robotVowel maleA)
        , ("Robot O",           Poly $ robotVowel maleO)
        , ("Robot E",           Poly $ robotVowel maleE)
        , ("Robot IY",          Poly $ robotVowel maleIY)
        ]
    , Cat "plucked" 
        [ ("guitar",            Poly guitar)
        , ("harpsichord",       Poly harpsichord)
        ]
    , Cat "nature" 
        [ ("wind",               Poly wind)
        , ("Wind wall",          Poly windWall)
        , ("Mild wind",          Poly mildWind)
        ]
    ]

catNames :: [String]
catNames = fmap (\(Cat name _) -> name) instrs

count :: Int
count = sum $ fmap (\(Cat _ xs) -> length xs) instrs

rootName = "instruments"

------------------------------------------------------------

clear :: IO ()
clear = shelly $ do
    rm_rf (fromString rootName)
    bootstrap 
    where 
        bootstrap = do
            mkdir (fromString rootName)
            chdir (fromString rootName) $
                mapM_ (mkdir . fromString) catNames


all' = const True

updateInstr name = genPopulate all' ( == name)
updateCat   name = genPopulate ( == name) all'

updateInstrs name = genPopulate all' (name `isInfixOf` )
updateCats   name = genPopulate (name `isInfixOf` ) all'

populate = genPopulate all' all'

genPopulate catFilter instrFilter = mapM_ renderCat $ filter (\(Cat name _) -> catFilter name) instrs
    where
        renderCat (Cat name xs) = mapM_ (renderInstr name) $ filter (instrFilter . fst) xs
        renderInstr catName (instrName, instr) = mkInstr (mkPath catName instrName) 1 instr
        mkPath catName instrName = rootName ++ "/" ++ catName ++ "/" ++ instrName ++ ".csd"



------------------------------------------------------------

mkInstr :: String -> Sig -> Ins -> IO ()
mkInstr name scale x = case x of
    Mono a -> mkInstrMono name scale a
    Poly a -> mkInstrPoly name scale a

mkInstrMono :: String -> Sig -> Patch2m -> IO ()
mkInstrMono path scale p = writeCsdBy setDac path $ do
    vol <- chnGetCtrl (text "volume")
    monoPatchByNameMidi "main" (mul (scale * vol) p)

mkInstrPoly :: String -> Sig -> Patch2 -> IO ()
mkInstrPoly path scale p = writeCsdBy setDac path $ do
    vol <- chnGetCtrl (text "volume")
    patchByNameMidi "main" (mul (scale * vol) p)
