function tablaSen()
%Genera una tabla con un seno de amplitud 2^16 - 2 (complemento a 2)

close all;

Maximo = 2^14 - 1;
CantSamples = 360;

t = 0 : 2*pi/CantSamples : 2*pi-2*pi/CantSamples;

Seno = sin(t) * Maximo;

figure;
plot(t, Seno,'r.-');

Seno = round(Seno);
%Seno = Seno + Maximo;
Seno = Seno; %Si no queres complemento a dos%%%% + (sign(Seno) == -1) .* 2^16; %Si queres que tenga complemento a dos

hold on;
plot(t, Seno,'b.-');


%***************************** Genero archivo *****************************

FileHandle = fopen('tablaSen.h','wt');

fprintf(FileHandle,'#include "PE_Types.h"\n');
fprintf(FileHandle,'\n');
fprintf(FileHandle,'#define DIM_TABLA %d\n', CantSamples);
fprintf(FileHandle,'\n');

fprintf(FileHandle,'__pmem const Int16 tablaSen[] = {\n');
for i = 1 : CantSamples
    fprintf(FileHandle,'%d,\n',Seno(i));
end
fprintf(FileHandle,'};\n');

fclose(FileHandle);
