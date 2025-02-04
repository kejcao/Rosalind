-- https://rosalind.info/problems/cons/

import Data.List (groupBy, sort, transpose)

fasta s = map (\x -> (tail (head x), concat (tail x))) d
  where
    d = groupBy (\a b -> head a /= '>' || head b /= '>') (lines s)

count c = length . filter (== c)

counts x = [count 'A' x, count 'C' x, count 'G' x, count 'T' x]

maxIndex xs = head $ filter ((== maximum xs) . (xs !!)) [0 ..]

main = do
  s <- readFile "/home/kjc/Downloads/rosalind_cons.txt"
  let dna = map snd (fasta s)
  let freqs = map counts (transpose dna)
  putStrLn $ concatMap ((["A", "C", "G", "T"] !!) . maxIndex) freqs
  mapM_ (putStrLn . unwords) $ transpose $ ["A:", "C:", "G:", "T:"] : map (map show) freqs
