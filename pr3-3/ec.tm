%!TeX root=main.tex

\section{Aproximación numérica}

En esta práctica se buscará aproximar la solución
de un problema de valores iniciales.
Para ello se mostrarán diferentes métodos numéricos,
en los que se aproximará el valor de la función
solución.
Además esta aproximación no se va a obtener en el
intervalo completo, sino que se va a obtener en
un determinado de puntos dentro del intervalo donde
se busca la solución.

Consideramos un problema de valores iniciales
\begin{equation*}
\left\{
\begin{aligned}
y' &= f(x,y),\quad x\in[a,b] \\
y(a) &= y_0 \\
\end{aligned}
\right.
\end{equation*}

% partición del intervalo.
Como se ha comentado anteriormente, el intervalo $[a,b]$
se va a dividir en subintervalos, y así la aproximación se
obtendrá en los extremos del cada subintervalo.
Si el intervalo $[a,b]$ se divide $N$ subintervalos
entonces cada subintervalo tendrá longitud
\begin{equation*}
h = \frac{b-a}{N}.
\end{equation*}
Los puntos que dividen cada subintervalo serán
\begin{equation*}
\begin{aligned}
x_0 & = a \\
x_1 & = a+h \\
x_2 & = a+2h \\
& \vdots \\
x_{N} & = a+Nh = b \\
\end{aligned}
\end{equation*}
Hay $N+1$ nodos.

En cada nodo $x_i$ la solución se va a aproximar por un valor
$y_i$, esto es
\begin{equation*}
y(x_i) \approx y_i
\end{equation*}

\subsection*{Método de Euler}

El método más sencillo para aproximar la solución
es el método de Euler,
se basa en aproximar la derivada por la siguiente
expresión
\begin{equation*}
y'(x) = \lim_{h\to0} \frac{y(x+h)-y(x)}{h}
\approx \frac{y(x+h)-y(x)}{h}
\end{equation*}
De lo anterior, como se debe verificar que
$y'(x) = f(x,y)$ entonces
\begin{equation*}
f(x,y) \approx \frac{y(x+h)-y(x)}{h},
\end{equation*}
por tanto
\begin{equation*}
y(x+h) \approx y(x) + h f(x,y).
\end{equation*}
Aplicando la aproximación anterior en cada nodo
$x_i$ se obtiene el método de Euler,
así que se obtiene que
\begin{equation*}
y_{i+1} = y_{i} + h f(x_i,y_i)
\end{equation*}
de la expresión anterior se deduce las aproximaciones
de la solución en cada nodo.

Consideremos como ejemplo el problema de valores iniciales
\begin{equation*}
\left\{
\begin{aligned}
y' & = \frac{y}{2x}, \quad x\in[1,2] \\
y(1) & = 2 \\
\end{aligned}
\right.
\end{equation*}
En este caso tomaremos $N=10$.

Definimos los datos necesarios para la resolución
numérica.

%ei f(x,y):=y/(2*x)$
%el a:1$
%el b:2$
%el y0:2$
%el N:10$
%el h:(b-a)/N;
%do

Ahora hay que crear una lista con todos los puntos
$x_i$ y todos los puntos $y_i$.

%ei xx:[float(a)]$
%el yy:[float(y0)]$
%el i:1$
%el while i<=N do(
%el xn:float(xx[i]+h),
%el yn:float(yy[i] + h*f(xx[i],yy[i])),
%el xx:append(xx, [ xn ]), yy:append(yy, [ yn ]),
%el i:i+1
%el )$

%ei xx;
%do
%ei yy;
%do

Para crear la gráfica de la aproximación habrá que
crear la lista de puntos.

%ei puntos:create_list([xx[i],yy[i]],i,1,N+1);
%do

%ei wxplot2d([discrete,puntos],[style,points])$
%c plot2d([discrete,puntos],[style,points], [pdf_file,"./plot1.pdf"])$
\begin{maximat}
\begin{center}
\includegraphics[width=.5\textwidth]{plot1.pdf}
\end{center}
\end{maximat}

Aunque será más interesante añadir a la gráfica la solución exacta.

%ei sol1:ode2('diff(y,x)=f(x,y),y,x)$
%el sol2:ic1(sol1,x=a,y=y0);
%el sol:ev(y,sol2);
%do

%ei wxplot2d([[discrete,puntos],sol],[x,a,b],[style,points,lines])$
%c plot2d([[discrete,puntos],sol],[x,a,b],[style,points,lines], [pdf_file,"./plot2.pdf"])$
\begin{maximat}
\begin{center}
\includegraphics[width=.5\textwidth]{plot2.pdf}
\end{center}
\end{maximat}

\subsection*{Runge-Kutta de segundo orden}

En el caso del método de Runge-Kutta de segundo orden,
las aproximaciones se calculan con la expresión
\begin{equation*}
\begin{aligned}
k_1 &= f(x_i,y_i) \\
k_2 &= f(x_{i+1}, y_i + h k_1) \\
y_{i+1} &= y_i + \frac{h}{2}\left(k_1+k_2\right) \\
\end{aligned}
\end{equation*}

En este caso se va a resolver de ejemplo el siguiente
problema de valores iniciales con $N=8$.
\begin{equation*}
\left\{
\begin{aligned}
y' &= \frac{y}{x} + x^2 e^{-x/25}, \quad x\in[1,3] \\
y(1) &=1 \\
\end{aligned}
\right.
\end{equation*}

Del mismo modo que antes, definimos los datos del problema.

%ei f(x,y):=y/x+x^2*%e^(-x/25)$
%el a:1$
%el b:3$
%el y0:1$
%el N:8$
%el h:(b-a)/N;
%do

%ei xx:[float(a)]$
%el yy:[float(y0)]$
%el i:1$
%el while i<=N do(
%el xn:float(xx[i]+h),
%el k1:float(f(xx[i],yy[i])),
%el k2:float(f(xn,yy[i] + h*k1)),
%el yn:float(yy[i] + h*(k1+k2)/2),
%el xx:append(xx, [ xn ]), yy:append(yy, [ yn ]),
%el i:i+1
%el )$

%ei xx;
%do
%ei yy;
%do

%ei puntos:create_list([xx[i],yy[i]],i,1,N+1);
%do

%ei wxplot2d([discrete,puntos],[style,points])$
%c plot2d([discrete,puntos],[style,points], [pdf_file,"./plot3.pdf"])$
\begin{maximat}
\begin{center}
\includegraphics[width=.5\textwidth]{plot3.pdf}
\end{center}
\end{maximat}

\subsection*{Runge-Kutta de cuarto orden}

En el caso del método de Runge-Kutta de cuarto orden,
las aproximaciones se calculan con la expresión
\begin{equation*}
\begin{aligned}
k_1 &= f(x_i,y_i) \\
k_2 &= f\left(x_{i} + \frac{h}{2}, y_{i} + \frac{h}{2} k_1\right) \\
k_3 &= f\left(x_{i} + \frac{h}{2}, y_{i} + \frac{h}{2} k_2\right) \\
k_4 &= f(x_{i+1},y_i + h k_3) \\
y_{i+1} &= y_i + \frac{h}{6}\left(k_1+2 k_2 + 2 k_3 + k_4\right) \\
\end{aligned}
\end{equation*}

En este caso se va a resolver de ejemplo el siguiente
problema de valores iniciales con $N=20$.
\begin{equation*}
\left\{
\begin{aligned}
y' &= y e^{-x}, \quad x\in[1,3] \\
y(1) &=1 \\
\end{aligned}
\right.
\end{equation*}

Del mismo modo que antes, definimos los datos del problema.

%ei f(x,y):=y*%e^(-x)$
%el a:1$
%el b:3$
%el y0:1$
%el N:20$
%el h:(b-a)/N;
%do

Y a continuación realizamos los cálculos de este método en
cada paso.

%ei xx:[float(a)]$
%el yy:[float(y0)]$
%el i:1$
%el while i<=N do(
%el xn:float(xx[i]+h),
%el k1:float(f(xx[i],yy[i])),
%el k2:float(f(xx[i]+h/2,yy[i] + h/2*k1)),
%el k3:float(f(xx[i]+h/2,yy[i] + h/2*k2)),
%el k4:float(f(xn,yy[i]+h*k3)),
%el yn:float(yy[i] + h*(k1+2*k2+2*k3+k4)/6),
%el xx:append(xx, [ xn ]), yy:append(yy, [ yn ]),
%el i:i+1
%el )$

%ei xx;
%do
%ei yy;
%do

%ei puntos:create_list([xx[i],yy[i]],i,1,N+1);
%do

%ei wxplot2d([discrete,puntos],[style,points])$
%c plot2d([discrete,puntos],[style,points], [pdf_file,"./plot4.pdf"])$
\begin{maximat}
\begin{center}
\includegraphics[width=.5\textwidth]{plot4.pdf}
\end{center}
\end{maximat}
