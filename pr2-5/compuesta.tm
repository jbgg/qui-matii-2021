%!TeX root=main.tex

\subsection*{Regla compuesta del punto medio}

%TODO: gráfica

Para aplicar la regla compuesta del punto medio
primero se dividirá el intervalo $[a,b]$ en
un número $n$ de subintervalos.
El primer intervalo es
\begin{equation*}
[a_1,b_1]=[a,a+h]
\end{equation*}
donde $h=\frac{b-a}{n}$,
el segundo intervalo es
\begin{equation*}
[a_2,b_2]=[a+h,a+2h],
\end{equation*}
y así hasta el último
\begin{equation*}
[a_n,b_n]=[a+(n-1)h,a+nh]=[a+(n-1)h,b].
\end{equation*}

La aproximación de una integral por la
regla compuesta del punto medio se calcula
aplicando la regla del punto medio en cada uno
de los subintervalos anteriores, y así queda
\begin{equation*}
\begin{aligned}
\int_{a}^{b} f(x)\,\mathrm{d}x
&=
\int_{a_1}^{b_1} f(x)\,\mathrm{d}x
+\cdots+
\int_{a_n}^{b_n} f(x)\,\mathrm{d}x
\\
&\approx
(b_1-a_1)f\left( \frac{a_1+b_1}{2} \right)
+\cdots+
(b_{n-1}-a_{n-1})f\left( \frac{a_{n-1}+b_{n-1}}{2} \right)
\\
&=
h
\left(
f(x_1)
+\cdots+
f(x_n)
\right)
\\
\end{aligned}
\end{equation*}
siendo los $x_1,\ldots,x_n$ los puntos medios
de los intervalos $[a_1,b_1],\ldots,[a_n,b_n]$,
por tanto sus expresiones son
\begin{equation*}
x_i = a_i + \frac{h}{2}
= a+(i-1)h + \frac{h}{2}
= a+\frac{2i-1}{2}h
= a+(2i-1)\bar{h},
\end{equation*}
siendo $\bar{h}=\frac{h}{2}$.

Definimos los datos del ejemplo
%ei f(x):=x^2*%e^x$
%el a:0$ b:5$

Y tomaremos 10 subintervalos.
%ei n:10$

Definimos $\bar{h}$ como
%ei hh:float((b-a)/(2*n))$

Creamos la lista de puntos $x_i$.

%ei xx:create_list(a+(2*i-1)*hh,i,1,n);
%do

%ei ff:float(f(xx));
%do

El cálculo de la aproximación será
%ei 2*hh*lsum(v,v,ff);
%do

\subsection*{Regla compuesta del trapecio}

%TODO: gráfica

Para aplicar la regla compuesta del trapecio
primero se dividirá el intervalo $[a,b]$ en
un número $n$ de subintervalos.
El primer intervalo es
\begin{equation*}
[a_1,b_1]=[a,a+h]
\end{equation*}
donde $h=\frac{b-a}{n}$,
el segundo intervalo es
\begin{equation*}
[a_2,b_2]=[a+h,a+2h],
\end{equation*}
y así hasta el último
\begin{equation*}
[a_n,b_n]=[a+(n-1)h,a+nh]=[a+(n-1)h,b].
\end{equation*}

La aproximación de una integral por la
regla compuesta del trapecio se calcula
aplicando la regla del trapecio en cada uno
de los subintervalos anteriores, y así queda
\begin{equation*}
\begin{aligned}
\int_{a}^{b} f(x)\,\mathrm{d}x
&=
\int_{a_1}^{b_1} f(x)\,\mathrm{d}x
+\cdots+
\int_{a_n}^{b_n} f(x)\,\mathrm{d}x
\\
&\approx
\frac{b_1-a_1}{2}\left( f(a_1) + f(b_1) \right)
+\cdots+
\frac{b_{n-1}-a_{n-1}}{2}\left( f(a_n) + f(b_n) \right)
\\
&=
\frac{h}{2}
\left(
f(a_1)
+2f(b_1)
+\cdots
+2f(b_{n-1})+
f(b_n)
\right)
\\
\end{aligned}
\end{equation*}
siendo $b_i = a+i h$, $a_1=a$ y $b_n=b$.

Definimos los datos del ejemplo
%ei f(x):=x^2*%e^x$
%el a:0$ b:5$

Y tomaremos 10 subintervalos.
%ei n:10$

Definimos $h$ como
%ei h:float((b-a)/n)$
%ei hh:float((b-a)/(2*n))$

Creamos la lista de puntos $x_i$.

%ei xx:create_list(a+i*h,i,1,n-1);
%do

%ei ff:float(f(xx));
%do

El cálculo de la aproximación será
%ei h*(.5*float(f(a))+lsum(v,v,ff)+.5*float(f(b)));
%do

\subsection*{Regla compuesta de Simpson}

%TODO: gráfica

Para aplicar la regla compuesta de Simpson
primero se dividirá el intervalo $[a,b]$ en
un número $n$ de subintervalos.
El primer intervalo es
\begin{equation*}
[a_1,b_1]=[a,a+h]
\end{equation*}
donde $h=\frac{b-a}{n}$,
el segundo intervalo es
\begin{equation*}
[a_2,b_2]=[a+h,a+2h],
\end{equation*}
y así hasta el último
\begin{equation*}
[a_n,b_n]=[a+(n-1)h,a+nh]=[a+(n-1)h,b].
\end{equation*}

