function valdato = validar(T,vcn,vtf,alpha,maxepoch,minEtrain,w,b,mEnt)
    n=lenght(mEnt); %mEnt son los datos de validacion
    for i=1:maxepoch+1  
        for j=1:n
            a=feedforward(w,b,vtf,vcn);                 
			e=T(j)-a{length(a)};
			Eit(end)=Eit(end)+e;
			[w,b]=backpropagation(a,w,b,vtf,e,alpha);
        end 
        if Eit>minEtrain
            valdato=1;
            return
        else
            valdato=0;
            return
        end
    end
end

