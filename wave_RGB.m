function RGB = wave_RGB(w)
% para una longitud de onda dada (w) obtener los valores RGB

Gamma = .8;

if w < 380 || w > 750
    R = 0;
    G = 0;
    B = 0;
elseif w < 440
    R = -(w-440)/(440-380);
    G = 0;
    B = 1;
elseif w < 490
    R = 0;
    G = (w-440)/(490-440);
    B = 1;
elseif w < 510
    R = 0.0;
    G = 1.0;
    B = -(w - 510) / (510 - 490);
elseif w < 580
    R = (w - 510) / (580 - 510);
    G = 1.0;
    B = 0.0;
elseif w < 645
    R = 1.0;
    G = -(w - 645) / (645 - 580);
    B = 0.0;
elseif w < 781
    R = 1.0;
    G = 0.0;
    B = 0.0;
else
    R = 0.0;
    G = 0.0;
    B = 0.0;
end

if w < 420
    factor = 0.3 + 0.7*(w - 380) / (420 - 380);
elseif w<701
    factor = 1.0;
elseif w < 781
    factor = 0.3 + 0.7*(780 - w) / (780 - 700);
else
    factor = 0.0;
end

RGB(1) = R * factor ^ Gamma;
RGB(2) = G * factor ^ Gamma;
RGB(3) = B * factor ^ Gamma;



end