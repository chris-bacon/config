{-# LANGUAGE TemplateHaskell #-}
module HaskellFormatImport (plugin) where

import Neovim
import HaskellFormatImport.Plugin (haskellFormatImport)

plugin :: Neovim () NeovimPlugin
plugin = wrapPlugin Plugin
    { environment = ()
    , exports     = [ $(command' 'haskellFormatImport) [CmdSync Sync, (CmdRange WholeFile), (CmdRange WholeFile)] ]
    }
