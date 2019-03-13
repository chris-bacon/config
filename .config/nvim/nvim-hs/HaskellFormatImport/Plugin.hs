{-# LANGUAGE OverloadedStrings #-}
module HaskellFormatImport.Plugin (haskellFormatImport) where

import Data.List
import Data.Maybe
import Neovim
import Neovim.API.String

-- echo HaskellFormatImport(expand('%:p'))
haskellFormatImport :: String -> Neovim env String
haskellFormatImport n = do
    fileContent <- liftIO $ readFile n

    let splitIntoLInes = lines fileContent
        imports = filter isImportStatement splitIntoLInes

    -- let res = formatImport <$> lines a

    return res

isImportStatement :: String -> Bool
isImportStatement = isInfixOf "import"

-- formatImport :: String -> String
-- formatImport s = 

