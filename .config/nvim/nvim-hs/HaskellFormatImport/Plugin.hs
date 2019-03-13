module HaskellFormatImport.Plugin (haskellFormatImport) where

import Neovim

-- | Neovim is not really good with big numbers, so we return a String here.
haskellFormatImport :: Int -> Neovim env String
haskellFormatImport n = return "bob"

