-- https://rosalind.info/problems/perm/

import Data.List (permutations)

input = 7

main = do
  print (product [1..input])
  mapM_ (putStrLn . unwords . map show) $ permutations [1..input]
