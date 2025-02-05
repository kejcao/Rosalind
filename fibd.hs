-- https://rosalind.info/problems/fibd/

import Data.List (transpose)

n = 89

m = 17

fibs = scanl (+) 0 (1 : fibs)

f = [1] ++ take m (tail fibs) ++ map (\l -> (sum . take 2 . reverse) l - head l) (transpose [drop n f | n <- [0 .. m]])

main = print $ f !! n
