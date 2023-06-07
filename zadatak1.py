# pokretanje: "python3 zadatak1.py matrica.txt rezultati.txt"

import sys
 
linije = []
with open(str(sys.argv[1]), 'r') as dat:
    linije = dat.readlines()

counter = 0
matrice = []
dimenzije = []
for indeks in range(2):

    dimenzija = linije[counter].rstrip('\n').split()
    counter += 1
    
    redovi = int(dimenzija[0])
    stupci = int(dimenzija[1])
    matrica = [["{:.2f}".format(0) for i in range(stupci)] for j in range(redovi)]

    while(linije[counter] != '\n'):
        zapis = linije[counter].rstrip('\n').split()
        red = int(zapis[0])
        stupac = int(zapis[1])
        vrijednost = float(zapis[2])
        matrica[red][stupac] = "{:.2f}".format(vrijednost)
        counter += 1
    else: 
        counter += 1
        dimenzija.clear()
        matrice.append(matrica)
        dimenzije.append([redovi, stupci])
        continue

counter = 0
for matrica in matrice:
    if counter == 0:
        print("\nA:")
        counter += 1
    else:
        print("\nB:")
        
    for red in matrica:
        for element in red:
            print('{:>6}'.format(element), end=' ')
        print() 

rezultat = [[0 for i in range(0,dimenzije[1][1])] for j in range(0,dimenzije[0][0])]
prva = matrice[0]
druga = matrice[1]
for red in range(0,dimenzije[0][0] ):
    for stupac in range(0,dimenzije[1][1] ):
        for i in range(0,dimenzije[0][0] + 1):
            rezultat[red][stupac] += float(prva[red][i]) * float(druga[i][stupac])
        rezultat[red][stupac] = "{:.2f}".format(rezultat[red][stupac])
                       
print('\nA*B:')
for red in rezultat:
    for element in red:
        print('{:>6}'.format(element), end=' ')
    print()

print()
dimenzija = str(dimenzije[0][0]) + ' ' + str(dimenzije[1][1]) + '\n'
with open(str(sys.argv[2]), 'w') as dat:
    dat.write(dimenzija)
    for red in range(dimenzije[0][0]):
        for stupac in range(dimenzije[1][1]):
            if float(rezultat[red][stupac]) != float(0.00):
                dat.write(str(red) + ' ' + str(stupac) + ' ' + str(rezultat[red][stupac] + '\n'))