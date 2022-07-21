%!TeX root=main.tex

\section{Métodos de resolución}

\subsection*{Variables separables}

Cuando una ecuación diferencial se puede escribir de la forma
\begin{equation*}
y'=a(x)b(y)
\end{equation*}
se dice que es de variables separables.
Y en este caso las soluciones son de la forma
\begin{itemize}
\item si $b(y)\neq0$ entonces
\begin{equation*}
\int \frac{1}{b(y)}\,\mathrm{d}y
=
\int a(x)\,\mathrm{d}x
+c,
\end{equation*}
\item si $b(y)=0$ entonces
\begin{equation*}
y(x) = y_0.
\end{equation*}
\end{itemize}

Consideremos como ejemplo la ecuación diferencial
\begin{equation*}
y' = \frac{y^2-1}{x^2-1}.
\end{equation*}
Para resolverla definamos \maximain{a(x)} y
\maximain{b(x)} adecuadamente.

%ei a(x):=1/(x^2-1)$
%el b(y):=y^2-1$

La solución general se puede calcular integrando.

%ei sol:integrate(1/b(y),y) = integrate(a(x),x)+%c;
%do

Las soluciones singulares se pueden calcular
buscando cuando $b(y)=0$.

%ei solve(b(y)=0,y);
%do

Por tanto $y(x)=1$ e $y(x)=-1$ son soluciones
singulares de la ecuación diferencial del ejemplo.

\subsection*{Ecuaciones diferenciales homogéneas}

Una ecuación diferencial
\begin{equation*}
y' = f(x,y)
\end{equation*}
es homogénea si se verifica
$f(tx,ty) = f(x,y)$ para todo $t\neq0$.

La forma de resolver este tipo de ecuaciones
diferenciales es con un cambio de variable
\begin{equation*}
y=zx,
\end{equation*}
obteniéndose una ecuación diferencial de
variables separables.

Resolveremos la ecuación diferencial homogénea
\begin{equation*}
y' = \frac{y}{2(x+y)}.
\end{equation*}
Lo primero esrá comprobar que es homogénea.

%ei f(x,y):=y/(2*(x+y))$

%ei is(ratsimp(f(t*x,t*y) = f(x,y)));
%do

Primero se va a calcular la ecuación diferencial
después de aplicar el cambio de variable.

%ei depends(z,x)$

%ei ec1:diff(z*x,x)=f(x,z*x);
%do

%ei ec:factor(solve(ec1,diff(z,x)));
%do

A continuación habrá que resolvarla como se ha visto anteriormente.

%ei a(x):=1/x$
%el b(z):=-z*(2*z+1)/(2*(z+1))$
%el sol2:integrate(1/b(z),z)=integrate(a(x),x)+%c;
%do

La solución anterior es la solución general de la ecuación
diferencial después de aplicar el cambio, ahora habrá que
deshacer el cambio de variables para conseguir la solución
general de la ecuación diferencial original.

%ei sol:ev(sol2,z=y/x);
%do

Las soluciones singulares de la ecuación en la variable
$z$ se encuentran resolviendo $b(z)=0$.

%ei solve(b(z)=0,z);
%do

Por tanto las soluciones singulares son $z=-\frac{1}{2}$
y $z=0$.
Deshaciendo el cambio de variable conseguimos las soluciones
singulares de la ecuación diferencial original, que son
$y=-\frac{1}{2}x$ e $y=0$.

\subsection*{Ecuaciones diferenciales exactas}

Una ecuación diferencial
\begin{equation*}
M(x,y)\,\mathrm{d}x + N(x,y)\,\mathrm{d}y = 0
\end{equation*}
es exacta si
\begin{equation*}
\frac{\partial M(x,y)}{\partial y}
=
\frac{\partial N(x,y)}{\partial x}.
\end{equation*}

La resolución de una ecuación diferencial exacta
se lleva a cabo mediante los siguientes pasos.

