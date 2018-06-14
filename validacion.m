function error_validacion = validacion(vtf,alpha,w,b,mVal,tVal)
    
    error_validacion=0;
    
    for cont=1:length(mVal)
        a=feedforward(w,b,vtf,mVal(cont));                 
        e=tVal(cont)-a{length(a)};
        error_validacion=error_validacion+abs(e);
        [w,b]=backpropagation(a,w,b,vtf,e,alpha);
    end

    error_validacion=error_validacion/length(mVal);
    
end

