-- https://rosalind.info/problems/rna/

input = "TGAGCCGTCGACTACGGGAGGCACAATCCAAGCTAATCTGTATTACCTGATATTGATTACAGTATCTCGAGCACGGAGTCTTGCTTGCAATGACCAGTAGTTGAGAGGACTTCCCGTACGACCTTGGATCGCTAGCCTGATGGCCCCGCCTGACTACCGAGGCGAGCATGGAAGCCGTCGATAGGGTTATATTATGCACCATTGCCATCCGTGTTAAGCTTTGCACCGGCTCAATTAAAGGAGAGCAAATCCGCTCTCCCCAAAAAGTATATACCGTTCTGATTCGCACGCTCAATGTACGCCCTGAGCGTTACACAGAGTGCCAACAACCAAGGTTTCGATCCGAGCTAGTAATATGCAATTTACTCGACACTTTATCGGCAGGTACTAGCATGCGTACGAGACCACATTATAAGAAAACGTCCTTTCATATGAGAGCTTTAGAGAATGAGCCGACCGGGTGTTAGCGCCAATACTATCGTTTCGCAATTTACTCCGGGCTACGGGCCGGTGCGCGTCTGAGGCCCTTCGCTCACTCGCGGCGGCAGAGGGCGCAAAAGTTCATCTAGCATAACGAGGGTCAGACAATCAACTGCATGGTACTTCGACGAGTTTAGTCGTCTTTGAGGTTTCGATTCTCGAATGGCGACGGCCGAATAATCCATATTTCTCCGGGTGGTCGATGTCTTCAGCGGCCTAGGGTGCAGCACTCTGTGCGACAAAGTAGTTTGCAAAGTGGCAAAGGTTCACAAACTGAGCTACTCTGAGTAATCAATGTCGCTCCTCGGCCGTTAGCTCCGACACGGCCAGGTTCGCACTATGCGAAGGGACCACTAGATCCAGAATAGGTTGCGCCGTAGGACCTCGGCTTCACTGCCAATTAACGCTGGTCCTCAGGGCCGCCCCAGAGTTGTTAT"

f 'T' = 'U'
f x = x

main = putStrLn $ map f input
