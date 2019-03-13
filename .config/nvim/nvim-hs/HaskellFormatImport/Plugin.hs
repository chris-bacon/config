{-# LANGUAGE OverloadedStrings #-}
module HaskellFormatImport.Plugin (haskellFormatImport) where

import Data.Maybe
import Neovim
import Neovim.API.String

haskellFormatImport :: Neovim env Buffer
haskellFormatImport (CommandArguments _ range _ _) = do
-- haskellFormatImport = do
    b <- vim_get_current_buffer
    liftIO $ print b
    vim_out_write "bob"
    let (x,y) = fromMaybe (0,0) range
    return y


