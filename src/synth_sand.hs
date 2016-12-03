{-# LANGUAGE Arrows #-}
import Data.List
import System.IO
import Euterpea

-- SOURCES:
-- https://github.com/Euterpea/Euterpea2-Examples/blob/master/SignalLevel/SineWaves.lhs
-- http://54.187.142.212/working-with-midi-on-mac-os-x/
--
-- TO USE
-- Download simple synth (http://notahat.com/simplesynth/)
-- Make sure your midi is set up
--      (http://54.187.142.212/working-with-midi-on-mac-os-x/)
-- Run simple synth
-- Run ghci
--      :l synth_sand.hs
--      play mel1
--      play chord01
--      testSine440
--

-- Eamples of ways to make melodies in Euterpea2
mel1, mel2, mel3, mel4, mel5 :: Music Pitch
mel1 = Prim (Note hn (C,4)) :+: Prim (Note hn (E,4)) :+:
    Prim (Note hn (G,4)) :+: Prim (Note hn (C,5))
mel2 = note qn (C,4) :+: note qn (E,4) :+: note qn (G,4) :+: note qn (C,5)
mel3 = c 4 qn :+: e 4 qn :+: g 4 qn :+: c 5 qn
mel4 = line [c 4 qn, e 4 qn, g 4 qn, c 5 qn]
mel5 = line $ map ($qn) [c 4, e 4, g 4, c 5]

chord01, combo1 :: Music Pitch
chord01 = chord $ map ($qn) [c 4, e 4, g 4, c 5]
combo1 = c 4 qn :+: e 4 qn :=: g 4 qn :+: c 5 qn

myMel1 = line [c 4 en, c 4 en, g 4 en, g 4 en, a 4 en, a 4 en, g 4 qn]
myMel2 = Modify (Phrase [Tmp $ Ritardando 0.5]) myMel1
myMel3 = Modify (Phrase [Tmp $ Accelerando 0.5]) myMel1
myMel4 = Modify (Phrase [Dyn $ Diminuendo 0.8]) $ addVolume 100 myMel1
myMel5 = Modify (Phrase [Dyn $ Crescendo 2.0]) $ addVolume 50 myMel1
myMel6 = Modify (Tempo 2) myMel1
myMel7 = Modify (Tempo 0.3) myMel1

-- Example function of a musical line
octUp :: Music Pitch -> Music Pitch
octUp (Prim (Note d (p,o))) = note d (p, o+1)
octUp (Prim (Rest d)) = rest d
octUp (m1 :+: m2) = octUp m1 :+: octUp m2
octUp (m1 :=: m2) = octUp m1 :=: octUp m2
octUp (Modify c m) = Modify c (octUp m)

-- make the sine table, a concert A pitch, and a function that writes 2 sec of
-- this pitch to a .wav
sineTable :: Table
sineTable = tableSinesN 4096 [1]
sine440 :: AudSF () Double
sine440 = proc _ -> do
    y <- osc sineTable 0 -< 440
    returnA -< y
testSine440 :: IO ()
testSine440 = outFile "./sine440.wav" 2.0 sine440

-- make an instrument
sineInstr :: Instr (Mono AudRate)
sineInstr dur pch vol params =
     let freq = apToHz pch
     in  proc _ -> do
         y <- osc sineTable 0 -< freq
         returnA -< y

-- devices, this will show input and output devices for MIDI
-- TODO: setup the MIDI so I can do live input/output
-- in ghci, with :l synth_sand.hs, type testSine440 to make it output the .wav

cminor = [c 4, ef 4, g 4]
arp1 = map ($sn) cminor
mel6, mel7 :: Music Pitch
mel6 = line(take 10 (repeat (ef 4 qn)))
mel7 = line(take 9 (concat (repeat arp1)))
cho1 = chord $ map ($qn) cminor