\begin{enumerate}
\item Calcular
\begin{equation*}
A=\int M\,\mathrm{d}x,
\end{equation*}
\item calcular
\begin{equation*}
B=\int \left( N - \frac{\partial A}{\partial y} \right)\,\mathrm{d}y,
\end{equation*}
\item la solución implícita es $A+B=C$,
siendo $C$ una constante.
\end{enumerate}

Otra manera equivalente de calcular la solución es realizar
los siguientes pasos.

\begin{enumerate}
\item Calcular
\begin{equation*}
A=\int N\,\mathrm{d}y,
\end{equation*}
\item calcular
\begin{equation*}
B=\int \left( M - \frac{\partial A}{\partial x} \right)\,\mathrm{d}x,
\end{equation*}
\item la solución implícita es $A+B=C$,
siendo $C$ una constante.
\end{enumerate}

Consideremos como ejemplo la ecuación diferencial
\begin{equation*}
(3x^2+4xy) + (2x^2+2y)y'=0.
\end{equation*}

Definimos \maximain{M} y \maximain{N}, y comprobaremos
que es una ecuación diferencial exacta.

%ei M:3*x^2+4*x*y$
%el N:2*x^2+2*y$

%ei is(ratsimp(diff(M,y)=diff(N,x)));
%do

A continuación calcularemos la solución como se indica
anteriormente.

%ei A:integrate(M,x);
%do

%ei B:integrate(N-diff(A,y),y);
%do

%ei sol:A+B=%c;
%do

\subsection*{Factor integrante}

Dada una ecuación diferencial de la forma
\begin{equation*}
M(x,y)\,\mathrm{d}x + N(x,y)\,\mathrm{d}y = 0,
\end{equation*}
un factor integrante es una función $\mu(x,y)$
que hace que la ecuación diferencial
\begin{equation*}
\mu(x,y)M(x,y)\,\mathrm{d}x + \mu(x,y)N(x,y)\,\mathrm{d}y = 0,
\end{equation*}
sea exacta.

Una manera de buscar un factor integrante
es comprobar que la expresión
\begin{equation*}
f=\frac{\frac{\partial M}{\partial y} - \frac{\partial N}{\partial x}}{N}
\end{equation*}
no dependa de la variable $y$,
entonces un factor integrante es
\begin{equation*}
\mu(x) = e^{\int f\,\mathrm{d}x}.
\end{equation*}

Otra manera es buscar un factor integrante
que solamente de la variable $y$,
esto se consigue cuando la expresión
\begin{equation*}
f=\frac{\frac{\partial N}{\partial x} - \frac{\partial M}{\partial y}}{M}
\end{equation*}
no dependa de la variable $x$,
entonces un factor integrante es
\begin{equation*}
\mu(y) = e^{\int f\,\mathrm{d}y}.
\end{equation*}

Veamos como ejemplo la ecuación diferencial
\begin{equation*}
(x+y)\,\mathrm{d}x + \mathrm{d}y = 0.
\end{equation*}

%ei M:x+y$
%el N:1$

%ei is(ratsimp(diff(M,y)=diff(N,x)));
%do

Busquemos un factor integrante que dependa solamente
de $x$, para ello vemos si la siguiente expresión
depende de $y$.

%ei f:ratsimp((diff(M,y)-diff(N,x))/N);
%do

Ya que no depende de $y$, podemos usarlo
para calcular un factor integrante.

%ei mu:%e^integrate(f,x);
%do

Ahora resolvemos la nueva ecuación diferencial
con el factor integrante.

%ei M2:ratsimp(mu*M)$
%ei N2:ratsimp(mu*N)$

Comprobamos que efectivamente es exacta.

%ei is(ratsimp(diff(M2,y)=diff(N2,x)));
%do

Y se resuelve como una ecuación diferencial
exacta.

%ei A:integrate(M2,x)$
%el B:integrate(N2-diff(M2,y),y)$
%el sol:A+B=%c;
%do
