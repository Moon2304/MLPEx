function graficar(w,b,functions,p,t,Eit,handles)

    network = [];
    
    for cont=1:length(p)
        a=feedforward(w,b,functions,p(cont));
        network(end+1)=a{length(a)};
    end        
    plot(handles.error_e,Eit)
    plot(handles.resultados,p,network,'o')
    hold(handles.resultados,'on') 
    plot(handles.resultados,p,t)
    legend(handles.resultados,'y = Red neuronal','y = 1+sin((pi/4)*p)')
    hold(handles.resultados,'off') 
end