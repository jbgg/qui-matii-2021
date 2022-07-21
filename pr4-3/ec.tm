%!TeX root=main.tex

\section*{Resolución de ecuaciones no homogéneas}

La solución general de una ecuación diferencial no homogénea
se puede calcular como la suma de una solución particular y
la solución general de la ecuación diferencial homogénea
asociada.

Veamos dos métodos diferentes para calcular una solución particular
de una ecuación diferencial lineal no homogénea.

\section*{Resolución de ecuaciones no homogéneas: método de variación de constantes}

Veremos este método solamente en el caso de orden 2,
ya que daremos expresiones explícitas del cálculo de la solución particular.

\textbf{Ejemplo.}
Considere la ecuación diferencial
\begin{equation*}
y'' + y = \cos^2 x,
\end{equation*}
veremos cómo deducir una solución general de la ecuación lineal anterior
por el método de variación de constantes.
El primer paso es calcular un sistema fundamental de soluciones de la
ecuación lineal homogénea asociada, la cual es
\begin{equation*}
y'' + y = 0.
\end{equation*}

%ei p:L^2+1$
%ei solve(p=0,L);
%do

Por tanto un sistema fundamental de soluciones de la ecuación homogénea es
\begin{equation*}
\begin{aligned}
y_1(x) &= \cos(x) \\
y_2(x) &= \sin(x) \\
\end{aligned}
\end{equation*}

Entonces la solución general del sistema no homogénea es
\begin{equation*}
c_1y_1(x) + c_2y_2(x) + y_p(x),
\end{equation*}
siendo $y_p(x) = u_1(x) y_1(x) + u_2(x) y_2(x)$ y las funciones
$u_1$ y $u_2$ se calculan con las expresiones
\begin{equation*}
u_1(x) = -\int \frac{y_2(x)f(x)}{W(y_1,y_2)(x)}\,\mathrm{d}x
\qquad
u_2(x) = \int \frac{y_1(x)f(x)}{W(y_1,y_2)(x)}\,\mathrm{d}x
\end{equation*}
en este ejemplo $f(x) = \cos^2(x)$,
y $W$ es el Wronskiano.

Vamos a calcular $u_1$ y $u_2$ en maxima.

%ei yy:[cos(x),sin(x)]$

%ei f:cos(x)^2$

%ei load(functs)$

%ei w:ratsimp(determinant(wronskian(yy,x)));
%do

%ei u1:-integrate(yy[2]*f/w,x);
%do
%ei u2:integrate(yy[1]*f/w,x);
%do

Así que la solución particular de la ecuación no homogénea
es la siguiente.

%ei yp:ratsimp(u1*yy[1]+u2*yy[2]);
%do

Y la solución general de la ecuación no homogénea ya se puede
calcular.

%ei solgen:c1*yy[1]+c2*yy[2]+yp;
%do

\textbf{Ejemplo.}
Veamos cómo se podría resolver el siguiente problema de valores
iniciales con una ecuación diferencial lineal no homogénea.
\begin{equation*}
\left.
\begin{aligned}
y'' + y &= \cos^2(x). \\
y(0) &= 1 \\
y'(0) &= 0 \\
\end{aligned}
\right\}
\end{equation*}
Para resolver el problema de valores iniciales anterior
primero habrá que calcular la solución general de la ecuación
diferencial.
En este caso da la casualidad que se ha resuelto en el ejemplo
anterior y la solución general es

%ei solgen;
%do

A continuación, a partir de solución general habrá que calcular
el valor de los coeficientes para que verifique las condiciones
iniciales.

%ei dsolgen:diff(solgen,x)$

%ei solcoef:solve([ev(solgen,x=0)=1,ev(dsolgen,x=0)=0],[c1,c2]);
%do

La solución del problema de valores iniciales se calcula
sustituyendo los valores de los coeficientes en la solución
general de la ecuación.

%ei sol:ev(solgen,solcoef);
%do
