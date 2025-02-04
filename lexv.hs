-- https://rosalind.info/problems/lexv/

import Control.Monad (replicateM)
import Data.List (sort)

input = "F G D I O E S A T K X B\n3"

main = mapM_ (putStrLn . map (alph !!)) (sort xs)
  where
    l = lines input
    n = read (last l)
    alph = filter (/=' ') (head l)
    xs = concatMap (\x -> replicateM x [0..length alph - 1]) [1..n]
