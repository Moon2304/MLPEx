function graficarwyb(w, b, vtf)
    for i=1: length(w)
        switch vtf(i)
            case 1
                graficar2(w);
                graficar2(b);
            case 2
                graficar2(w);
                graficar2(b);
            case 3
                graficar2(w);
                graficar2(b);
        end
    end
end

function graficar2(datos)
    for i=1: length(datos)
        n=cell2mat(datos(i));
        hold on
        plot(n);
        hold off
    end
    
end