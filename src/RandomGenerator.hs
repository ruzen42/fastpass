{-# LANGUAGE OverloadedStrings #-}

module RandomGenerator (generatePasswordParallel) where

import System.Random
import Control.Monad (replicateM)
import Data.Char (ord, chr)
import Control.Parallel.Strategies
import qualified Data.Text as T

generatePasswordParallel :: Int -> T.Text -> IO T.Text
generatePasswordParallel len inputText = do
    g <- newStdGen
    let indices = take len $ randomRs (0, T.length inputText - 1) g
        chars   = map (T.index inputText) indices `using` parList rseq
    return $ T.pack chars
