function [network]=pruebas(w,b,mPru,functions)
    network=[];
    for cont=1:length(mPru)
        a=feedforward(w,b,functions,mPru(cont));
        network(end+1)=a{length(a)};  
    end  
end