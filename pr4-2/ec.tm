%!TeX root=main.tex

\section*{Sistema fundamental de una ecuación diferencial lineal}

Veamos diferentes ejemplos de cómo calcular un sistema fundamental de
soluciones en ecuaciones lineales de orden superior.

\def\rpar{)}

\textbf{Ejemplo.}
Consideremos la ecuación diferencial
\begin{equation*}
%c p:ratsimp(expand((L-3)^3*(L+1)^2))$
y^{5)} -7y^{4)}+10y'''+18y'' -27y' -27y
=0.
\end{equation*}
Calculamos las raíces de la ecuación característica.
%ei p:L^5-7*L^4+10*L^3+18*L^2-27*L-27$
%ei solve(p=0,L);
%do

Pero es necesario conocer también las multiplicidades de las raíces,
para ello usamos \maximain{factor}.

%ei factor(p);
%do

Por tanto un sistema fundamental de soluciones para la ecuación
homogénea anterior es
\begin{equation*}
e^{3x}, xe^{3x}, x^2e^{3x}, e^{-x}, xe^{-x}.
\end{equation*}

Comprobamos que las funciones anteriores son solución de la ecuación
diferencial.

%ei depends(y,x)$
%el ec:diff(y,x,5)-7*diff(y,x,4)+10*diff(y,x,3)
%el +18*diff(y,x,2)-27*diff(y,x)-27*y=0;
%do

%ei yy:[%e^(3*x),x*%e^(3*x),x^2*%e^(3*x),%e^(-x),x*%e^(-x)]$

%ei create_list(is(ratsimp(ev(ec,y=yy[i],diff))),i,1,length(yy));
%do

Para comprobar que el sistema anterior es linealmente independiente
usamos el Wronskiano.

%ei load(functs)$

%ei w:determinant(wronskian(yy,x));
%do

Basca ver que el Wronskiano es no nulo en algún punto.

%ei is(ratsimp(ev(w,x=0))#0);
%do

\textbf{Ejemplo.}
Consideremos una nueva ecuación diferencial
\begin{equation*}
%c p:ratsimp(expand((L^2-2*1*L+3)^2*(L+1)^2))$
y^{6)}-2y^{5)} +3y^{4)} +4y''' -5y'' +6' +9y
=0.
\end{equation*}
Calculamos las raíces de la ecuación característica.
%ei p:L^6-2*L^5+3*L^4+4*L^3-5*L^2+6*L+9$
%ei solve(p=0,L);
%do

Pero es necesario conocer también las multiplicidades de las raíces,
para ello usamos \maximain{factor}.

%ei factor(p);
%do

Por tanto un sistema fundamental de soluciones para la ecuación
homogénea anterior es
\begin{equation*}
e^{-x}, xe^{-x}, e^{x}\cos(\sqrt{2}x), e^{x}\sin(\sqrt{2}x),
xe^{x}\cos(\sqrt{2}x), xe^{x}\sin(\sqrt{2}x).
\end{equation*}

Comprobamos que las funciones anteriores son solución de la ecuación
diferencial.

%ei depends(y,x)$
%el ec:diff(y,x,6)-2*diff(y,x,5)+3*diff(y,x,4)+4*diff(y,x,3)
%el -5*diff(y,x,2)+6*diff(y,x)+9*y=0;
%do

%ei yy:[%e^(-x),x*%e^(-x),
%el %e^x*cos(sqrt(2)*x),%e^x*sin(sqrt(2)*x),
%el x*%e^x*cos(sqrt(2)*x),x*%e^x*sin(sqrt(2)*x)]$

%ei create_list(is(ratsimp(ev(ec,y=yy[i],diff))),i,1,length(yy));
%do

Para comprobar que el sistema anterior es linealmente independiente
usamos el Wronskiano.

%ei load(functs)$
%el w:determinant(wronskian(yy,x))$
%el is(ratsimp(ev(w,x=0))#0);
%do

\section*{Resolviendo problemas de valores iniciales}

Veamos algunos ejemplos resolviendo problemas de valores iniciales
para ecuaciones lineales homogéneas.

\textbf{Ejemplo.}
Consideremos el siguiente problema de valores iniciales.
\begin{equation*}
\left.
\begin{aligned}
y'''-y''-8y'+12y &= 0 \\
y(0) &= 2 \\
y'(0) &= -1 \\
y''(0) &= 0 \\
\end{aligned}
\right\}
\end{equation*}


Primero se calcula un sistema fundamental de la ecuación.
%ei p:L^3-L^2-8*L+12$
%el factor(p);
%do

Por tanto un sistema fundamental de soluciones es
$
e^{2x},xe^{2x},e^{-3x}
$.
Y la solución general será
\begin{equation*}
c_1 e^{2x} + c_2 xe^{2x} + c_3 e^{-3x}.
\end{equation*}
Definimos la solución general

%ei solgen:c1*%e^(2*x) + c2*x*%e^(2*x) + c3*%e^(-3*x)$

Y se calculan los coeficientes para que cumplan las condiciones iniciales.

%ei dsolgen:diff(solgen,x)$
%el ddsolgen:diff(solgen,x,2)$

%ei solcoef:solve(
%el [ev(solgen,x=0)=2,ev(dsolgen,x=0)=-1,ev(ddsolgen,x=0)=0],
%el [c1,c2,c3]);
%do

Para calcular la solución se sustituyen los coeficientes calculados
en la solución general.

%ei sol:ev(solgen,solcoef);
%do

A continuación comprobamos que se verifican las condiciiones iniciales.

%ei ev(sol,x=0);
%do

%ei dsol:diff(sol,x)$
%el ev(dsol,x=0);
%do

%ei ddsol:diff(sol,x,2)$
%el ev(ddsol,x=0);
%do
