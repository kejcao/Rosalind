-- https://rosalind.info/problems/gc/

import Data.List (groupBy, sort)

fasta s = map (\x -> (tail (head x), concat (tail x))) d
  where
    d = groupBy (\a b -> head a /= '>' || head b /= '>') (lines s)

main = do
  s <- readFile "/home/kjc/Downloads/rosalind_grph.txt"
  mapM_
    putStrLn
    [ fst x ++ " " ++ fst y
      | x <- fasta s,
        y <- fasta s,
        fst x /= fst y,
        suffix x == prefix y
    ]
  where
    prefix = take 3 . snd
    suffix = reverse . take 3 . reverse . snd
