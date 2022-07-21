%!TeX root=main.tex

\subsection*{Polinómio de Lagrange}

El polinomio de Lagrange es el polinomio de menor grado que pasa
por una colección de puntos.
Se va a usar este polinomio para aproximar ciertas funciones usando
una colección de puntos.

Tomemos como ejemplo la función
$f(x)=
e^{\sin(x)}
$
en los puntos $0,\frac{1}{2},1,\frac{3}{2},2,\frac{5}{2}$ y $3$.

Definamos la función y una lista con los puntos anteriores.

%ei f(x):=%e^sin(x)$
%ei xx:create_list(.5*i,i,0,6);
%do

Ahora definamos la lista de puntos, esto es la lista de puntos
con primera coordenada la los elementos de la lista anterior y
con segunda coordenada la imagen de la función.

%ei puntos:create_list([x,f(x)],x,xx);
%do

Ahora ya se puede calcular el polinomio de Lagrange que pasa por
los puntos anteriores.
Para llevarlo acabo hay que cargar el paquete con
\maximain{load(interpol)}.
Y así se podrá usar la función llamada \maximain{lagrange}.

%ei load(interpol)$
%ei p:lagrange(puntos);
%do

Por defecto la función \maximain{lagrange} devuelve un polinomio
en la variable \maximain{x}.

Si se quiere mostrar el polinomio con sus coeficientes habrá que
aplicarle \maximain{expand}.

%ei expand(p);
%do

Para calcular el error entre el polinomio de interpolación y la
función original en algún punto habrá que evaluar la función y
el polinomio en dicho punto y calcular la distancia.
Por ejemplo para los puntos $x=1.8$, $x=2.1$ y $x=-0.5$.

%ei abs(f(1.8)-ev(p,x=1.8));
%do

%ei abs(f(2.1)-ev(p,x=2.1));
%do

%ei abs(f(-.5)-ev(p,x=-.5));
%do

También se podría hacer la gráfica de la función y el polinomio
de Lagrange.

%ei wxplot2d([f(x),p],[x,-1,4]);
%c plot2d([f(x),p],[x,-1,4],[pdf_file, "./lagrange1.pdf"])$
\begin{maximat}\begin{center}
\includegraphics[width=.5\textwidth]{lagrange1.pdf}
\end{center}\end{maximat}
