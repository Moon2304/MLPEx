function dataset=obtenerDataset
    [Prot1, a1] = uigetfile('*.txt', 'Seleccione un archivo'); %abrimos ventana para seleccionar archivo
    if isequal(Prot1, 0)
        return
    else
        archivo=fullfile(a1, Prot1); % variable archivo contiene el nombre de la direccion
    end
    fileID = fopen(archivo);
    Lec_archivo=textscan(fileID, '%f');
    fclose(fileID);
    dataset = cell2mat(Lec_archivo); %Convertimos el cell array a una char matriz
end
