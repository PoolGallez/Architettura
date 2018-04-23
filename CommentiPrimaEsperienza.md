#Prima esperienza di laboratorio
##Asseblazione 
```
arm-elf-as --gdwarf-2 -o add1.o add1.s
```
Assemblazione del codice e generazione del file .object 

##Link
```
arm-elf-ld -Ttext 0x30000000 -o add1 add1.o 
```

Effettuo l'operazione di linking ed indico a che indirizzo di memoria verranno caricate le istruzioni

##Debugger
arm-elf-insight -nx

Con questo comando apro il debugger (in contemporanea premere il tasto on sulla scheda)

##Passi per connettersi

Andando su File >>  Target Settings

Posso selezionare i dispositivi ai quali connettermi (Remote Serial)

Posso inoltre selezionare Simulator per  simulare la scheda che ce in laboratorio

Selezionare negli altri parametri il massimo bound di frequenza e il resto sticazzi 

Per connettersi alla scheda andare su Run >> Connect to target

Sul tab View riusciamo a visualizzare i dati dei registri e di altre cose belle

ATTENZIONE!! Ancora il programma non e stato scaricato nella scheda

Dal menu a tendina seslezionamo add1.s e poi clicchiamo download (Ora e' caricato)

Ora all'indirizzo inserito ci sara' la codifica esadecimale dell'istruzione (infatti l'ultima lettera e' A che equivale a 10 in decimale) 

Per eseguire il programma (Passo passo), bisogna prima fare un breakpoint (cliccando a sinistra della riga), e poi cliccare il la freccia che va dentro le graffe mi si illumineranno di verde l'istruzione corrente e, nei registri, vedo illuminati i valori dei registri che vengono modificati (quindi qualche registro e il program counter)

A questo punto siamo bloccati nella trappola (per non far chidere il debug), per tornare su andiamo su View >> Console per cambiare il valore dei registri
```
set $pc=0x3000000
```

Facendo cosi cambio il valore del program counter e lo faccio ritornare su.

Ovviamente e possibile anche modificare i valori degli altri registri manualmente

Le modifiche verranno prese in cosiderazione una volta ricliccato sulla freccia che va dentro la parentesi graffa

##Disassemblaggio programma
```
arm-elf-objdump add1 -D
```
Disassemblo l'object e viene fuori sta schifezza

add1:     file format elf32-littlearm

Disassembly of section .text:

30000000 <_start>:
30000000:	e3a0000a 	mov	r0, #10	; 0xa
30000004:	e3a0100f 	mov	r1, #15	; 0xf
30000008:	e0812000 	add	r2, r1, r0

3000000c <add1_end>:
3000000c:	eafffffe 	b	3000000c <add1_end>
Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	30000000 	andcc	r0, r0, r0
  14:	00000010 	andeq	r0, r0, r0, lsl r0
	...
Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	00000053 	andeq	r0, r0, r3, asr r0
   4:	00000002 	andeq	r0, r0, r2
   8:	01040000 	tsteq	r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	30000000 	andcc	r0, r0, r0
  14:	30000010 	andcc	r0, r0, r0, lsl r0
  18:	31646461 	cmncc	r4, r1, ror #8
  1c:	2f00732e 	swics	0x0000732e
  20:	656d6f68 	strvsb	r6, [sp, #-3944]!
  24:	6c75682f 	ldcvsl	8, cr6, [r5], #-188
  28:	2f392f6b 	swics	0x00392f6b
  2c:	31316770 	teqcc	r1, r0, ror r7
  30:	31353236 	teqcc	r5, r6, lsr r2
  34:	73652f39 	cmnvc	r5, #228	; 0xe4
  38:	69637265 	stmvsdb	r3!, {r0, r2, r5, r6, r9, ip, sp, lr}^
  3c:	302f697a 	eorcc	r6, pc, sl, ror r9
  40:	64612d31 	strvsbt	r2, [r1], #-3377
  44:	47003164 	strmi	r3, [r0, -r4, ror #2]
  48:	4120554e 	teqmi	r0, lr, asr #10
  4c:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
  50:	312e3631 	teqcc	lr, r1, lsr r6
  54:	L'indirizzo 0x00000054 è fuori dai limiti.

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	10001101 	andne	r1, r0, r1, lsl #2
   4:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
   8:	1b080301 	blne	200c14 <_stack+0x180c14>
   c:	13082508 	tstne	r8, #33554432	; 0x2000000
  10:	00000005 	andeq	r0, r0, r5
Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	00000032 	andeq	r0, r0, r2, lsr r0
   4:	001a0002 	andeqs	r0, sl, r2
   8:	01020000 	tsteq	r2, r0
   c:	000a0efb 	streqd	r0, [sl], -fp
  10:	01010101 	tsteq	r1, r1, lsl #2
  14:	01000000 	tsteq	r0, r0
  18:	64646100 	strvsbt	r6, [r4], #-256
  1c:	00732e31 	rsbeqs	r2, r3, r1, lsr lr
  20:	00000000 	andeq	r0, r0, r0
  24:	00020500 	andeq	r0, r2, r0, lsl #10
  28:	03300000 	teqeq	r0, #0	; 0x0
  2c:	2c2c010a 	stfcss	f0, [ip], #-40
  30:	0002022d 	andeq	r0, r2, sp, lsr #4
  34:	L'indirizzo 0x00000034 è fuori dai limiti.

Che e' il dump dell'oggetto del programma


All'inbterno di ciascuna directori ci sono in ogni caso c'e lo script make-[nome programma].sh che compilano e effettuano le operazioni di link del programma quindi puoi scordarti i primi due comandi
