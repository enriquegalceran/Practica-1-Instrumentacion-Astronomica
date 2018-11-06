function dz = diffref(l,z,p,t,f,n0)
% calculo de la desviación
%
% l longitud de onda en nm
% z desviación de la vertical en grados
% p presión en mmHg
% t temperatura en C
% f fracción ode presión de agua en mmHg
% n0 indice de refracción de l= 500nm, que usaremos como base.
%    se calcula primero en main y se importa aquí.
%
% resultado en segundos

% pasamos de grados a radianes
zx = z*pi/180;

% obtenemos la diferencia relativa
nx = indiceref(l,p,t,f);
dz = 206265 * (nx - n0) * tan(zx);

end