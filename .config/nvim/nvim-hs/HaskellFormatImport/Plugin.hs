{-# LANGUAGE OverloadedStrings #-}
module HaskellFormatImport.Plugin (haskellFormatImport) where

import Data.List
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Maybe
import Neovim
import Neovim.API.String

qualifiedPadLength :: Int
qualifiedPadLength = 9

substitute :: (Int, Int) -> String -> String -> [String] -> Neovim env ()
substitute (start,end) ptn replacement flags = vim_command 
  $  (show start :: String) 
  +: ("," :: String)
  +: (show end :: String)
  +: ("substitute/" :: String)
  +: (ptn ++ "/" :: String)
  +: (replacement ++ "/" :: String)
  +: ((mconcat flags) :: String)


haskellFormatImport :: CommandArguments -> Neovim env ()
haskellFormatImport (CommandArguments _ range _ _) = do
  let (a, b) = fromMaybe (0,0) range
  vim_command $ show a ++ "," ++ show b ++ "substitute/vim/vimzzz/g"
-- echo HaskellFormatImport(expand('%:p'))
-- haskellFormatImport :: String -> Neovim env [T.Text]
-- haskellFormatImport path = do
--     fileContent <- liftIO $ T.readFile path

--     let splitIntoLInes = T.lines fileContent
--         imports        = filter isImportStatement splitIntoLInes
--         hasQualified   = any isQualified imports
--         paddedImports  = padImports imports hasQualified
--     -- let res = formatImport <$> lines a

--     liftIO $ T.writeFile path $ T.unlines paddedImports

--     return paddedImports

isImportStatement :: T.Text -> Bool
isImportStatement = T.isInfixOf "import"

isQualified :: T.Text -> Bool
isQualified = T.isInfixOf "qualified"

padImports :: [T.Text] -> Bool -> [T.Text]
padImports i False = i
padImports i True  = fmap padQualifiedIfMissing i

padQualifiedIfMissing :: T.Text -> T.Text
padQualifiedIfMissing s = if isQualified s || alreadyPadded s
                             then s
                             else T.replace "import" "import          " s

alreadyPadded = T.isInfixOf $ T.replicate qualifiedPadLength " "

-- formatImport :: String -> String
-- formatImport s = 

