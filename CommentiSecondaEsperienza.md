#Seconda Esperienza di laboratorio
##Prime impressioni
Abbiamo finalmente capito come funziona quello schifo di debugger
###Nota Bene
*Quando apri gli indirizzi di memoria, verranno visualizzati gli indirizzi (0x300000c) dove c indica l'offset da aggiungere all'indirizzo per arrivare all'indirizzo in cui vengono effettivamente memorizzati i dati.
*Gli offset sono quei valori che vengono visualizzati come costanti all'inizio di ciascuna colonna (0,4,8,C).
*Il program counter segnala l'indirizzo della cella evidenziata in verde dal debugger e NON quella dopo
*Se ti viene chiesto il valore di un indirizzo come pseudo-istruzione, segnala il valore contenuto leggendo la cella di memoria e NON l'indirizzo della cella

##Pseudo Istruzioni
Sono delle quasi istruzioni del dialetto ARM.
Esse non individuano precisamente degli indirizzi di memoria, ma gli offset in cui trovarli.
Ad esempio, sapendo che il programma parte dall'indirizzo 0x300000, nelle vicinanze di quell'indirizzo, verranno memorizzati gli offset in cui trovare i dati.
Andando a visualizzare quegli offset, infine, si trovano leggibili dal file di testo.

###Esempio
```
in1:    .long    0x00000012  @ primo operando
```
Questa istruzione alloca 0x0000012 in un'area di memoria sconosciuta.

L'indirizzo in cui e' caricato e' memorizzato nella cella di indirizzo: 0x30000020 (in cui e' contenuto 0x3000012c ovvero l'indirizzo della cella contenente 0x00000012);


