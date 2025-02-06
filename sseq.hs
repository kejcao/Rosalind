-- https://rosalind.info/problems/sseq/

import Data.List (groupBy)

fasta s = map (\x -> (tail (head x), concat (tail x))) d
  where
    d = groupBy (\a b -> head a /= '>' || head b /= '>') (lines s)

subseq _ "" = []
subseq a b =
  let a' = dropWhile (/= head b) (tail a)
   in length a' : subseq a' (tail b)

main = do
  s <- readFile "/home/kjc/Downloads/rosalind_sseq.txt"
  let [a, b] = map snd (fasta s)
  putStrLn $ unwords $ map (show . (+ 1) . (length a -)) $ subseq a b
