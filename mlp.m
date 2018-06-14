function [Eit,Eval,w,b] = mlp(vtf,alpha,maxepoch,minEtrain,valepoch,numval,w,b,mEnt,mVal,tEnt,tVal,handles)
	Eit=[];
    Eval=[]; % Errores de validaci�n
    [n,k]=size(mEnt);
	for i=1:maxepoch+1  
		if i==maxepoch+1
			set(handles.mensaje, 'String', 'Se super� el n�mero de �pocas');
			break
		elseif ~isempty(Eit) && Eit(end)<minEtrain
			set(handles.mensaje, 'String', 'Termin� entrenamiento');
			break
        elseif ~isempty(Eval) && Eval(end)>numval
            break
        elseif mod(i,valepoch)
            Eval(end+1)=validacion(vtf,alpha,w,b,mVal,tVal);
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