module Main where

import RandomGenerator
import Control.Concurrent.Async (wait)
import Options.Applicative

data Options = Options
  { passwordSize :: Int 
  }

main :: IO ()
main = do
  options <- execParser parserInfo
  let size = passwordSize options
  task <- RandomGenerator.generatePasswordAsync size
  password <- wait task
  putStrLn password

optionsParser :: Parser Options
optionsParser = Options
  <$> option auto 
    ( long "lenght"
   <> short 'l'
   <> metavar "LENGHT" 
   <> help "Length for your password"
   <> showDefault
   <> value 8 
    )

parserInfo :: ParserInfo Options
parserInfo = info (optionsParser <**> helper)
  ( fullDesc
 <> progDesc "simple program to generate password"
 <> header "fastpass - password generator"
  )
