module HaskellFormatImport.Plugin (haskellFormatImport) where

import Neovim
import Neovim.API.String

getWindow :: NvimObject Window

-- | Neovim is not really good with big numbers, so we return a String here.
haskellFormatImport :: Neovim env String
haskellFormatImport = do
    win <- getWindow
    print $ show win
    return "bob"

