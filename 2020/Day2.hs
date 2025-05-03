module Day2 where
import Tools (split)
import GHC.Base (VecElem(Int16ElemRep))

main :: IO ()
main = do
    dta <- readFile "data/day2.txt"
    let nums = map (split " ") $ split "\n" dta
        (a, b, c) = unzip3 $ map tuplize nums
        ranges = map (map (\n -> read n :: Int) . split "-") a
        letters = map head b
        nl = zip3 ranges letters c

    putStrLn "task 1:"
    print $ length $ filter follows nl
    where
        tuplize :: [a] -> (a, a, a)
        tuplize [a,b,c] = (a, b, c)
        follows :: ([Int],Char,[Char]) -> Bool
        follows ([l,h],c,cs) = len >= l && len <= h
            where
                len = length . filter (c==) $ cs