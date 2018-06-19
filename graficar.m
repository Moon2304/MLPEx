function graficar(p,t,aEntrenamiento,aPruebas,tPru,Eit,Eval,handles,tipo_problema)    
    plot(handles.error_e,Eit)
    plot(handles.error_v,Eval)
    
    plot(handles.r_entrenamiento,p,aEntrenamiento,'o')
    hold(handles.r_entrenamiento,'on') 
    plot(handles.r_entrenamiento,p,t)
    legend(handles.r_entrenamiento,'y = Red neuronal','y = Targets')
    hold(handles.r_entrenamiento,'off')
    
    plot(handles.r_pruebas,tPru,aPruebas,'o')
    hold(handles.r_pruebas,'on') 
    plot(handles.r_pruebas,p,t)
    legend(handles.r_pruebas,'y = Red neuronal','y = Targets')
    hold(handles.r_pruebas,'off')
end