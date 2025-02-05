-- https://rosalind.info/problems/maj/

import Data.List (group, sort)

biggest l =
  let (cnt, x) = maximum [(length x, head x) | x <- group $ sort l]
   in if cnt > (length l `div` 2) then x else -1

main = do
  s <- readFile "/home/kjc/Downloads/rosalind_maj.txt"
  let as = map (map read . words) $ tail (lines s)
  putStrLn $ unwords $ map (show . biggest) as
