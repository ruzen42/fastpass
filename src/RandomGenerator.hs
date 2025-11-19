module RandomGenerator (generatePasswordAsync) where

import System.Random
import Control.Monad (replicateM)
import Data.Char (ord, chr)
import Control.Concurrent.Async (async, wait, Async)

generatePasswordAsync :: Int -> Text -> IO (Async Text)
generatePasswordAsync len list = async $ do
    g <- newStdGen
    let
        getRandomChar :: StdGen -> (Char, StdGen)
        getRandomChar gen =
            let (idx, newGen) = randomR (0, length list - 1) gen
            in (list !! idx, newGen)

        buildPassword :: Int -> StdGen -> String
        buildPassword 0 _ = []
        buildPassword n currentGen =
            let (char, nextGen) = getRandomChar currentGen
            in char : buildPassword (n - 1) nextGen

    return $ buildPassword len g

