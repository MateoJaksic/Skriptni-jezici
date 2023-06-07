# pokretanje: "python3 zadatak2.py hipoteze.txt"

import sys

linije = []
with open(str(sys.argv[1]), 'r') as dat:
    linije = dat.readlines()

vrijednosti = []
counter = 0
for linija in linije:
    vrijednost = (linija.rstrip('\n').split(' '))
    vrijednost = [float(str(value)) for value in vrijednost]
    vrijednost.sort()
    vrijednosti.append(vrijednost)
    counter += 1

print('\nHyp#Q10#Q20#Q30#Q40#Q50#Q60#Q70#Q80#Q90')
counter = 1
for linija in vrijednosti:
    duljina = len(linija)
    zapis = '%03d' % counter
    q = 0.1
    
    while(q <= 0.9):
        zapis += '#'
        zapis += str(linija[int(round(q, 2) * duljina)-1])
        q += 0.1

    print(zapis)
    counter += 1

print()