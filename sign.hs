-- https://rosalind.info/problems/sign/

import Control.Monad (replicateM)
import Data.List (permutations)

input = 4

main = print (length results) >> mapM_ (putStrLn . unwords . map show) results
  where
    applySignPattern s = map (zipWith (*) s) (permutations [1 .. input])
    results = concatMap applySignPattern (replicateM input [-1, 1])
