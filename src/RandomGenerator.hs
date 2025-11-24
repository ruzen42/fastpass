{-# LANGUAGE OverloadedStrings #-}

module RandomGenerator (generatePasswordAsync) where

import System.Random
import Control.Monad (replicateM)
import Data.Char (ord, chr)
import Control.Concurrent.Async (async, wait, Async)
import qualified Data.Text as T

generatePasswordAsync :: Int -> T.Text -> IO (Async T.Text)
generatePasswordAsync len inputText = async $ do
    g <- newStdGen
    let
        getRandomChar :: StdGen -> (Char, StdGen)
        getRandomChar gen =
            let (idx, newGen) = randomR (0, T.length inputText - 1) gen
            in (T.index inputText idx, newGen)

        buildPassword :: Int -> StdGen -> T.Text
        buildPassword 0 _ = T.empty
        buildPassword n currentGen =
            let (char, nextGen) = getRandomChar currentGen
            in T.singleton char <> buildPassword (n - 1) nextGen

    return $ buildPassword len g
