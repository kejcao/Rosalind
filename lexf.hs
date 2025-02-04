-- https://rosalind.info/problems/lexf/

import Control.Monad (replicateM)
import Data.List (sort)

input = "A B C D E F G H I J\n2"

main = mapM_ putStrLn $ sort xs
  where
    l = lines input
    n = read (last l)
    xs = replicateM n $ filter (/= ' ') $ head l
