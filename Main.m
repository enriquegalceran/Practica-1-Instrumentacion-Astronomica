%% Definimos parámetros
% Tomados los datos del enunciado de H =30% = 2.7hPa, P = 775 hPa y T = 10C
t = 10;
p = 581.297;
f = 2.025;


% Longitud de onda de refencia
l0 = 500;
[n0, m0] = indiceref(l0, p, t, f);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Opción (3 colores)
% Estos valores son los pedidos
Z = [5	10 15 20 25 30 35 40 45 50 55 60 65 70 75 80];
L = [350, 500, 920];

% Estos valores son para dibujar el arcoirs
% resx = 900;
% Z = linspace(0,80,resx);
% resy = 600;
% L = linspace(380,750,resy);


%% Calculamos los índices de refracción
L = L';
N = zeros(size(L));
M = zeros(size(L));
for i = 1:3
    [n_temp, m_temp] = indiceref(L(i), p, t, f);
    N(i) = n_temp;
    M(i) = m_temp;
end

% Calculamos la dispersión con respecto a la longitud de referencia
difr = zeros(length(L), length(Z));
for i = 1:length(L)
    for j = 1:length(Z)
        difr(i,j) = diffref(L(i),Z(j),p,t,f,n0);
    end
end

%% Calculamos el Seeing

tabla_seeing = zeros(length(L), length(Z));
for i = 1:length(L)
    for j = 1:length(Z)
        tabla_seeing(i,j) = seeing(L(i),Z(j));
    end
end



%% Ahora que lo tenemos calculado, sólo falta dibujarlo
% Tenemos un Booleano para ver si dibujamos el Seeing. Nos interesa ser
%capaces de distinguir porque ralentiza mucho el cómputo.

Incluimos_seeing = 1;
Incluimos_leyenda = 1;
max_escala = max(abs(difr(:)));
L2 = [440, 510, 680];

if Incluimos_seeing == 0
    marker_size = 12;
    figure(1)
    clf
    hold on
    for k = 1:length(L)
        plot(Z,difr(k,:),'.','color',wave_RGB(L(k)),'markers',marker_size) ;
    end
    axis ([0,90,-(max_escala*1.1), max_escala*1.1])
    grid on
    xlabel('z (º)')
    ylabel('\Delta R (")')
    ylabel('Seeing (")')
    if Incluimos_leyenda == 1
        h1 = plot(Z(end),difr(1,end),'.','color',[0 0 1],'markers',marker_size) ;
        h2 = plot(Z(end),difr(2,end),'.','color',[0 1 0],'markers',marker_size) ;
        h3 = plot(Z(end),difr(3,end),'.','color',[1 0 0],'markers',marker_size) ;
        legend([h1 h2 h3],'320nm','500nm', '920nm')
    end
else
    figure(1)
    clf
    hold on
    for k = 1:length(L)
        for j = 1:length(Z)
            plot(Z(j),difr(k,j),'.','color',wave_RGB(L2(k)),'markers',tabla_seeing(k,j)*14.25*2)
        end
    end
    axis ([0,90,-(max_escala*1.1), max_escala*1.1])
    grid on
    xlabel('z (º)')
    ylabel('\Delta R (")')
    if Incluimos_leyenda == 1
        marker_size = min(tabla_seeing(:,end))*14.25;
        h1 = plot(Z(end),difr(1,end),'.','color',[0 0 1],'markers',marker_size) ;
        h2 = plot(Z(end),difr(2,end),'.','color',[0 1 0],'markers',marker_size) ;
        h3 = plot(Z(end),difr(3,end),'.','color',[1 0 0],'markers',marker_size) ;
        legend([h1 h2 h3],'320nm','500nm', '920nm')
    end

end

% Tamaño de la fibra óptica
F_O = 1;
if F_O==1
    Fibra = zeros(size(Z));
    h4 = plot(Z,Fibra, 'ok', 'markers', 6.19*2);
    legend([h1 h2 h3 h4],'320nm','500nm', '920nm', 'tamaño Fibra óptica')
elseif F_O == 2
    Fibra = ones(size(Z))*1.8;
    h4 = plot(Z,Fibra, '.k');
    legend([h1 h2 h3 h4],'320nm','500nm', '920nm', 'tamaño Fibra óptica')
end



