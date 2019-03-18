{-# LANGUAGE OverloadedStrings #-}
module HaskellFormatImport.Plugin (haskellFormatImport) where

import Data.List
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Data.Maybe
import Neovim
import Neovim.API.String
import Basement.IntegralConv (intToInt64)
import Data.List.Split

data Qualification = Present | NotPresent

newtype MaxLineLength = MaxLineLength Int

qualifiedPadLength :: Int
qualifiedPadLength = 9

-- | Invokes the substitute command with given parameters
substitute :: (Int, Int) -> String -> String -> [String] -> Neovim env ()
substitute (start,end) ptn replacement flags = vim_command 
  $  show start
  ++ ","
  ++ show end
  ++ "substitute/"
  ++ ptn ++ "/"
  ++ replacement ++ "/"
  ++ mconcat flags


-- TODO: as

haskellFormatImport :: CommandArguments -> Neovim env ()
haskellFormatImport (CommandArguments _ range _ _) = do
  let (startOfRange, endOfRange) = fromMaybe (0,0) range
  buff <- vim_get_current_buffer
  allLines <- nvim_buf_get_lines buff (intToInt64 startOfRange) (intToInt64 endOfRange) False
  let allImportLines       = sortImports $ filter isImportStatement (zip [1..endOfRange] allLines)
      anyImportIsQualified = getQualification allImportLines
      maxLineLength        = MaxLineLength $ fold max $ fmap (\(_,s) -> length s) allImportLines
  -- nvim_buf_set_lines buff 0 0 False allImportLines
  -- nvim_buf_get_lines

  mapM_ (formatImportLine buff anyImportIsQualified maxLineLength) allImportLines

  return ()

formatImportLine :: Buffer -> Qualification -> MaxLineLength -> (Int, String) -> Neovim env ()
formatImportLine buff qualifiedImports (MaxLineLength longestImport) (lineNo, lineContent) 
  = buffer_set_line buff (intToInt64 lineNo) $ padContent lineContent qualifiedImports longestImport

getQualification :: [(Int, String)] -> Qualification
getQualification xs = go $ filter isQualified xs
  where
    go [] = NotPresent
    go _  = Present

padContent :: String -> Qualification -> Int -> String
padContent content NotPresent longestImport = content
padContent content Present longestImport =
  if "qualified" `isInfixOf` content || "import         " `isInfixOf` content
     then content
     else concat $ "import          " : splitOn "import" content

sortImports :: [(Int, String)] -> [(Int, String)]
sortImports xs = zip (fmap fst xs) $ sort (fmap snd xs)

isImportStatement :: (Int, String) -> Bool
isImportStatement (_, s) = isInfixOf "import " s

isQualified :: (Int, String) -> Bool
isQualified (_, s) = isInfixOf "qualified " s

