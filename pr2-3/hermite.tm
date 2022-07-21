%!TeX root=main.tex

\subsection*{Polinomio de interpolación de Hermite}

Ahora se va a implementar el cálculo del polinomio de interpolación
de Hermite.
Este polinomio aproxima tanto la función en los nodos como la derivada
de la función.
Realicemos los cálculos con el mismo ejemplo que anteriormente.

%ei f(x):=cos(x)-x$
%el der:diff(f(x),x)$
%el xx:[2,2.5,3,3.5]$

En este caso hay que crear la lista \maximain{zz}, que son los nodos
repetidos dos veces.

%ei zz:flatten(create_list([xx[i],xx[i]],i,1,length(xx)));
%do

Las diferencias de orden 0 son directamente las imágenes de los
puntos de la lista \maximain{zz}.

%ei d0:create_list(float(f(zz[i])),i,1,length(zz));
%do

Las diferencias de orden 1 son un poco diferentes, ya que dependiendo
de si el índice es par o impar. En este caso se hace uso de la derivada
de la función.

%ei d1:create_list(
%el 	if mod(i,2)=0 then (d0[i+1]-d0[i])/(zz[i+1]-zz[i])
%el 	else float(ev(der,x=zz[i])),
%el i,1,length(zz)-1);
%do

El resto de diferencias se calculan de la misma forma que anteriormente,
y como ya se tiene implementada la función que calcula las siguientes
diferencias en función de las anteriores pues hacemos uso de la función.

%% función de newton.tm...
%c diflistan(n,xx,dd):=
%c create_list((dd[i+1]-dd[i])/(xx[i+n]-xx[i]),i,1,length(xx)-n)$

%ei d2:diflistan(2,zz,d1);
%do

%ei d3:diflistan(3,zz,d2);
%do

%ei d4:diflistan(4,zz,d3);
%do

%ei d5:diflistan(5,zz,d4);
%do

%ei d6:diflistan(6,zz,d5);
%do

%ei d7:diflistan(7,zz,d6);
%do

Se guardan en una lista cada lista de diferencias de cada orden.

%ei difs:[d0,d1,d2,d3,d4,d5,d6,d7];
%do

Por último se calcula el polinomio a partir de todas las diferencias.

%ei pol:0$
%el prod:1$
%el for i:1 thru length(zz) do(
%el pol:pol + prod*difs[i][1],
%el prod:prod*(x-zz[i]))$
%el pol;
%do
%ei expand(pol);
%do

A continuación calculamos la aproximación y el error absoluto en el
punto $x=2.6$.

%ei ev(pol,x=2.6);
%do

%ei ev(f(x)-pol,x=2.6);
%do

Por último representamos la función y el polinomio de interpolación.

%ei wxplot2d([f(x),pol],[x,1.5,4]);
%c plot2d([f(x),pol],[x,1.5,4],[pdf_file,"./hermite1.pdf"]);
\begin{maximat}\begin{center}
\includegraphics[width=.5\textwidth]{hermite1.pdf}
\end{center}\end{maximat}