La aproximación de una integral por la
regla compuesta de Simpson se calcula
aplicando la regla de Simpson en cada uno
de los subintervalos anteriores, y así queda
\begin{equation*}
\begin{aligned}
\int_{a}^{b} f(x)\,\mathrm{d}x
&=
\int_{a_1}^{b_1} f(x)\,\mathrm{d}x
+\cdots+
\int_{a_n}^{b_n} f(x)\,\mathrm{d}x
\\
&\approx
\frac{b_1-a_1}{6}\left( f(a_1) + 4f(c_1) + f(b_1) \right)
+\cdots+
\frac{b_{n-1}-a_{n-1}}{6}\left( f(a_n) + 4f(c_n) + f(b_n) \right)
\\
&=
\frac{h}{6}
\left(
f(a_1)
+2f(b_1)
+\cdots
+2f(b_{n-1})
+4f(c_1)
+\cdots
+4f(c_n)
+f(b_n)
\right)
\\
\end{aligned}
\end{equation*}
siendo $b_i = a+i h$, $c_i = a_i+\frac{h}{2} = a+\frac{2i-1}{2}h$,
$a_1=a$ y $b_n=b$.

Definimos los datos del ejemplo
%ei f(x):=x^2*%e^x$
%el a:0$ b:5$

Y tomaremos 10 subintervalos.
%ei n:10$

Definimos $h$ como
%ei h:float((b-a)/n)$
%ei hh:float((b-a)/(2*n))$

Creamos la lista de puntos $x_i$.

%ei bb:create_list(a+i*h,i,1,n-1);
%do
%ei fb:float(f(bb));
%do

%ei cc:create_list(a+(2*i-1)*hh,i,1,n);
%do
%ei fc:float(f(cc));
%do

El cálculo de la aproximación será
%ei h/6*(float(f(a))+2*lsum(v,v,fb)+4*lsum(v,v,fc)+float(f(b)));
%do

\subsection*{Cota del error para la regla compuesta del punto medio}

La cota para el error de la regla compuesta del punto medio es
\begin{equation*}
\left|E_{PMC}(f,a,b,n)\right|
\leq
\frac{(b-a)^3}{24 n^2}\max_{x\in[a,b]}\left|f''(x)\right|.
\end{equation*}

Por tanto para cierta tolerancia se puede calcular el número
$n$ mínimo para asegurar un error menor que la tolerancia.

Consideremos una tolerancia de $0.003$.

%ei tol:.003$

Entonces, haciendo uso del valor \maximain{M2} definido en la
práctica anterior se puede calcular el valor de $n$.

%c df2:diff(f(x),x,2)$
%c M2:float(ev(abs(df2),x=b))$

%ei M2;
%do

%ei n:ceiling(sqrt( (b-a)^3/24/tol*M2 ));
%do

Y a continuación calculamos el valor de la integral con este
valor de $n$.

%ei hh:float((b-a)/(2*n))$
%el xx:create_list(a+(2*i-1)*hh,i,1,n)$
%el ff:float(f(xx))$
%ei 2*hh*lsum(v,v,ff);
%do

\subsection*{Cota del error para la regla compuesta del trapecio}

La cota para el error de la regla compuesta del trapecio medio es
\begin{equation*}
\left|E_{TC}(f,a,b,n)\right|
\leq
\frac{(b-a)^3}{12 n^2}\max_{x\in[a,b]}\left|f''(x)\right|.
\end{equation*}

Por tanto para cierta tolerancia se puede calcular el número
$n$ mínimo para asegurar un error menor que la tolerancia.

Consideremos una tolerancia de $0.003$.

%ei tol:.003$

Entonces, haciendo uso del valor \maximain{M2} definido en la
práctica anterior se puede calcular el valor de $n$.

%c df2:diff(f(x),x,2)$
%c M2:float(ev(abs(df2),x=b))$

%ei n:ceiling(sqrt( (b-a)^3/12/tol*M2 ));
%do

Y a continuación calculamos el valor de la integral con este
valor de $n$.

%ei h:float((b-a)/n)$
%el hh:float((b-a)/(2*n))$
%el xx:create_list(a+i*h,i,1,n-1)$
%ei ff:float(f(xx))$
%ei h*(.5*float(f(a))+lsum(v,v,ff)+.5*float(f(b)));
%do

\subsection*{Cota del error para la regla compuesta de Simpson}

La cota para el error de la regla compuesta de Simpson medio es
\begin{equation*}
\left|E_{SC}(f,a,b,n)\right|
\leq
\frac{(b-a)^5}{2880 n^4}\max_{x\in[a,b]}\left|f^{(4)}(x)\right|.
\end{equation*}

Por tanto para cierta tolerancia se puede calcular el número
$n$ mínimo para asegurar un error menor que la tolerancia.

Consideremos una tolerancia de $0.003$.

%ei tol:.003$

Entonces, haciendo uso del valor \maximain{M4} definido en la
práctica anterior se puede calcular el valor de $n$.

%c df4:diff(f(x),x,4)$
%c M4:float(ev(abs(df4),x=b))$

%ei M4;
%do

%ei n:ceiling( ((b-a)^5/2880/tol*M4)^(1/4) );
%do

Y a continuación calculamos el valor de la integral con este
valor de $n$.

%ei h:float((b-a)/n)$
%el hh:float((b-a)/(2*n))$
%el bb:create_list(a+i*h,i,1,n-1)$
%el fb:float(f(bb))$
%el cc:create_list(a+(2*i-1)*hh,i,1,n)$
%el fc:float(f(cc))$
%el h/6*(float(f(a))+2*lsum(v,v,fb)+4*lsum(v,v,fc)+float(f(b)));
%do
