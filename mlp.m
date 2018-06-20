function [Eit,Eval,w,b,historico_w,historico_b] = mlp(vtf,alpha,maxepoch,minEtrain,valepoch,numval,w,b,mEnt,mVal,tEnt,tVal,handles)

	Eit=[]; % Errores por época
    Eval=[]; % Errores de validación
    k=length(mEnt); % Número total de datos de entrenamiento
    terminar_entrenamiento=0; % Se determina en el proceso de validación (Early Stopping)
    historico_w={}; % Cell destinado a graficar los cambios que sufren las matrices de pesos. 
                    % Contiene N matrices de tamaño MxP, donde N es el
                    % número de capas de la red, M el número de neuronas de
                    % la capa, y P el número de épocas ejecutadas en el
                    % entrenamiento.
    historico_b={};
                   
	for i=1:maxepoch+1
        fprintf('epoca %d\n',i);
		if i==maxepoch+1
			set(handles.mensaje, 'String', 'Se superó el número de épocas');
			break
		elseif ~isempty(Eit) && Eit(end)<minEtrain
			set(handles.mensaje, 'String', 'Se obtuvo el error mínimo');
			break
        elseif terminar_entrenamiento
            set(handles.mensaje, 'String', 'Se complió la condición de Early Stopping');
            break
        elseif mod(i,valepoch) == 0
            [Eval,terminar_entrenamiento]=validacion(vtf,alpha,w,b,mVal,tVal,Eval,numval);
        else		
            Eit(end+1)=0;
            for j=1:length(mEnt)
				a=feedforward(w,b,vtf,mEnt(j));                 
				e=tEnt(j)-a{length(a)};
				Eit(end)=Eit(end)+abs(e);
				[w,b]=backpropagation(a,w,b,vtf,e,alpha);
            end            
			Eit(end)=Eit(end)/k;
            [historico_w,historico_b] = actualizar_historico(historico_w,historico_b,w,b);
		end
	end
end