--import AOCtools
module Day1 where
import Data.Text (splitOn, pack, unpack)
import Data.List (subsequences)

task1 :: [Int] -> Int
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
    dta <- readFile "data/day1.txt"
    let nums =  map ((\n -> read n :: Int) . unpack) (splitOn (pack "\n") (pack dta))
    putStrLn "task 1:"
    print $ task1 nums
    putStrLn "task 2:"
    print $ task2 nums