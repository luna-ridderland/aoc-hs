module Day2 where

allDec :: [Int] -> Bool
allDec = foldr (\ n -> (&&) (n == -1 || n == -2 || n == -3)) True

allInc :: [Int] -> Bool
allInc = foldr (\ n -> (&&) (n == 1 || n == 2 || n == 3)) True
doodad1 :: [Int] -> Int
doodad1 = foldr (\ n -> (+) (if n == -1 || n == -2 || n == -3 then 0 else 1)) 0

doodad2 :: [Int] -> Int
doodad2 = foldr (\ n -> (+) (if n == 1 || n == 2 || n == 3 then 0 else 1)) 0

main :: IO ()
main = do
    dta <- readFile "data/Day2.txt"
    let nums =  map (map (read :: String -> Int) . words) $ lines dta
        s = map (\n -> zipWith (-) (tail n) n) nums

    print $ length $ filter (\ns -> allInc ns || allDec ns) s
    print $ length $ filter (\ns -> doodad1 ns <= 1 || doodad2 ns <= 1) s