{-# LANGUAGE OverloadedStrings #-}
module HaskellFormatImport.Plugin (haskellFormatImport) where

import Data.Maybe
import Neovim
import Neovim.API.String

haskellFormatImport :: String -> Neovim env String
haskellFormatImport n = do
    a <- liftIO $ readFile n
    return a

