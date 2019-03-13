{-# LANGUAGE OverloadedStrings #-}
module HaskellFormatImport.Plugin (haskellFormatImport) where

import Data.Maybe
import Neovim

-- | Neovim is not really good with big numbers, so we return a String here.
haskellFormatImport :: CommandArguments -> Neovim env Int
haskellFormatImport (CommandArguments _ range _ _) = do
    let (x,y) = fromMaybe 0 range
    return y

