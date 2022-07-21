%!TeX root=main.tex

\subsection*{Método de la secante}

El método de la secante también es un método iterativo
para aproximar raíces de funciones.
El método se basa en una la idea geométrica de aproximar
la función por una secante.
Se empieza con dos valores $x_0$ y $x_1$ y a partir de
estos valores se empiezan a calcular $x_2,x_3,\ldots$
Veamos este método en un ejemplo concreto.

Consideremos la función $f(x)=x^3-2x-3$, $x_0=4$ y
$x_1=3$.
%ei f(x):=x^3-2*x-3$
%el x0:4$
%el x1:3$

\begin{figure}[ht]
 \centering
 \begin{tikzpicture}[scale=.3,xscale=4,yscale=.25,domain=0:4,samples=400]
  \foreach \i in {0,1,2,3,4}
  {
   \draw (\i,.2) -- (\i, -.2) node[below] {$\i$};
  }
  \draw[black] plot (\x, 0);
  \draw[black] (0,-1) -- (0,55);
  \draw[blue, domain=0:4] plot (\x, {\x^3-\x-3});
 \end{tikzpicture}
 \caption{Función $f(x)=x^3-2x-3$ en $[0,4]$}
 \label{fig:fun3}
\end{figure}

A continuación realizaremos la siguiente iteración.
Esto significa calcular $x_2$ a partir de $x_0$ y $x_1$,
se calcula con la siguiente expresión
\begin{equation*}
x_2 = x_1 - f(x_1)\frac{x_1 - x_0}{f(x_1) - f(x_0)}.
\end{equation*}
Y este punto $x_2$ es geométricamente el punto de corte
con el eje $X$
de la recta que pasa por los puntos
$(x_0,f(x_0))$ y $(x_1,f(x_1))$.

En la Figura \ref{fig:sec1} se puede ver la representación gráfica
del cálculo de $x_2$.

\begin{figure}[ht]
\centering
\begin{tikzpicture}[scale=.3,xscale=4,yscale=.25,domain=0:4,samples=400]
\draw (4,.2) -- (4, -.2) node[below] {$x_0$};
\draw (3,.2) -- (3, -.2) node[below] {$x_1$};
\draw[orange,dotted] (3,0) -- (3, {3^3-2*3-3});
\draw[orange,dotted] (4,0) -- (4, {4^3-2*4-3});
\draw (2.4857,.2) -- (2.4857, -.2) node[below] {$x_2$};
\draw[red] (2.4857,0) -- (4, {4^3-2*4-3});
\draw[black] plot (\x, 0);
\draw[black] (0,-1) -- (0,55);
\draw[blue, domain=0:4] plot (\x, {\x^3-2*\x-3});
\end{tikzpicture}
\caption{Representación geométrica de $x_2$ en el método de la secante}
\label{fig:sec1}
\end{figure}

Con maxima se puede calcular $x_2$ de la siguiente manera.

%ei fx0:float(f(x0));
%el fx1:float(f(x1));
%el x2:x1 - fx1*(x1-x0)/(fx1-fx0);
%do

El cálculo anterior es el cálculo de las iteraciones
en el método de la secante.
Este cálculo se puede definir en una función.

%ei secante_siguiente(f,x0,x1):=block(
%el [fx0:float(f(x0)),fx1:float(f(x1)),x2],
%el x2:x1 - fx1*(x1-x0)/(fx1-fx0))$

A continuación realizamos varias iteraciones.

%ei x2:secante_siguiente(f,x0,x1);
%do

%ei x3:secante_siguiente(f,x1,x2);
%do

Antes de crear el bucle para repetir el proceso, habrá
que decidir qué condición de parada implementaremos.
La condición de parada del método de bisección es clara
porque se sabe a priori el error que se está cometiendo,
pero en el método de la secante no se sabe qué error se comete.
Así que se decide parar cuando parezca que la sucesión
de aproximaciones converge, y esto se comprobará heurísticamente
comparando la distancia entre los últimos puntos calculados.

Pongamos una cierta tolerancia y repetiremos iteraciones del bucle
mientras que la distancia entre los dos puntos anteriores sea mayor
que esa tolerancia.

Primero definimos los datos del ejemplo.
Y después se ejecuta el bucle.

%ei f(x):=x^3-2*x-3$
%el x0:4$
%el x1:3$
%el tol:.1$

%ei k:0$
%el while k<100 and abs(x1-x0)>tol do
%el (x2:secante_siguiente(f,x0,x1),
%el x0:x1, x1:x2, k:k+1)$
%el x1;
%do

El valor de la aproximación está en la variable
\maximain{x1} y es $
%cd x1;
$.

A continuación mostramos otro ejemplo con datos diferentes.

%ei f(x):=%e^x-2/(1+x^2)$
%el x0:.8$
%el x1:.9$
%el tol:10^-4$

%ei k:0$
%el while k<100 and abs(x1-x0)>tol do
%el (x2:secante_siguiente(f,x0,x1),
%el x0:x1, x1:x2, k:k+1)$
%el x1;
%do
