module Main where

import RandomGenerator
import Control.Concurrent.Async (wait)
import Options.Applicative

data Options = Options
  { passwordSize :: Int
  , listSymbols  :: Text
  }

main :: IO ()
main = do
  options <- execParser parserInfo
  let size = passwordSize options
  task <- RandomGenerator.generatePasswordAsync size
  password <- wait task
  putStrLn password

defaultList :: Text
defaultList = ['a'..'b'] ++ ['0'..'9'] ++ ['A'..'Z'] ++ ['!'++'?']

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
  <*> strOption
     ( long "list"
    <> short 'L'
    <> metavar "LIST"
    <> help "Symbols for generate"
    <> value defaultList )

parserInfo :: ParserInfo Options
parserInfo = info (optionsParser <**> helper)
  ( fullDesc
 <> progDesc "simple program to generate password,\n using fastpass <number>"
 <> header "fastpass - password generator written in Haskell"
  )
