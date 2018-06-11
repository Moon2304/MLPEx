function dataset=obtieneDataset
    [Prot1, a1] = uigetfile('*.txt', 'Seleccione un archivo'); %abrimos ventana para seleccionar archivo
    if isequal(Prot1, 0)
        return
    else
        archivo=fullfile(a1, Prot1); % variable archivo contiene el nombre de la direccion
    end
    Lec_archivo = textread(archivo, '%s', 'delimiter', '\n','whitespace', ''); %Leeemos el contenido del archivo y se guarda como un cell array
    A = cell2mat(Lec_archivo); %Convertimos el cell array a una char matriz
    dataset = str2double(A); %Convertimos la char matrix a una double matrix, matriz p
end
