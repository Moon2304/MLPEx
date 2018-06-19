function [Eit,Eval,w,b] = mlp(vtf,alpha,maxepoch,minEtrain,valepoch,numval,w,b,mEnt,mVal,tEnt,tVal,handles)

	Eit=[]; % Errores por �poca
    Eval=[]; % Errores de validaci�n
    k=length(mEnt); % N�mero total de datos de entrenamiento
    terminar_entrenamiento=0; % Se determina en el proceso de validaci�n (Early Stopping)
    
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
		end
	end
end