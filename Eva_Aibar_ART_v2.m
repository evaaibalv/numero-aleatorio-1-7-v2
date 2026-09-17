% Eva Aibar Álvarez
% 
% Tarea: Encontrar un número aleatorio entre 1 y 7 utilizando únicamente
% una función que genera números aleatorios entre 1 y 5.

% Antes de continuar, expongo algunas de las consideraciones que he tenido
% en cuenta a la hora de resolver la tarea:
%   1. Todas las distribuciones son uniformes, es decir:
%       a) Cada número debe generarse con equiprobabilidad.
%       b) Dentro del rango los números son enteros, lo que nos impide utilizar una
%          transformación lineal.
%   2. Se puede realizar más de una tirada. En este código lo implementaré
%   con un bucle.

% SOLUCIÓN:

% 1. En principio utilizamos dos tiradas para generar 25 combinaciones.
% 2. Repartimos las primeras 21 posiciones en 7 grupos de 3 elementos.
% 3. Si sale una posición mayor que 21 (22, 23, 24 o 25), el bucle genera 
%    más tiradas hasta obtener un valor válido.
% 4. Dividimos la posición entre 3 y redondeamos hacia arriba 
%    para asignar el número final del 1 al 7 con equiprobabilidad.

N = 15000;
resultados = zeros(1,N);

for i = 1:N

    tirada1 = randi(5);
    tirada2 = randi(5);
    posicion = (tirada1 - 1) * 5 + tirada2;
    
    while posicion>21
        tirada1 = randi(5);
        tirada2 = randi(5);
        posicion = (tirada1 - 1) * 5 + tirada2;
    end
    
    numero_final = ceil(posicion / 3);
    resultados(i) = numero_final;
end

fprintf('La celda seleccionada es la número %d y corresponde al número %d\n', posicion, numero_final);

%Histograma
histogram(resultados)
xlabel('Número final')
ylabel('Frecuencia')
title('Histograma de 15000 simulaciones')