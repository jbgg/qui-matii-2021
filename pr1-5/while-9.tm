%ei buscasuma0(ll):=block([encontrado:false,suma:0,i:1],
%el while i<=length(ll) and not encontrado do
%el (suma:0,for v in ll[i] do suma:suma+v,
%el if suma=0 then encontrado:true,
%el i:i+1),
%el encontrado)$
%ei ll1:[[3],[5,-2,7],[-1,-1],[-2,3,7,10,9],[-5,3,2],[8,8,8]];
%el buscasuma0(ll1);
%do
%ei ll2:[[3],[5,-2,7],[-1,-1],[-2,3,7,10,9],[8,8,8]];
%el buscasuma0(ll2);
%do
