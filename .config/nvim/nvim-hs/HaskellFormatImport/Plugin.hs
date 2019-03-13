{-# LANGUAGE OverloadedStrings #-}
module HaskellFormatImport.Plugin (haskellFormatImport) where

import Data.List
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Maybe
import Neovim
import Neovim.API.String

-- echo HaskellFormatImport(expand('%:p'))
haskellFormatImport :: String -> Neovim env [String]
haskellFormatImport n = do
    fileContent <- liftIO $ T.readFile n

    let splitIntoLInes = T.splitOn "\n" fileContent
        imports = filter isImportStatement splitIntoLInes
        hasQualified = any isQualified imports
        paddedImports = padImports imports hasQualified
    -- let res = formatImport <$> lines a

    return imports

isImportStatement :: Text -> Bool
isImportStatement = T.isInfixOf "import"

isQualified :: Text -> Bool
isQualified = T.isInfixOf "qualified"

padImports :: [Text] -> Bool -> [Text]
padImports i False = i
padImports i True  = fmap addQualifiedIfMissing i

addQualifiedIfMissing :: Text -> Text
addQualifiedIfMissing s = if isQualified s
                             then s
                             else T.replace "import" "import qualified" s

-- formatImport :: String -> String
-- formatImport s = 

