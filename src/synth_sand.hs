{-# LANGUAGE Arrows #-}
import Data.List
import System.IO
import Euterpea

-- https://github.com/Euterpea/Euterpea2-Examples/blob/master/SignalLevel/SineWaves.lhs

mel1 :: Music Pitch
mel1 = Prim (Note hn (C,4)) :+: Prim (Note hn (E,4)) :+:
    Prim (Note hn (G,4)) :+: Prim (Note hn (C,5))

sineTable :: Table
sineTable = tableSinesN 4096 [1]
sine440 :: AudSF () Double
sine440 = proc _ -> do
    y <- osc sineTable 0 -< 440
    returnA -< y
testSine440 :: IO ()
testSine440 = outFile "./sine440.wav" 2.0 sine440

-- devices, this will show input and output devices
