# https://rosalind.info/problems/gbk/

from Bio import Entrez

Entrez.email = 'kjcao@proton.me'
handle = Entrez.esearch(
    db='nucleotide',
    term='"Lagarobasidium"',
    datetype='pdat',
    mindate='2003/05/25',
    maxdate='2009/04/22',
)
record = Entrez.read(handle)
print(record['Count'])
