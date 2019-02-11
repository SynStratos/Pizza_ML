# PIZZA ML

#### Progetto sviluppato in R con lo scopo di raccogliere le implementazioni base di diversi algoritmi di Machine Learning al fine accademico. L'obiettivo è stato quello di rendere le strutture il più versatili possibili grazie a metodi che accolgono argomenti di qualunque dimensione, ammesso che essi siano consistenti con il problema.

### STRUTTURA DEL PROGETTO

* **Utils**
	* **min_max**: breve implementazione della normalizzazione min-max che va a ridurre i valori passati tra i valori di minimo e massimo impostati (di default settati a 0 e 1)
	* **z_score**: breve implementazione della normalizzazione z-score
	* **boxplot**: implementazione della funzione di rimozione degli outliers tramite utilizzo dei quartili

* **Linear Regression**
	* **main**: esempio di classe principale contenente i vari step per applicare i metodi implementati al dataset fornito
	* **batchGD**: algoritmo gradient descent Batch
	* **costFunction**: metodo per il calcolo della funzione costo
	* **predict**: metodo per la previsione delle nuove variabili target dato un nuovo dataset come input

* **Binary Logistic Regression**
	* **main**: esempio di classe principale contenente i vari step per applicare i metodi implementati al dataset fornito
	* **gradient**: algoritmo gradient descent
	* **sigmoid**: implementazione della funzione sigmoide
	* **costFunction**: metodo per il calcolo della funzione costo
	* **predict**: metodo per la previsione delle nuove variabili target dato un nuovo dataset come input

* **Multiclass Logistic Regression**
	* **gradient**: algoritmo gradient descent
	* **sigmoid**: implementazione della funzione sigmoide
	* **costFunction**: metodo per il calcolo della funzione costo
	* **predict**: metodo per la previsione delle nuove variabili target dato un nuovo dataset come input

* **Regularized**
	* **Linear Regression**
		* **costFunction**: metodo per il calcolo della funzione costo regolarizzato con il parametro lambda
		* **gradientDescent**: algoritmo gradient descent regolarizzato con il parametro lambda
	* **Logistic Regression**
		* **costFunction**: metodo per il calcolo della funzione costo regolarizzato con il parametro lambda
		* **gradientDescent**: algoritmo gradient descent regolarizzato con il parametro lambda

* **Neural Network**
	* **main**: esempio di classe principale contenente i vari step per applicare i metodi implementati al dataset fornito
	* **gradientDescent**: algoritmo gradient descent
	* **costFunction**: metodo per il calcolo della funzione costo
	* **forwardPropagation**: implementazione dell'algoritmo di forward propagation
	* **backwardPropagation**: implementazione dell'algoritmo di backward propagation
	* **randomInitialize**: funzione helper

* **Using Libraries**
	Questa sezione raccoglie principalmente prove di implementazione di alcuni dei problemi precedentemente visti con funzioni già presenti in alcune tra le più note librerie di ml e di rappresentazione in grafici disponibili per il linguaggio R.
	Non saranno per il momento descritte nel dettaglio in quanto comunque vogliono fungere solo da esempio di possibili alternative alle implementazioni presenti in questa libreria.