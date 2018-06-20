function [historico_w,historico_b] = actualizar_historico(historico_w,historico_b,w,b)

    if isempty(historico_w)
        for cont=1:length(w)
            historico_w{cont}=[];
            historico_b{cont}=[];
        end
    end

    for cont=1:length(historico_w)
        historico_w{cont} = [historico_w{cont}; w{cont}(:)'];
        historico_b{cont} = [historico_b{cont}; b{cont}(:)'];
    end
end

