%!TeX root=main.tex

\subsection*{Diferencias divididas de Newton}

Una forma de calcular el polinomio de interpolación es mediante
las diferencias divididas de Newton.
La ventaja de este método es que se reducen los cálculos, y en
caso de añadir un punto más, se pueden aprovechar los cálculos
ya realizados.

Veamos cómo realizar el cálculo con un ejemplo.
Consideremos la función $f(x)=\cos(x)-x$, en los nodos
$x=2,\frac{5}{2},3$ y $\frac{7}{2}$.
Lo primero será definir la función y los nodos.

%ei f(x):=cos(x)-x$
%ei xx:[2,2.5,3,3.5]$

A continuación calcularemos las diferencias divididas,
en este caso desde orden 0 hasta orden 3.

Las diferencias de orden 0 son directamente evaluar la función
en los nodos. Guardemos estas diferencias en una lista llamada
\maximain{d0}.

%ei d0:create_list(float(f(xx[i])), i, 1, length(xx));
%do

A continuación calculemos las diferencias de orden 1,
estas diferencias se van a guardar en la lista \maximain{d1}.
Recordamos que se calculan como
\begin{equation*}
d_{i,i+1} = \frac{ d_{i+1} - d_{i} }{ x_{i+1} - x_{i} }
\end{equation*}
para $i=1,2,3$.

%ei d1:create_list((d0[i+1]-d0[i])/(xx[i+1]-xx[i]),i,1,length(xx)-1);
%do

A continuación calculemos las diferencias de orden 2,
estas diferencias se calculan a partir de las diferencias anteriores,
con la expresión
\begin{equation*}
d_{i,i+1,i+2} = \frac{ d_{i+1,i+2} - d_{i,i+1} }{ x_{i+2} - x_{i} }
\end{equation*}
para $i=1,2$.

%ei d2:create_list((d1[i+1]-d1[i])/(xx[i+2]-xx[i]),i,1,length(xx)-2);
%do

Análogamente es calcula las diferencias de orden 3, que para este
ejemplo es la última que existe ya que hemos partido de 4 nodos.

%ei d3:create_list((d2[i+1]-d2[i])/(xx[i+3]-xx[i]),i,1,length(xx)-3);
%do

Realmente se puede crear una función que calcule las diferencias de
orden desde 1, hasta el orden que corresponda de forma automática.
Primero vamos a crear la función que calcula las diferencias de siguiente
orden a partir de las de un orden dado.
Llamemos a esta función \maximain{diflistan(n,xx,dd)} siendo las variables
\maximain{n} el orden que se está calculando actualmente, \maximain{xx}
la lista de nodos y \maximain{dd} la lista de diferencias anteriores al
que se va a calcular.

%ei diflistan(n,xx,dd):=
%el create_list((dd[i+1]-dd[i])/(xx[i+n]-xx[i]),i,1,length(xx)-n)$

Entonces las listas anteriores se calcularían directamente como sigue.

%ei d0:create_list(float(f(xx[i])),i,1,length(xx));
%do

%ei d1:diflistan(1,xx,d0);
%do
%ei d2:diflistan(2,xx,d1);
%do
%ei d3:diflistan(3,xx,d2);
%do

Finalmente se creará una lista que guarde cada lista anterior,
esto es la lista \maximain{difs}.

%ei difs:[d0,d1,d2,d3];
%do

Finalmente el polinomio se calcularía con los primeros
elemento de cada lista \maximain{d0}, \maximain{d1},
\maximain{d2} y \maximain{d3}.
De forma automática se puede hacer de la siguiente manera.

%ei pol:0$
%el prod:1$
%el for i:1 thru length(xx) do(
%el pol:pol + prod*difs[i][1],
%el prod:prod*(x-xx[i]))$
%el pol;
%do
%ei expand(pol);
%do

El polinomio anterior es el poliniomio de interpolación.
Se puede calcular la aproximación en un punto $x=2.6$.

%ei ev(pol,x=2.6);
%do

Y el error absoluto también se puede calcular.

%ei ev(abs(f(x)-pol),x=2.6);
%do

%ei wxplot2d([f(x),pol],[x,1.5,4]);
%c plot2d([f(x),pol],[x,1.5,4],[pdf_file, "./newton1.pdf"])$
\begin{maximat}\begin{center}
\includegraphics[width=.5\textwidth]{newton1.pdf}
\end{center}\end{maximat}
