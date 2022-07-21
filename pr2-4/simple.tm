%!TeX root=main.tex

\subsection*{Fórmula del punto medio}

La fórmula del método del punto medio para integración
para aproximar la integral de una función $f(x)$ en un
intervalo $[a,b]$ es
\begin{equation*}
\int_{a}^{b} f(x)\,\mathrm{d}x\approx
(b-a)f\left(\frac{a+b}{2}\right).
\end{equation*}

Para el ejemplo anterior en maxima se podría calcular
como se muestra a continuación.

%% datos del ejemplo anterior
%c f(x):=x^2*%e^x$
%c a:0$ b:5$

%ei float((b-a)*f((a+b)/2));
%do

\subsection*{Fórmula del trapecio}

La fórmula del trapecio es la siguiente.
\begin{equation*}
\int_{a}^{b} f(x)\,\mathrm{d}x\approx
(b-a)\frac{f(a)+f(b)}{2}.
\end{equation*}

En maxima se calculará por la siguiente expresión.

%ei float((b-a)/2*(f(a)+f(b)))$
%do

\subsection*{Fórmula de Simpson}

La fórmula de Simpson es la siguiente.
\begin{equation*}
\int_{a}^{b} f(x)\,\mathrm{d}x\approx
\frac{b-a}{6}\left(f(a)+4f\left(\frac{a+b}{2}\right)+f(b)\right).
\end{equation*}

En maxima se calculará por la siguiente expresión.

%ei float((b-a)/6*(f(a)+4*f((a+b)/2)+f(b)))$
%do

\subsection*{Cota del error para la fórmula del punto medio}

La cota del error para la fórmula del punto medio es
\begin{equation*}
\left|E_{PM}(f,a,b)\right|\leq \frac{(b-a)^3}{24}\max_{x\in[a,b]}\left|f''(x)\right|.
\end{equation*}

Vamos a calcularla para el ejemplo que estábamos considerando.

Primero calculamos la segunda derivada y graficamos la función
$\left|f''(x)\right|$.
%ei df2:diff(f(x),x,2)$
%el wxplot2d(abs(df2),[x,a,b]);
%c plot2d(abs(df2),[x,a,b],[pdf_file,"./df2.pdf"]);
\begin{maximat}
\begin{center}
\includegraphics[width=.5\textwidth]{df2.pdf}
\end{center}
\end{maximat}

Como se ve en la gráfica la función $\left|f''(x)\right|$ es creciente,
y por tanto el máximo será el valor en el extremo derecho.
En la variables \maximain{M2} guardamos su valor.

%ei M2:float(ev(abs(df2),x=b));
%do

Y así se puede calcular la cota del error cometido usando
la fórmula del punto medio.

%ei float((b-a)^3/24*M2);
%do

\subsection*{Cota del error para la fórmula del trapecio}

La cota del error para la fórmula del trapecio es
\begin{equation*}
\left|E_{T}(f,a,b)\right|\leq \frac{(b-a)^3}{12}\max_{x\in[a,b]}\left|f''(x)\right|.
\end{equation*}

Como ya está calculado $\max_{x\in[a,b]}\left|f''(x)\right|$ en la
variable \maximain{M2}, entonces se puede calcular directamente
para el ejemplo anterior.
Así que la cota del error para la fórmula del trapecio es la
siguiente.

%ei float((b-a)^3/12*M2);
%do

\subsection*{Cota del error para la fórmula de Simpson}

La cota del error para la fórmula de Simpson es
\begin{equation*}
\left|E_{S}(f,a,b)\right|\leq \frac{(b-a)^5}{2880}\max_{x\in[a,b]}\left|f^{(4)}(x)\right|.
\end{equation*}

Vamos a calcularla para el ejemplo que estábamos considerando.

Primero calculamos la segunda derivada y graficamos la función
$\left|f^{(4)}(x)\right|$.
%ei df4:diff(f(x),x,4)$
%el wxplot2d(abs(df4),[x,a,b]);
%c plot2d(abs(df4),[x,a,b],[pdf_file,"./df4.pdf"]);
\begin{maximat}
\begin{center}
\includegraphics[width=.5\textwidth]{df4.pdf}
\end{center}
\end{maximat}

Como se ve en la gráfica la función $\left|f^{(4)}(x)\right|$ es creciente,
y por tanto el máximo será el valor en el extremo derecho.
En la variables \maximain{M4} guardamos su valor.

%ei M4:float(ev(abs(df4),x=b));
%do

Y así se puede calcular la cota del error cometido usando
la fórmula del punto medio.

%ei float((b-a)^5/2880*M4);
%do
