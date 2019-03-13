{-# LANGUAGE OverloadedStrings #-}
module HaskellFormatImport.Plugin (haskellFormatImport) where

import Data.List
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Maybe
import Neovim
import Neovim.API.String

-- echo HaskellFormatImport(expand('%:p'))
haskellFormatImport :: String -> Neovim env [T.Text]
haskellFormatImport path = do
    fileContent <- liftIO $ T.readFile path

    let splitIntoLInes = T.lines fileContent
        imports        = filter isImportStatement splitIntoLInes
        hasQualified   = any isQualified imports
        paddedImports  = padImports imports hasQualified
    -- let res = formatImport <$> lines a

    T.writeFile path $ T.unlines paddedImports

    return paddedImports

isImportStatement :: T.Text -> Bool
isImportStatement = T.isInfixOf "import"

isQualified :: T.Text -> Bool
isQualified = T.isInfixOf "qualified"

padImports :: [T.Text] -> Bool -> [T.Text]
padImports i False = i
padImports i True  = fmap padQualifiedIfMissing i

padQualifiedIfMissing :: T.Text -> T.Text
padQualifiedIfMissing s = if isQualified s
                             then s
                             else T.replace "import" "import          " s

-- formatImport :: String -> String
-- formatImport s = 

