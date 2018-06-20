function archivoswyb(w, b, vtf)
    for i=1: length(w)
        switch vtf(i)
            case 1
                archivow=fopen('capaw1.txt');
                escribir_archivo(archivow, w);
                fclose(archivow);
                archivob=fopen('capab1.txt');
                escribir_archivo(archivob, b);
                fclose(archivob);
            case 2
                archivow=fopen('capaw2.txt');
                escribir_archivo(archivow, w);
                fclose(archivow);
                archivob=fopen('capab2.txt');
                escribir_archivo(archivob, b);
                fclose(archivob);
            case 3
                archivow=fopen('capaw3.txt');
                escribir_archivo(archivow, w);
                fclose(archivow);
                archivob=fopen('capab3.txt');
                escribir_archivo(archivob, b);
                fclose(archivob);
        end
    end
   % hold on;
    %plot(w);
    %plot(b);
    %hold off;
end

function escribir_archivo(fileID, worb)
    for i=1: length(worb)
        datos=cell2mat(worb(i));
        fprintf(fileID, '%f ', datos);
    end
    fprintf(fileID, '\n');
end