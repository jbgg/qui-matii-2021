%!TeX root=main.tex

\section{EDOs lineales homogéneas}

Una ecuación diferencial lineal homogénea
es una ecuación diferencial de la forma
\begin{equation*}
y^{n)} + a_{n-1} y^{n-1)}
+ \cdots +
a_{1} y' + a_0 y
=
0.
\end{equation*}

Para encontrar la solución general de la
ecuación diferencial anterior hay que encontrar
un conjunto fundamental de soluciones.
Un sistema fundamental de una ecuación
diferencial de orden $n$
tiene $n$ funciones.
Para encontrar el conjunto fundamental de soluciones
hay que resolver el polinomio característico.

Veamos cómo se lleva a cabo con un ejemplo.
Consideremos la ecuación diferencial lineal
\begin{equation*}
y'' -9y' +14y = 0.
\end{equation*}
El polinomio característico es
$\lambda^2 -9\lambda +14 = 0.$
Podemos calcular las raíces del polinomio.
%ei solve(L^2-9*L+14=0,L);
%do

Entonces un sistema fundamental de soluciones será
$y_1=e^{7x}$,
$y_2=e^{2x}$.

Comprobemos que las funciones anteriores son solución
de la ecuación diferencial.
Definimos primero la ecuación diferencial.
%ei depends(y,x)$
%el ec:diff(y,x,2)-9*diff(y,x)+14*y=0;
%do

Vemos que se verifica la ecuación para las funciones anteriores.

%ei y1(x):=%e^(7*x)$
%el ev(ec,y=y1(x),diff);
%do

%ei y2(x):=%e^(2*x)$
%el ev(ec,y=y2(x),diff);
%do

Consideremos la ecuación diferencial lineal
\begin{equation*}
y'' + 16y = 0.
\end{equation*}
El polinomio característico es
$\lambda^2 + 16 = 0.$
Podemos calcular las raíces del polinomio.
%ei solve(L^2+16=0,L);
%do

Entonces un sistema fundamental de soluciones será
$y_1=\cos(4x)$,
$y_2=\sin(4x)$.

Comprobemos que las funciones anteriores son solución
de la ecuación diferencial.
Definimos primero la ecuación diferencial.
%ei depends(y,x)$
%el ec:diff(y,x,2)+16*y=0;
%do

Vemos que se verifica la ecuación para las funciones anteriores.

%ei y1(x):=cos(4*x)$
%el ev(ec,y=y1(x),diff);
%do

%ei y2(x):=sin(4*x)$
%el ev(ec,y=y2(x),diff);
%do

Consideremos la ecuación diferencial lineal
\begin{equation*}
y'' -6y' + 9y = 0.
\end{equation*}
El polinomio característico es
$\lambda^2 -6\lambda + 9 = 0.$
Podemos calcular las raíces del polinomio.
%ei solve(L^2-6*L+9=0,L);
%do
También se puede ver con
%ei factor(L^2-6*L+9);
%do

Entonces un sistema fundamental de soluciones será
$y_1=e^{3x}$
$y_2=xe^{3x}$

Comprobemos que las funciones anteriores son solución
de la ecuación diferencial.
Definimos primero la ecuación diferencial.
%ei depends(y,x)$
%el ec:diff(y,x,2)-6*diff(y,x)+9*y=0;
%do

Vemos que se verifica la ecuación para las funciones anteriores.

%ei y1(x):=%e^(3*x)$
%el ev(ec,y=y1(x),diff);
%do

%ei y2(x):=x*%e^(3*x)$
%el ratsimp(ev(ec,y=y2(x),diff));
%do
