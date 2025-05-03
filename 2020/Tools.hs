module Tools
( split

    ) where 
import Data.Text (pack, unpack, splitOn)

split :: [Char] -> [Char] -> [[Char]]
split s c = map unpack $ splitOn (pack s) $ pack c