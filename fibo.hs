-- https://rosalind.info/problems/fibo/

f = scanl (+) 0 (1 : f)

main = print (f !! 24)
