function [a] = feedforward(w,b,functions,p)
    a = {};
    a{1} = p;
    for cont = 1:length(w)
        switch functions(cont)
            case 1
                a{cont+1}=purelin(w{cont}*a{cont}+b{cont});
            case 2
                a{cont+1}=logsig(w{cont}*a{cont}+b{cont});
            case 3
                a{cont+1}=tansig(w{cont}*a{cont}+b{cont});
        end
    end
end

