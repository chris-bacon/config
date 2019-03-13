{-# LANGUAGE TemplateHaskell #-}
module HaskellFormatImport (plugin) where

import Neovim
import HaskellFormatImport.Plugin (haskellFormatImport)

plugin :: Neovim () NeovimPlugin
plugin = wrapPlugin Plugin
    { environment = ()
    , exports     = [ $(command' 'haskellFormatImport) [Sync (CmdRange WholeFile)(CommandArguments Nothing Nothing Nothing Nothing)] ]
    }
