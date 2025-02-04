-- https://rosalind.info/problems/fib/

input = "31 2"

main = print $ (1 : f) !! (n - 1)
  where
    [n, k] = map read $ words input
    f = scanl (\x y -> x + y * k) 1 (1 : f)
