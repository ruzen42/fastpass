module Main where

import RandomGenerator
import Control.Concurrent.Async (wait)

main :: IO ()
main = do 
  task <- RandomGenerator.generatePasswordAsync 8
  password <- wait task 
  putStrLn password
