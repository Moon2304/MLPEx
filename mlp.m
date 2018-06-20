function [Eit,Eval,w,b,historico_w,historico_b] = mlp(vtf,alpha,maxepoch,minEtrain,valepoch,numval,w,b,mEnt,mVal,tEnt,tVal,handles)

	Eit=[]; % Errores por �poca
    Eval=[]; % Errores de validaci�n
    k=length(mEnt); % N�mero total de datos de entrenamiento
    terminar_entrenamiento=0; % Se determina en el proceso de validaci�n (Early Stopping)
    historico_w={}; % Cell destinado a graficar los cambios que sufren las matrices de pesos. 
                    % Contiene N matrices de tama�o MxP, donde N es el
                    % n�mero de capas de la red, M el n�mero de neuronas de
                    % la capa, y P el n�mero de �pocas ejecutadas en el
                    % entrenamiento.
    historico_b={};
                   
	for i=1:maxepoch+1
        fprintf('epoca %d\n',i);
		if i==maxepoch+1
			set(handles.mensaje, 'String', 'Se super� el n�mero de �pocas');
			break
		elseif ~isempty(Eit) && Eit(end)<minEtrain
			set(handles.mensaje, 'String', 'Se obtuvo el error m�nimo');
			break
        elseif terminar_entrenamiento
            set(handles.mensaje, 'String', 'Se compli� la condici�n de Early Stopping');
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