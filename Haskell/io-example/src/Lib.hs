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
    
someFunc :: IO ()
someFunc = do
  args <- getArgs
  fp <- openFile (args !! 0) ReadMode
  read_and_write fp 0
