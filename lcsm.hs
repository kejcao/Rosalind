-- https://rosalind.info/problems/lcsm/
{-# LANGUAGE DataKinds #-}

import Data.Char (ord)
import Data.List (elemIndex, groupBy)
import Data.Maybe (fromJust)
import Data.Mod
import Data.Set qualified as S

fasta s = map (\x -> (tail (head x), concat (tail x))) d
  where
    d = groupBy (\a b -> head a /= '>' || head b /= '>') (lines s)

type ModP = Mod 2147483647 -- 2^31 - 1

a = 257 :: ModP -- constant for the rollingKarp hashing

rollingKarp :: Int -> String -> [ModP]
rollingKarp n s = scanl update startingHash middle
  where
    as = reverse $ take n $ iterate (a *) 1
    contents = map (fromIntegral . ord) s
    middle = zip contents (drop n contents)
    startingHash = sum $ zipWith (*) contents as
    update ac (x, y) = (ac - x * head as) * a + y

-- assumes no hash collisions lol
commonSubstringOfLength :: Int -> [String] -> Maybe String
commonSubstringOfLength n xs = hashToSubstring <$> candidateMatch
  where
    hashes = map (rollingKarp n) xs
    candidateMatch =
      let s = map S.fromList hashes
       in S.lookupMin $ foldl S.intersection (head s) s
    hashToSubstring h =
      let i = fromJust $ elemIndex h (head hashes)
       in take n $ drop i (head xs)

-- bounds probably incorrect in edgecases
search lo hi xs
  | hi - lo == 1 = fromJust result
  | otherwise =
      case result of
        Just x -> search (mid + 1) hi xs
        Nothing -> search lo mid xs
  where
    mid = (lo + hi) `div` 2
    result = commonSubstringOfLength mid xs

main = do
  s <- readFile "/home/kjc/Downloads/rosalind_lcsm.txt"
  let dna = map snd $ fasta s
  putStrLn $ search 0 (maximum (map length dna) - 1) dna
