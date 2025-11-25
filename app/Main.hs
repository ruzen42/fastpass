module Main where

import RandomGenerator
import Control.Concurrent.Async (wait)
import Options.Applicative
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

data Options = Options
  { passwordSize :: Int
  , listSymbols  :: T.Text
  }

main :: IO ()
main = do
  options <- execParser parserInfo
  let size = passwordSize options
      list = listSymbols  options
  password <- RandomGenerator.generatePasswordParallel size list
  TIO.putStrLn password

defaultList :: T.Text
defaultList = T.pack $ ['a'..'b'] ++ ['0'..'9'] ++ ['A'..'Z'] ++ ['!'..'?']

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
 <> progDesc "simple async program to generate password,\n using fastpass <number>"
 <> header "fastpass - password generator written in Haskell"
  )
