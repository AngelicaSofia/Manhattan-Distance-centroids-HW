# Manhattan-Distance-centroids-HW
*Prova Finale per il corso di Reti Logiche a.a. 2018-2019*

###### Scopo.
Scopo del progetto è quello di implementare un componente hardware descritto in VHDL in grado di risolvere un problema che consiste nel determinare l'insieme di punti più vicini a quello dato in esame secondo la definizione di Manhattan Distance.

###### Definizione del Problema
Viene dato uno spazio quadrato di dimensione 256x256 e le posizioni di 8 punti all'interno di questo, chiamati centroidi, che saranno quelli di cui calcolare la distanza una volta conosciuta anche la posizione del punto in esame. Considerando ulteriori dettagli relativi alla gestione dei punti (specifiche complete), l'implementazione del componente è stata realizzata interfacciandosi a una memoria contenente tutte le informazioni relative al problema e utilizzando appositi segnali.

###### Implementazione
L'implementazione del componente consiste principalmete nella realizzazione di una macchina a stati in grado di determinare per ciascuno dei centroidi la distanza dal punto in esame.

La valutazione delle distanze avviene negli stati centrali della macchina che definiscono un ciclo in modo tale che per ciascuno dei punti, in caso la distanza sia minima, venga aggiornata una sola volta la maschera di output che verrà comparata con il risultato corretto in modo da valutare l'esecuzione del componente.

###### Test Bench
L'insieme di test utilizzato per la realizzazione del componente è contenuto all'interno del test bench in cui ciascun caso è individuato da un nome caratteristico.

L'insieme di test è stato realizzato a partire da quello della specifica andando a identificare i casi che spingono l'esecuzione verso condizioni critiche così da verificare la completa correttezza del sistema, non essendo a disposizione dei test privati utilizzati per la valutazione.

Tra i test sviluppati per sforzare il componente in situazioni particolari, i più significativi vengono chiamati:

Maschera di ingresso nulla: 00000000
Punti coincidenti in un angolo (256x256)
Distanza massima
Reset asincrono
Infine per poter garantire una maggiore robustezza sono stati utilizzati anche numerosi test randomici in modo tale da cercare di coprire tutti i possibili cammini di esecuzione della macchina a stati.

###### Sviluppatori
Angelica Sofia Valeriani - https://github.com/AngelicaSofia

Daniele Tagliabue - https://github.com/ILTaglia

###### Valutazione
Il progetto è stato valutato con 30 cum laude/30. Professore di riferimento del corso: Gianluca Palermo, Tutor: Davide Conficconi
