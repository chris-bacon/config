{-# LANGUAGE OverloadedStrings #-}
module HaskellFormatImport.Plugin (haskellFormatImport) where

import Data.Maybe
import Neovim

haskellFormatImport :: CommandArguments -> Neovim env env
haskellFormatImport (CommandArguments _ range _ _) = do
    e <- ask
    let (x,y) = fromMaybe (0,0) range
    return e

