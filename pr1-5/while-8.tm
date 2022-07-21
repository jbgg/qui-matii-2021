%ei ll:[[3],[5,-2,7],[-1,-1],[-2,3,7,10,9],[-5,3,2],[8,8,8]];
%do
%ei encontrado:false$
%el suma:0$
%el i:1;
%el while i<=length(ll) and not encontrado do
%el (suma:0,for v in ll[i] do suma:suma+v,
%el if suma=0 then encontrado:true,
%el i:i+1)$
%el if encontrado then print("Hay una lista que su suma es 0")
%el else print("Ninguna lista suma 0")$
%do
