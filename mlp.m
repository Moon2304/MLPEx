function [Eit,w,b] = mlp(T,vcn,vtf,alpha,maxepoch,minEtrain,valepoch,numval,w,b,mEnt,mVal,mPru,handles)
	Eit=[];
    [n,k]=size(mEnt);
	for i=1:maxepoch+1  
		if i==maxepoch+1
			set(handles.mensaje, 'String', 'Se superó el número de épocas');
			break
		elseif ~isempty(Eit) && Eit(end)<minEtrain
			set(handles.mensaje, 'String', 'Terminó entrenamiento');
			break
        else		
            Eit(end+1)=0;
			for j=1:length(mEnt)
				a=feedforward(w,b,vtf,mEnt(j));                 
				e=T(j)-a{length(a)};
				Eit(end)=Eit(end)+e;
				[w,b]=backpropagation(a,w,b,vtf,e,alpha);                
            end            
			Eit(end)=Eit(end)/k;
		end
	end
end