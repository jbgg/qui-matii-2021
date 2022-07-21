Presentaremos el método de bisección,
que se basa en una idea muy simple para
buscar una raíz de una función.
Para mostrarlo vamos a tomar como ejemplo
la función siguiente.
%ei f(x):=2*x-%e^(-x)$

Para empezar este método hay que buscar
un intervalo donde exista una raíz de
la función.
En este caso tomaremos el intervalo
$[0,1]$.
En este intervalo la función cambia de signo.
%ei f(0),numer;
%do
%ei f(1),numer;
%do

En una función continua en un intervalo que los valores
de la función en los extremos del intervalo cambia de
signo se asegura la existencia de una raíz de la función
en el intervalo.
En este caso también se puede ver gráficamente.

%ei wxplot2d(f(x),[x,0,1]);
%c plot2d(f(x),[x,0,1],[pdf_file, "./grafica1.pdf"]);
\begin{maximat}\begin{center}
\includegraphics[width=.5\textwidth]{grafica1.pdf}
\end{center}\end{maximat}

Ahora vamos a explicar el procedimiento del método,
este procedimiento consiste en calcular un intervalo
más pequeño donde se encuentra una raíz.
Así este procedimiento cada vez que se repite se
acerca al valor de una raíz.
La aproximación consiste en dividir el intervalo
por la mitad y de los dos subintervalos que quedan
qudarnos con el que tenga cambio de signo en los
extremos de los intervalos.

Primero definamos los puntos extremos del intervalo
inicial.

%ei a0:0$ b0:1$

El punto medio será.

%ei c0:(a0+b0)/2,numer;
%d

Ahora nos quedaremos o bien con el intervalo
$[
%cd a0;
,
%cd c0;
]$
o con el intervalo
$[
%cd c0;
,
%cd b0;
]$,
dependiendo del signo de la función en los extremos
de cada intervalo.
Para ello vemos donde hay cambio de signo.

%ei f(a0)*f(c0),numer;
%do
%ei f(c0)*f(b0),numer;
%do

Como vemos en el intervalo $[\maximain{a0},\maximain{c0}]$
existe un cambio de signo, así que se elige el intervalo
$[\maximain{a1},\maximain{b1}]$ con los valores siguientes.

%ei a1:a0$ b1:c0$

En este caso sabemos que la raíz de la función se encuentra
en el intervalo $[\maximain{a1},\maximain{b1}]$.
Y la longitud de este intervalo es precisamente la mitad de
la longitud del intervalo original.
Si tomamos como aproximación a la raíz el punto medio de este
intervalo se tiene que el error máximo cometido sería
\begin{equation*}
\frac{\maximain{b1}-\maximain{a1}}{2} =
%cd (b1-a1)/2;
.
\end{equation*}
La aproximación sería el valor definido como \maximain{c1}.

%ei c1:(a1+b1)/2;
%do

Realicemos otra iteración del método, calculando directamente
el siguiente intervalo y el punto medio.

%ei if f(a1)*f(c1)<0 then
%el (a2:a1, b2:c1)
%el else
%el (a2:c1, b2:b1)$
%el [a2,b2];
%do

%ei c2:(a2+b2)/2;
%do

En este caso se comete un error máximo de
\begin{equation*}
\frac{\maximain{b2}-\maximain{a2}}{2} =
%cd (b2-a2)/2;
.
\end{equation*}

Notamos que la cota del error va disminuyendo en cada
iteración la mitad del valor anterior.

Para automatizar el método (creando un bucle para repetir
el proceso) se puede definir una función que realice el
cálculo anterior que se ha hecho, esto es, a partir de
un intervalo y una función, que calcule el siguiente
subintervalo que se considera.

%ei biseccion_siguiente(f, a, b):=block(
%el [c:float((a+b)/2), a1, b1],
%el if f(a)*f(c)<0 then (a1:a,b1:c) else
%el (a1:c,b1:b),
%el [a1,b1])$

Comprobamos la función con los datos de antes para
comprobar que está correcta.

%ei [a2,b2]:biseccion_siguiente(f, a1, b1);
%do

Vemos que es el mismo resultado que anteriormente,
así que vamos a continuar calculando iteraciones.

%ei [a3,b3]:biseccion_siguiente(f, a2, b2);
%do
%ei [a4,b4]:biseccion_siguiente(f, a3, b3);
%do
%ei [a5,b5]:biseccion_siguiente(f, a4, b4);
%do

La aproximación de la raíz según el último intervalo
es la siguiente.

%ei c5:(a5+b5)/2;
%do

Y el error máximo cometido es
\begin{equation*}
\frac{\maximain{b5}-\maximain{a5}}{2} =
%cd (b5-a5)/2;
.
\end{equation*}

Comprobemos que esto es cierto usando la aproximación
que calcula maxima con el comando \maximain{find\_root}.

%ei sol:find_root(f, a0, b0);
%do

%ei abs(c5-sol);
%do

Observamos que el error cometido es menor que la cota
del error calculada anteriormente.

Ya se ha visto cómo se aplica cada paso del método,
quedaría por ver cuántas veces se realizará.
Esto dependerá de la exactitud que se requiera en la
aproximación.

