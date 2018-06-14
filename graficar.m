function graficar(p,t,network,Eit,Eval,handles,tipo_problema)    
    plot(handles.error_e,Eit)
    plot(handles.error_v,Eval)
    plot(handles.resultados,p,network,'o')
    hold(handles.resultados,'on') 
    plot(handles.resultados,p,t)
    legend(handles.resultados,'y = Red neuronal','y = Targets')
    hold(handles.resultados,'off') 
end