# Prima esperienza di laboratorio
## Asseblazione 
```
arm-elf-as --gdwarf-2 -o add1.o add1.s
```
Assemblazione del codice e generazione del file .object

**NB:** In questo momento, il codice viene analizzato in due passaggi, che prevedono:
+ Esaminazione di tutte le label, controllando nelle varie tabelle
+ Determinazione se il valore di una label puo' essere determinato o da rilocare

## Link
```
arm-elf-ld -Ttext 0x30000000 -o add1 add1.o 
```

Effettuo l'operazione di linking ed indico a che indirizzo di memoria verranno caricate le istruzioni

In questa operazione, essendo noto l'indirizzo in cui risiede il programma, il linker assegnera' il valore a tutte le variabili da rilocare (quelle che dipendono,cioe, dall'indirizzo di inizio del programma)

## Debugger
arm-elf-insight -nx

Con questo comando apro il debugger (in contemporanea premere il tasto on sulla scheda)

## Passi per connettersi

* Eseguire lo script connetti.sh nel momento in cui si sta accendendo il microcontrollore
* Posizionarsi nel menu File &rarr;  Target Settings

* Selezionare il  dispositivo al quale connettersi (Remote Serial, oppure Simulator)

* Selezionare il massimo bound di frequenza e il resto sticazzi 

* Connettersi alla scheda andando su Run &rarr; Connect to target

## Visalizzazione dati del microcontrollore

Aprendo il tab "View" e' possibile visualizzare i dati dei registri, delle celle di memoria  e di altre cose belle

**ATTENZIONE!!** Ancora il programma non e stato scaricato nella scheda

## Download ed Esecuzione del programma

* Dal menu a tendina Seslezionare (Volutamente **__NON__** corretto) add1.s 
* Clicchiamo download per scaricare il programma nella rom del microcontrollore


Ora all'indirizzo inserito ci sara' la codifica esadecimale dell'istruzione (infatti l'ultima lettera e' A che equivale a 10 in decimale) 

## Debugger

* Inserire un breakpoint (cliccando a sinistra della riga)
* Cliccare  la freccia che va dentro le graffe
* Si illuminera' di verde l'istruzione corrente e, nei registri, vedo illuminati i valori dei registri che vengono modificati (quindi qualche registro e il program counter)


**__NB:__** Alla fine di ogni programma c'e' la **trappola**, ovvero un loop infinito che ci permette di continuare a debuggare il programma senza riavviare l'esecuzione 

# Modifica PC e Registri
Andando su View &rarr; Console e' possibile cambiare il valore dei registri con il comando: 
```
set ${registro}={valore}
```
Le modifiche verranno prese in cosiderazione allo step del debugger successivo

## Disassemblaggio programma
```
arm-elf-objdump add1 -D
```
Disassemblo l'object e viene fuori sta schifezza

add1:     file format elf32-littlearm

All'inbterno di ciascuna directori ci sono in ogni caso c'e lo script make-[nome programma].sh che compilano e effettuano le operazioni di link del programma quindi puoi scordarti i primi due comandi

