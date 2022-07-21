%!TeX root=main.tex

\section*{Resolución de ecuaciones no homogéneas:
método de coeficientes indeterminados}

En el método de coeficientes indeterminados la
solución particular se calcula a partir del
término independiente de la ecuación lineal
no homogénea.
En realidad este método funciona porque para
algunas funciones como término independiente
se conoce la forma que puede tener una solución
particular.
Esta posible solución particular estará en función
de coeficientes que se tendrán que determinar.
Veámoslo en algunos ejemplos.

\textbf{Ejemplo.}
Consideremos la ecuación diferencial
\begin{equation*}
%c expand((L-3)^2*L);
y'''-6y''+9y' = \sen x.
\end{equation*}

Primero habrá que resolver el sistema homogéneo,
calculando un sistema fundamental.

%ei p:L^3-6*L^2+9*L$
%el factor(p);
%do

Así que un sistema fundamental es el que se define
a continaución en la lista \maximain{yy}.

%ei yy:[%e^(3*x), x*%e^(3*x), 1]$

A continuación se va a aplicar el método de coeficientes
indeterminados para calcular una solución particular.
Dependiendo de la función $f(x)$ la solución tendrá
una forma u otra.
En este caso $f(x)=\sen x$ por tanto se busca una solución
particular de la forma
\begin{equation*}
y_p = A \cos x + B \sen x.
\end{equation*}
Habrá que buscar las constantes $A$ y $B$ para que la función
anterior sea solución de la ecuación lineal no homogénea.
Y así se deduce una solución particular.

%ei yp:A*cos(x) + B*sin(x)$

%ei ec:expand(diff(yp,x,3)-6*diff(yp,x,2)+9*diff(yp,x) = sin(x));
%do

%ei q1:coeff(ec,sin(x));
%do
%ei q2:coeff(ec,cos(x));
%do

%ei solcoeff:solve([q1,q2],[A,B]);
%do

%ei yp:ev(yp,solcoeff);
%do

Así que la solución general de la ecuación diferencial
no homogénea será la siguiente.

%ei solgen:c1*yy[1]+c2*yy[2]+c3*yy[3] + yp;
%do

\textbf{Ejemplo.}
Consideremos la ecuación diferencial
\begin{equation*}
%c expand((L^2-(2*(-1))*L+1^2+2^2)*(L+1));
y''' + 3 y'' +7y' +5 y = x-3;
\end{equation*}

Primero habrá que resolver el sistema homogéneo,
calculando un sistema fundamental.

%ei p:L^3+3*L^2+7*L+5$
%el solve(p=0,L);
%do

Así que un sistema fundamental es el que se define
a continaución en la lista \maximain{yy}.

%ei yy:[%e^(-x), %e^(-x)*cos(2*x), %e^(-x)*sin(2*x)]$

A continuación se va a aplicar el método de coeficientes
indeterminados para calcular una solución particular.
Dependiendo de la función $f(x)$ la solución tendrá
una forma u otra.
En este caso $f(x)=x-3$ por tanto se busca una solución
particular de la forma
\begin{equation*}
y_p = Ax + B.
\end{equation*}
Habrá que buscar las constantes $A$ y $B$ para que la función
anterior sea solución de la ecuación lineal no homogénea.
Y así se deduce una solución particular.

%ei yp:A*x+B$

%ei ec:expand(diff(yp,x,3)+3*diff(yp,x,2)+7*diff(yp,x)+5*yp = x-3);
%do

%ei q1:coeff(ec,x);
%do
%ei q2:ev(ec,x=0);
%do

%ei solcoeff:solve([q1,q2],[A,B]);
%do

%ei yp:ev(yp,solcoeff);
%do

Así que la solución general de la ecuación diferencial
no homogénea será la siguiente.

%ei solgen:c1*yy[1]+c2*yy[2]+c3*yy[3] + yp;
%do
