-- https://rosalind.info/problems/splc/

import Data.List (groupBy)
import Data.Text qualified as T

fasta s = map (\x -> (tail (head x), concat (tail x))) d
  where
    d = groupBy (\a b -> head a /= '>' || head b /= '>') (lines s)

f "TTT" = "F"
f "TTC" = "F"
f "TTA" = "L"
f "TTG" = "L"
f "TCT" = "S"
f "TCC" = "S"
f "TCA" = "S"
f "TCG" = "S"
f "TAT" = "Y"
f "TAC" = "Y"
f "TAA" = "Stop"
f "TAG" = "Stop"
f "TGT" = "C"
f "TGC" = "C"
f "TGA" = "Stop"
f "TGG" = "W"
f "CTT" = "L"
f "CTC" = "L"
f "CTA" = "L"
f "CTG" = "L"
f "CCT" = "P"
f "CCC" = "P"
f "CCA" = "P"
f "CCG" = "P"
f "CAT" = "H"
f "CAC" = "H"
f "CAA" = "Q"
f "CAG" = "Q"
f "CGT" = "R"
f "CGC" = "R"
f "CGA" = "R"
f "CGG" = "R"
f "ATT" = "I"
f "ATC" = "I"
f "ATA" = "I"
f "ATG" = "M"
f "ACT" = "T"
f "ACC" = "T"
f "ACA" = "T"
f "ACG" = "T"
f "AAT" = "N"
f "AAC" = "N"
f "AAA" = "K"
f "AAG" = "K"
f "AGT" = "S"
f "AGC" = "S"
f "AGA" = "R"
f "AGG" = "R"
f "GTT" = "V"
f "GTC" = "V"
f "GTA" = "V"
f "GTG" = "V"
f "GCT" = "A"
f "GCC" = "A"
f "GCA" = "A"
f "GCG" = "A"
f "GAT" = "D"
f "GAC" = "D"
f "GAA" = "E"
f "GAG" = "E"
f "GGT" = "G"
f "GGC" = "G"
f "GGA" = "G"
f "GGG" = "G"
f _ = "Stop"

group [] = []
group l = take 3 l : group (drop 3 l)

main = do
  s <- readFile "/home/kjc/Downloads/rosalind_splc.txt"
  let dna = map snd (fasta s)
  let new = foldl (\a x -> T.replace (T.pack x) (T.pack "") a) (T.pack (head dna)) (tail dna)
  putStrLn $ T.unpack $ convert (T.unpack new)
  where
    convert dna = T.pack $ concat $ takeWhile (/= "Stop") $ map f $ group dna
