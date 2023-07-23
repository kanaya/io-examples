module Lib
    ( someFunc
    ) where

import System.IO
import System.Environment (getArgs)
import Data.Text.IO as DTI
import Text.Printf

read_and_write :: Handle -> Int -> IO ()
read_and_write fp n = do
  eof <- hIsEOF fp
  if eof then return ()
  else do
    str <- DTI.hGetLine fp
    printf "%03d: " (n::Int)
    print str
    read_and_write fp (n + 1)

process :: String -> IO ()
process filename = openFile filename ReadMode >>= \fin -> read_and_write fin 0

process_filenames :: [String] -> IO ()
process_filenames (fn:fns) = process fn >> process_filenames fns
process_filenames [] = return ()

someFunc :: IO ()
someFunc = getArgs >>= process_filenames

