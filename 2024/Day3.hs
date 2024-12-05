module Day3 where

import Text.Regex.Posix.String 

main :: IO ()
main = do
    dta <- readFile "data/Day2.txt"
    pairs = scanMul dta