function [Eval,terminar_entrenamiento] = validacion(vtf,alpha,w,b,mVal,tVal,Eval,numval)
    
    % -----------------------------------------------%
    %          Se obtiene el error de validación         %
    % -----------------------------------------------%
     Eval(end+1)=0;
    
    for cont=1:length(mVal)
        a=feedforward(w,b,vtf,mVal(cont));                 
        e=tVal(cont)-a{length(a)};
        Eval(end)=Eval(end)+abs(e);
        [w,b]=backpropagation(a,w,b,vtf,e,alpha);
    end

    Eval(end)=Eval(end)/length(mVal);
    % -----------------------------------------------%
    
    % -----------------------------------------------%
    %  Se determina si continúa el entrenamiento  %
    % -----------------------------------------------%
    if length(Eval)>= numval+1
        
        terminar_entrenamiento=1;
        
        for cont=0:numval-1
            if Eval(end-cont) < Eval(end-cont-1)
                terminar_entrenamiento=0;
                break
            end
        end
    else
        terminar_entrenamiento=0;
    end
    % -----------------------------------------------%
        
end

