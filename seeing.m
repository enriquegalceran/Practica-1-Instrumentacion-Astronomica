function alf = seeing(l,z)
% calculo del seeing utilizando la longitud de coherencia


% Primero calculamos la longitud de coherencia (en cm)
r0 = 15*(l/550)^(1.2)*cos(z*pi/180)^(0.6);

% Calculamos el Seeing
alf = 1.2*206265*l/(r0*1e7);

end