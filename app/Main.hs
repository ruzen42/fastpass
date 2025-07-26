module Main where

import RandomGenerator

main :: IO ()
main = do 
  password <- RandomGenerator.generatePassword 8
  putStrLn password
