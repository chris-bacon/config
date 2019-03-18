{-# LANGUAGE OverloadedStrings #-}
module HaskellFormatImport.Plugin ( haskellFormatImport ) where

import Data.Char
import Data.List
import Data.Maybe
import Neovim
import Neovim.API.String
import Basement.IntegralConv (intToInt64)
import Data.List.Split

-- | Qualification in this context means that one of the imports is a qualified import
-- It is a property that applies to the whole buffer, however.
data Qualification = Present | NotPresent

newtype MaxLineLength = MaxLineLength Int

type LineNumber = Int

qualifiedPadLength :: Int
qualifiedPadLength = 10

padMissingQualified :: String
padMissingQualified = take qualifiedPadLength $ repeat ' '

-- TODO: as

haskellFormatImport :: CommandArguments -> Neovim env ()
haskellFormatImport (CommandArguments _ range _ _) = do
  let (startOfRange, endOfRange) = fromMaybe (0,0) range
  buff     <- vim_get_current_buffer
  allLines <- nvim_buf_get_lines buff (intToInt64 startOfRange) (intToInt64 endOfRange) False
  let allImportLines       = sortImports $ filter isImportStatement (zip [1..endOfRange] allLines)
      anyImportIsQualified = getQualification allImportLines
      maxLineLength        = MaxLineLength $ foldr max 0 $ fmap (\(_,s) -> length s) allImportLines

  mapM_ (formatImportLine buff anyImportIsQualified maxLineLength) allImportLines

  return ()

formatImportLine :: Buffer -> Qualification -> MaxLineLength -> (LineNumber, String) -> Neovim env ()
formatImportLine buff qualifiedImports (MaxLineLength longestImport) (lineNo, lineContent) 
  = buffer_set_line buff (intToInt64 lineNo) $ padContent lineContent qualifiedImports longestImport

getQualification :: [(LineNumber, String)] -> Qualification
getQualification xs = go $ filter isQualified xs
  where
    go [] = NotPresent
    go _  = Present

padContent :: String -> Qualification -> Int -> String
padContent content NotPresent longestImport = content
padContent content Present longestImport =
  if "qualified" `isInfixOf` content || ("import" ++ padMissingQualified) `isInfixOf` content
     then content
     else concat $ ("import" ++ padMissingQualified) : splitOn "import" content

sortImports :: [(LineNumber, String)] -> [(LineNumber, String)]
sortImports xs = zip (fmap fst xs) $ sortBy (\a b -> compare (toLower <$> a) (toLower <$> b)) (fmap snd xs)

isImportStatement :: (LineNumber, String) -> Bool
isImportStatement (_, s) = isInfixOf "import " s

isQualified :: (LineNumber, String) -> Bool
isQualified (_, s) = isInfixOf "qualified " s

