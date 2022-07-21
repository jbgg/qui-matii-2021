%!TeX root=main.tex

\subsection*{Método de Newton}

El método de Newton es muy parecido al método de la secante,
la diferencia está en que se usa solamente un punto inicialmente,
y se aproxima la función por la recta tangente (en lugar de la
recta secante).
Así que para aplicar este método la función debe ser derivable.

Comencemos con un ejemplo,
la función $f(x)=x^3-2x-3$ y como punto inicial $x_0 = 4$.

%ei f(x):=x^3-2*x-3$
%el x0:4$

Entonces la siguiente aproximación del método de Newton
se calcula como
\begin{equation*}
x_1 = x_0 - \frac{f(x_0)}{f'(x_0)}.
\end{equation*}

Para el ejemplo se calcularía como sigue.

%ei newton_siguiente:float(x-f(x)/diff(f(x),x));
%el x1:ev(newton_siguiente, x=x0);
%do
%ei x2:ev(newton_siguiente, x=x1);
%do

Usando el método de parada según se ha explicado anteriormente,
el método se realizaría del siguiente modo.

%ei f(x):=x^3-2*x-3$
%el x0:4$
%el tol:.1$

%ei newton_siguiente:float(x-f(x)/diff(f(x),x));
%el k:0$
%el x1:x0$
%el x0:x1+10*tol$
%el while k<100 and abs(x1-x0)>tol do
%el (x0:x1, x1:ev(newton_siguiente, x=x1),
%el k:k+1)$
%el x1;
%do
