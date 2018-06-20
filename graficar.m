function graficar(p,t,mPru,tPru,aPruebas,aEntrenamiento,Eit,Eval,historico_w,historico_b,handles,tipo_problema)    
    plot(handles.error_e,Eit)
    plot(handles.error_v,Eval)
    
    plot(handles.r_entrenamiento,p,aEntrenamiento,'o')
    hold(handles.r_entrenamiento,'on') 
    plot(handles.r_entrenamiento,p,t)
    legend(handles.r_entrenamiento,'y = Red neuronal','y = Targets')
    hold(handles.r_entrenamiento,'off')
    
    plot(handles.r_pruebas,mPru,aPruebas,'x')
    hold(handles.r_pruebas,'on') 
    plot(handles.r_pruebas,mPru,tPru,'o')
    legend(handles.r_pruebas,'y = Red neuronal','y = Targets')
    hold(handles.r_pruebas,'off')
    
    plot(handles.actualizacion_pesos,1:length(historico_w{1}(:,1)),historico_w{1})
    
    for cont=1:length(historico_w)        
        figure('Name',['Actualización de pesos, capa: ' num2str(cont)]);
        plot(1:length(historico_w{1}(:,1)),historico_w{cont})
        %title(['Actualización de pesos, capa: ' num2str(cont)])
        figure('Name',['Actualización de bias, capa: ' num2str(cont)]);
        plot(1:length(historico_b{1}(:,1)),historico_b{cont})
        %title(['Actualización de bias, capa: ' num2str(cont)])
    end
    
end