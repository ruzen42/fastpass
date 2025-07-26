{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_fastpass (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "fastpass"
version :: Version
version = Version [0,1,0,0] []

synopsis :: String
synopsis = "simple passwords generation program"
copyright :: String
copyright = "\"2025 Jaroslav Mihajlenko\""
homepage :: String
homepage = "https://github.com/ruzen42/fastpass"
