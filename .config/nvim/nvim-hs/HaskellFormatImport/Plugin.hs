{-# LANGUAGE OverloadedStrings #-}
module HaskellFormatImport.Plugin (haskellFormatImport) where

import Data.Maybe
import Neovim

haskellFormatImport :: CommandArguments -> Neovim env Int
haskellFormatImport (CommandArguments _ range _ _) = do
    b <- vim_get_current_buffer
    liftIO $ print b
    let (x,y) = fromMaybe (0,0) range
    return x


