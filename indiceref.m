function [n,m3] = indiceref(l,p,t,f)
% calcular indice refracci�n
% 
% l longitud de onda en nm
% p presi�n en mmHg
% t temperatura en C
% f fracci�n ode presi�n de agua en mmHg


% primero transformamos de nm a micras
lx = l/1000;

% ecuaci�n 1
% m = (n-1)*1e6
m = 64.328 + 29498.1/(146-(1/lx)^2) + 255.4/(41-(1/lx)^2);

% ecuaci�n 2
% m2 = n-1
m2 = m/1e6*(p*(1+(1.049-0.0157*t)*p*0.000001)/(720.883*(1+0.003661*t)));

% ecuaci�n 3
% m3 = (n-1)*1e6
m3 = m2*1e6-((0.0624-0.00068/lx^2)/(1+0.003661*t)*f);

n = m3/1e6+1;

end