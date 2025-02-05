# https://rosalind.info/problems/frmt/

import numpy as np
from Bio import Entrez

Entrez.email = 'kjcao@proton.me'
handle = Entrez.efetch(
    db='nucleotide',
    id=[
        'JQ712981, NM_001079732, JQ342169, JF927157, JQ712977, JX462666, NM_001271262, JX462669, JQ290344'
    ],
    rettype='fasta',
)

l = [x.strip() for x in handle.read().split('\n\n') if x]
print(l[np.argmin([*map(len, l)])])  # very hacky, not guaranteed to work.
