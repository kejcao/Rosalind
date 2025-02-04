-- https://rosalind.info/problems/pper/

input = "99 9"

main = print $ foldl (\x y -> mod (x * y) 1_000_000) 1 [n - k + 1 .. n]
  where
    [n, k] = map read $ words input
