%!TeX root=main.tex

\subsection*{Comando \maximain{integrate}}

Para calcular integrales definidas con maxima,
se usa el comando
\begin{center}
\maximain{integrate(f(x),x,a,b)}
\end{center}
siendo \maximain{f(x)} la expresión a integrar
respecto la variable \maximain{x} en el intervalo
$[\maximain{a},\maximain{b}]$.

Por ejemplo para calcular la integral
\begin{equation*}
\int_{0}^{5} x^{2}e^{x}\,\mathrm{d}x
\end{equation*}
se haría lo siguiente.

%ei f(x):=x^2*%e^x$
%el a:0$
%el b:5$
%el valorintegral:float(integrate(f(x),x,a,b));
%do
