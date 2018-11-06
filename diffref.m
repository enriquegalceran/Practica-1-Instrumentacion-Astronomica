function dz = diffref(l,z,p,t,f,n0)
% calculo de la desviaci�n
%
% l longitud de onda en nm
% z desviaci�n de la vertical en grados
% p presi�n en mmHg
% t temperatura en C
% f fracci�n ode presi�n de agua en mmHg
% n0 indice de refracci�n de l= 500nm, que usaremos como base.
%    se calcula primero en main y se importa aqu�.
%
% resultado en segundos

% pasamos de grados a radianes
zx = z*pi/180;

% obtenemos la diferencia relativa
nx = indiceref(l,p,t,f);
dz = 206265 * (nx - n0) * tan(zx);

end