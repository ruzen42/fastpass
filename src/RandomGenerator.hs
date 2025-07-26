module RandomGenerator (generatePasswordAsync) where

import System.Random
import Control.Monad (replicateM)
import Data.Char (ord, chr)
import Control.Concurrent.Async (async, wait, Async)

charSet :: String 
charSet = ['a'..'z'] ++ ['A'..'Z'] ++ ['0'..'9'] ++ "!@#$%^&*(){}\\=-<>:~"

generatePasswordAsync :: Int -> IO (Async String)
generatePasswordAsync len = async $ do
    g <- newStdGen
    let
        getRandomChar :: StdGen -> (Char, StdGen)
        getRandomChar gen =
            let (idx, newGen) = randomR (0, length charSet - 1) gen
            in (charSet !! idx, newGen)

        buildPassword :: Int -> StdGen -> String
        buildPassword 0 _ = []
        buildPassword n currentGen =
            let (char, nextGen) = getRandomChar currentGen
            in char : buildPassword (n - 1) nextGen

    return $ buildPassword len g

