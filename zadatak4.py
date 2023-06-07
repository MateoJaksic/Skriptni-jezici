# pokretanje: "python3 zadatak4.py https://www.fer.unizg.hr"

import urllib.request, sys, re

stranica = urllib.request.urlopen(sys.argv[1])
linije = [zapis.decode('utf-8') for zapis in stranica.readlines()]

print("\nLINKOVI NA DRUGE STRANICE:")
linkovi = []
for linija in linije:
    link = re.findall(r'href="http([^"]*)"', linija)
    if link != []:
        print(f'http{str(link[0])}')
        linkovi.append('http' + link[0])

print("\nBROJ REFERENCIRANJA HOSTOVA:")
uzorci = []
for link in linkovi:
    uzorci.append(str(re.findall(r'//[^./]*\.[^/]*', link)))

hostovi = [list(str(uzorak))[4:-2] for uzorak in uzorci]
hostovi = [''.join(host) for host in hostovi]
hostovi_ponavljanja = {}
for host in hostovi:
    if host not in hostovi_ponavljanja:
        hostovi_ponavljanja[host] = 1
    else: 
        hostovi_ponavljanja[host] += 1

for host in hostovi_ponavljanja.keys():
    print(f"{hostovi_ponavljanja[host]} - {host}")

print("\nMAILOVI:")
mailovi = []
for linija in linije:
    mail = re.findall(r'[A-Za-z0-9._-]+@[A-Za-z0-9._-]+\.[A-Za-z]+', linija)
    if mail != []:
        [mailovi.append(zapis) for zapis in mail]

[print(mail) for mail in mailovi]

counter = 0
for linija in linije:
    link = re.findall(r'<img src=".*>|<img src=\'.*>', linija)
    if link != []:
        counter += 1
print(f"\nBROJ LINKOVA NA SLIKE: {counter}\n")
