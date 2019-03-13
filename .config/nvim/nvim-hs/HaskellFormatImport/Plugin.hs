{-# LANGUAGE OverloadedStrings #-}
module HaskellFormatImport.Plugin (haskellFormatImport) where

import Data.Maybe
import Neovim

haskellFormatImport :: CommandArguments -> Neovim env Int
haskellFormatImport (CommandArguments _ range _ _) = do
    let (x,y) = fromMaybe (0,0) range
    liftIO $ print y
    return y

