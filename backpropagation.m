function [w, b] = backpropagation(a,w,b,functions,e,alpha)
    sensitivities = {};
    sensitivities{length(functions)} = -2*e;
    cont = length(functions) - 1;
    while cont >= 1
        if functions(cont) == 2
            sensitivities{cont} = diag(a{cont+1}'*diag(1-a{cont+1}))*w{cont+1}'*sensitivities{cont+1};
        else
            sensitivities{cont} = diag(1-a{cont+1}^2)*w{cont+1}'*sensitivities{cont+1};
        end
        cont = cont-1;
    end
    
    for cont = 1:length(w)
        w{cont} = w{cont}-alpha*sensitivities{cont}*a{cont}';
        b{cont} = b{cont}-alpha*sensitivities{cont};
    end 
end
