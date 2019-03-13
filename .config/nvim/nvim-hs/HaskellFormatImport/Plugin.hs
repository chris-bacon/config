{-# LANGUAGE OverloadedStrings #-}
module HaskellFormatImport.Plugin (haskellFormatImport) where

import Neovim

-- | Neovim is not really good with big numbers, so we return a String here.
haskellFormatImport :: CommandArguments -> Neovim env String
haskellFormatImport args = do
    return "bob"

