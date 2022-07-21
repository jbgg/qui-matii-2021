%!TeX root=main.tex

\section{Comprobación de soluciones de EDOs}

\subsection*{Soluciones explícitas}

En esta sección veremos cómo comprobar que cierta función
es solución de una ecuación diferencial ordinaria.

Veamos un ejemplo, con la ecuación diferencial
\begin{equation*}
xy'+y-y^2=0,
\end{equation*}
y la función
$y(x)=\frac{2}{2+x}$.
En este caso la solución está dada de forma explícita,
ya que la variable dependiente $y$ está despejada en
función de la variable independiente $x$.

Primero definamos la posible solución como una función
\maximain{y(x)}.

%ei y(x):=2/(2+x)$

Y a continuación se hará el cálculo de la ecuación
diferencial con la función anteriormente definida,
al cálculo anterior lo llamaremos \maximain{ec}.

%ei ec:x*diff(y(x),x)+y(x)-y(x)^2=0;
%do

Si la función \maximain{y(x)} es solución de la ecuación
diferencial entonces la ecuación anterior debe ser cierta,
para comprobarlo habrá que simplificar la ecuación.

%ei ratsimp(ec);
%do

Como vemos la ecuación se verifica.
También se puede usar el comando \maximain{is}.

%ei is(ratsimp(ec));
%do

\subsection*{Soluciones implícitas}

Vamos a hacer un \maximain{kill} para empezar un nuevo
ejemplo.

%ei kill(all)$

Antes de explicar cómo se resuelve este tipo de ecuaciones
se explicará como se puede derivar una función que depende
de la variable independiente.

Si $y$ depende de $x$ y hacemos el siguiente cálculo.

%ei diff(y,x);
%do

El cálculo no sería correcto, ya que debería quedar
la derivada de $y$ con respecto a $x$.
Para hacer este cálculo correctamente existen dos maneras.
La primera es escribir \maximain{y(x)}.

%ei diff(y(x),x);
%do

Con el método anterior hay que escribir \maximain{y(x)}
cada vez que aparezca la variable $y$.
Para no tener que estar escribiendo tanto, se puede
decir al principio que $y$ depende de $x$, y así
siempre que encuentre la deriviada de $y$ con respecto
a $x$ dejará la expresión como la derivada.

%ei depends(y,x)$
%ei diff(y,x);
%do

Veamos ahora el ejemplo de comprobación de solución
implícita.
Se va a comprobar que la ecuación
$e^{xy}+y=x-1$
es solución implícita de la ecuación diferencial
$y'-\frac{e^{xy}-y}{e^{xy}+x} = 0$.

Primero usamos \maximain{kill} para empezar con
todas las variables sin inicializar.
Y decimos la dependencia $y(x)$.

%ei kill(all)$
%ei depends(y,x)$

A continuación definimos la solución implícita.

%ei sol_impl:%e^(x*y)+y=x-1$

Y se deriva implícitamente.

%ei sol_der:ratsimp(diff(sol_impl,x));
%do

Lo siguiente es despejar $y'$.

%ei sol:solve(sol_der,diff(y,x));
%do

A continuación se sustituye la solución anterior
en la ecuación diferencial y se simplifica.

%ei ec:diff(y,x)-(%e^(-x*y)-y)/(%e^(-x*y)+x)=0$
%ei is(ratsimp(ev(ec, sol)));
%do

\subsection*{Soluciones del problema de Cauchy}

Consideraremos como ejemplo el problema de Cauchy
\begin{equation*}
\left\{
\begin{aligned}
y' &= \frac{3}{2}y^{\frac{2}{3}} \\
y(0) &= 0 \\
\end{aligned}
\right.
\end{equation*}

Para comprobar que la función $y=\frac{x^3}{8}$
es solución del problema de Cauchy, habrá que comprobar
que verifica la ecuación diferencial y la condición
inicial.

%ei kill(all)$
%ei y(x):=x^3/8$
%ei ec:diff(y(x),x)=3/2*y(x)^(2/3)$
%ei is(ratsimp(ec));
%do

Ya se ha comprobado que se verifica la ecuación
diferencial, a continuación comprobamos la
condición inicial.

%ei is(ratsimp(y(0)=0));
%do

\section{Resolución con \maximain{edo2} e
\maximain{ic1}}

Para calcular la solución general de una
ecuación diferencial general se usa el comando
\begin{center}
\maximain{ode2(ecuación,y,x)}
\end{center}
donde \maximain{ecuación} es la ecuación diferencial,
\maximain{y} es la variable dependiente y
\maximain{x} es la variable independiente.

Por ejemplo para resolver la ecuación diferencial
\begin{equation*}
y=xy'+y^2x^2
\end{equation*}
se hará lo siguiente.

%ei kill(all)$
%ei depends(y,x)$
%ei ec:y=x*diff(y,x)+y^2*x^2$
%ei sol:ode2(ec, y, x);
%do

Como se puede ver la solución general depende
de un parámetro que se denota como $\%c$.

Si se quiere resolver un problema de valores iniciales o
problema de Cauchy, entonces además de \maximain{ode2}
se usará \maximain{ic1} para indicar la condición inicial.

Veamos cómo resolver el problema de valores iniciales
\begin{equation*}
\left\{
\begin{aligned}
\cos x\sen x-xy^2+y(1-x^2)y' & = 0 \\
y(0) & = 2 \\
\end{aligned}
\right.
\end{equation*}

%ei kill(all)$
%ei depends(y,x)$
%ei ec:cos(x)*sin(x)-x*y^2+y*(1-x^2)*diff(y,x) = 0$
%ei sol:ode2(ec,y,x);
%do
%ei ic1(sol,x=0,y=2);
%do