En el método de bisección se conoce el error máximo
que se comete en cada paso, si se inicia el método
con un intervalo $[a,b]$, entonces en la primera iteración
se obtiene un intervalo $[a_1,b_1]$ que su longitud
es la mitad de $b-a$, y la aproximación sería el punto central
del intervalo $[a_1,b_1]$, y tendría por tanto un cota del
error de
\begin{equation*}
\frac{b_1-a_1}{2} = \frac{b-a}{4}.
\end{equation*}
Si este proceso se repite $n$ veces, entonces el error
que máximo que se comete es
\begin{equation*}
\frac{b_n-a_n}{2} = \frac{b-a}{2^{n+1}}
\end{equation*}

Así que si se busca una aproximación a una raíz con un
error menor que $\varepsilon$ se buscará un número $n$
que cumpla
\begin{equation*}
\frac{b-a}{2^{n+1}} < \varepsilon
\end{equation*}
de este modo la cota del error es más pequeña que la
tolerancia permitida del error.
Equivalentemente
\begin{equation*}
\frac{\log\left(\frac{b-a}{\varepsilon}\right)}{\log 2}-1
< n.
\end{equation*}

Por ejemplo para el ejemplo anterior donde el intervalo
inicial era $[\maximain{a0},\maximain{b0}]$, si se quiere
una tolerancia del error de $0.1$ entonces

%ei tol:.1$
%ei log((b0-a0)/tol)/log(2)-1,numer;
%do
Realmente necesitamos un número entero mayor o igual que
el número anterior, esto se consigue con la función
\maximain{ceiling}.

%ei ceiling(log((b0-a0)/tol)/log(2)-1);
%do

Así que se puede crear una función que a partir del
intervalo inicial y una tolerancia, calcule el número
de iteraciones necesarias para el método de la bisección.

%ei numiter(a0,b0,tol):=ceiling(log((b0-a0)/tol)/log(2)-1)$

Así bastará realizar lo siguiente

%ei numiter(a0,b0,.001);
%do

Para saber el número de iteraciones para una tolerancia
de $0.001$ para el ejemplo que estamos tratando.

A partir de la tolerancia ya se puede calcular el número
de iteraciones necesarias, así que ya se puede implementar
el método de la bisección con el número de iteraciones
necesarias.

A continuación aplicamos el método de bisección al ejemplo,
escribimos de nuevo todos los datos para tenerlos en una
misma celda.

%ei tol:.01$
%el a0:0$
%el b0:1$
%el f(x):=2*x-%e^(-x)$
%el n:numiter(a0,b0,tol)$
%el a:a0$ b:b0$
%el for i:1 thru n do
%el [a,b]:biseccion_siguiente(f,a,b)$
%el c:(a+b)/2;
%do

Las variables \maximain{a} y \maximain{b} se van modificando
en el bucle, y van llevando la información del intervalo que
se calcula en cada iteración.

Es importante, para que funcione el código anterior se
debe haber definido previamente las funciones
\maximain{numiter} y \maximain{biseccion\_siguiente}.

Se puede ahora calcular el error cometido con la aproximación
que da el comando \maximain{find\_root}.

%ei sol:find_root(f,a0,b0)$
%el abs(sol-c);
%do

También se puede graficar la aproximación calculada, que
está en la variable \maximain{c} y la gráfica de la función.

%ei wxplot2d([f(x),[discrete,[c],[0]]],[x,a0,b0],
%el [style,lines,points]);
%c plot2d([f(x),[discrete,[c],[0]]],[x,a0,b0],
%c [style,lines,points],[pdf_file,"./graf-bis.pdf"])$
\begin{maximat}\begin{center}
\includegraphics[width=.5\textwidth]{graf-bis.pdf}
\end{center}\end{maximat}

Ahora se aplicará el método de bisección  a la función
$f(x)=x^3-2x-\sin x$ en el intervalo $[1,2]$ con una
tolerancia de $0.1$.

Lo primero es comprobar que podemos asegurar que existe
una raíz de la función en el intervalo dado.

%ei f(x):=x^3-2*x-sin(x)$
%el is(f(1)*f(2)<0);
%do

Como existe cambio de signo en los extremos del intervalo
entonces se puede aplicar el método de bisección.

%ei tol:.1$
%el a0:1$
%el b0:2$
%el n:numiter(a0,b0,tol)$
%el a:a0$ b:b0$
%el for i:1 thru n do
%el [a,b]:biseccion_siguiente(f,a,b)$
%el c:(a+b)/2;
%do

%ei sol:find_root(f,a0,b0)$
%el abs(sol-c);
%do

%ei wxplot2d([f(x),[discrete,[c],[0]]],[x,a0,b0],
%el [style,lines,points]);
%c plot2d([f(x),[discrete,[c],[0]]],[x,a0,b0],
%c [style,lines,points],[pdf_file,"./graf-bis2.pdf"])$
\begin{maximat}\begin{center}
\includegraphics[width=.5\textwidth]{graf-bis2.pdf}
\end{center}\end{maximat}
