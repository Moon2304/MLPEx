function [P,T]=obtenerDataset(archivo_dataset, archivo_targets)
    
    fileID = fopen(archivo_dataset);
    Lec_archivo=textscan(fileID, '%f');
    fclose(fileID);
    P = cell2mat(Lec_archivo)'; %Convertimos el cell array a una char matriz
    
    fileID = fopen(archivo_targets);
    Lec_archivo=textscan(fileID, '%f');
    fclose(fileID);
    T = cell2mat(Lec_archivo)'; %Convertimos el cell array a una char matriz
end
