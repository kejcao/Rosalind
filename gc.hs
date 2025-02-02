-- https://rosalind.info/problems/gc/

import Data.List (groupBy)

count c = length . filter (==c)
gc s = fromIntegral (count 'C' s + count 'G' s) / fromIntegral (length s)
main = do
  s <- lines <$> readFile "/home/kjc/Downloads/rosalind_gc.txt"
  let headers = filter ((=='>') . head) s
  let percentages = map (gc . concat . tail) $ groupBy (\a b -> head a /= '>' || head b /= '>') s
  let (p, h) = maximum $ zip percentages headers
  putStrLn (tail h)
  print (p * 100)
