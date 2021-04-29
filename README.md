
# README

## luogo_delle_radici.m

script per controllare il luogo delle radici, si deve modificare la parte:

```matlab
num = k*(s+3);
den = s*(s+12)*(s-3);

re_min = -2;
k_trovato = 154;
```

dove `num`  e `den` sono numeratore e denominatore della funzione di trasferimento trovata, `re_min` e' la parte reale minima data come specifica, e `k_trovato` e' il coefficente di guadagno trovato con la tabella di rauth.

nella console viene stampata la tabella di rauth per calcolare il valore di k che soddisfa la specifica sul transitorio:

```matlab
routh =
 
[              1,  k - 60]
[              3, k + 100]
[(2*k)/3 - 280/3,       0]
[        k + 100,       0]
 
k > 140.000000
```

## sintesi_in_w.m

script per controllare la sintesi in w, la parte da modificare e':

```matlab
num = 4*(1+s/1.42);

den = s*(1+s/10)^2*(1+s/14.2);
```

con il numeratore e denominatore trovati attraverso la sintesi.

l'output e' 3 figure:

- il diagramma di bode approssimato: da vedere solo il modulo poiche' la fase e' approssimata in modo diverso rispetto al prof
- il diagramma di bode: da cui con il mouse si possono leggere i valori
- il diagramma di nichols

nella console vengono inoltre stampati i margini e i vari parametri

```matlab
m_phi: 38.606857
Wt: 11.117191
Stable: 1
B3_Hz: 2.858595
Mr: 4.557822
```
