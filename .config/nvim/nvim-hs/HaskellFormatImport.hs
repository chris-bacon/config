{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}
module HaskellFormatImport (plugin) where

import Neovim
import HaskellFormatImport.Plugin (haskellFormatImport)

plugin :: Neovim () NeovimPlugin
plugin = wrapPlugin Plugin
    { environment = ()
    , exports     = [ $(command' 'haskellFormatImport) "%" ]
    -- , exports     = [ $(function' 'haskellFormatImport) Sync ]
    }
