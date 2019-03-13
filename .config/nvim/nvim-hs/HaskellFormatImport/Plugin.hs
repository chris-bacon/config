{-# LANGUAGE OverloadedStrings #-}
module HaskellFormatImport.Plugin (haskellFormatImport) where

import Data.ByteString.Internal
import Neovim
import Neovim.API.String

-- | Neovim is not really good with big numbers, so we return a String here.
haskellFormatImport :: Neovim env String
haskellFormatImport = do
    let win = Window ""
    liftIO $ print $ show win
    return "bob"

