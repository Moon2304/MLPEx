function [mEnt,mVal,mPru]=divDataset(P,dEnt)
	tam=length(P);
	tam1=(tam*dEnt(1))/100;%saca el tamaño de la matriz de entrenamiento
	tam1=round(tam1);%se redondea el valor de la division por si da decimal
	tam2=(tam-tam1)/2;%saca el tamaño de las matrices de validacion y prueba
	mEnt=P(1:tam1);%asina los valores a la matriz de entrenamiento
	mVal=P((tam1+1):(tam1+tam2));%asigna valores a la matriz de validacion
	mPru=P((tam-tam2+1):tam);%asigna valroes a la matriz de prueba
end

