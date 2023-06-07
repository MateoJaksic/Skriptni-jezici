# pokretanje: "python3 zadatak3.py studenti"

import os, sys

datoteke = os.listdir(sys.argv[1]) 
rezultati = {}

studenti = []
rezultati = {}
with open(str(sys.argv[1] + '/' + 'studenti.txt'), 'r') as dat:
    studenti = dat.readlines() 

counter = 0
for student in studenti:
    student = student.rstrip('\n').split()
    rezultati[student[0]] = {'1': '-', '2': '-', '3': '-'}
    studenti[counter] = student
    counter += 1

for datoteka in datoteke:
    if datoteka == 'studenti.txt': 
        continue

    labos = list(datoteka)[5]
    bodovi = []
    with open(str(sys.argv[1] + '/' + datoteka), 'r') as dat:
        bodovi = dat.readlines()

    for zapis in bodovi:
        zapis = zapis.rstrip('\n').split()

        if rezultati[zapis[0]][labos] == '-':
            rezultati[zapis[0]][labos] = zapis[1]
        else:
            rezultati[zapis[0]][labos] = '*'

    bodovi.clear()

counter = 0
print("\nJMBAG\t\tPrezime, Ime\t\tL1\tL2\tL3")
for kljuc in rezultati.keys():
    print(f"{kljuc}\t{studenti[counter][1]}, {studenti[counter][2]}\t\t{rezultati[kljuc]['1']}\t{rezultati[kljuc]['2']}\t{rezultati[kljuc]['3']}")  
    counter += 1
print("\n* - student se nalazi na dva popisa vezana za istu laboratorijsku vježbu\n")
