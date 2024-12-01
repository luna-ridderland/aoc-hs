--import AOCtools
module Day1 where
import Tools (split)
import Data.List (sort)

task1 :: [Int]-> Int
task1 nums = let diff = map (2020 -) nums in
    product $ filter (`elem` nums) diff

task2 :: [Int] -> Int
task2 [] = 0
task2 nums = product $ head $ filter (\ns -> sum ns == 2020) $ combinations 3 nums
    where
        combinations :: Int -> [Int] -> [[Int]]
        combinations 0 _ = [[]]
        combinations _ [] = []
        combinations n (x : xs) = map (x :) (combinations (n - 1) xs) ++ combinations n xs


main :: IO ()
main = do
    dta <- readFile "data/Day1.txt"
    let nums =  map words $ lines dta
        left = sort $ map ((read :: String -> Int) . head) nums
        right = sort $ map ((read :: String -> Int) . last) nums
        input = zip left right
    putStrLn "task 1:"
    print $ sum $ map (\(a,b) -> abs (a-b)) input
    putStrLn "task 2:"
    print $ sum $ map (\n -> n * length (filter (n==) right)) left