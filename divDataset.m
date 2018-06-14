function [mEnt,mVal,mPru,tEnt,tVal,tPru]=divDataset(P,T,dEnt)
	tam=length(P);
	tam2=(tam*dEnt(2))/100;%saca el tamaño de la matriz de validacion y prueba
	tam2=round(tam2);%se redondea el valor de la division por si da decimal
	tam1=(tam-(tam2*2));%saca el tamaño de la matriz de entrenamiento
    V_aux(randperm(tam))=1:tam; %numeros aleatorios de 1 hasta el tamaño del vector P
   % V_aux2(randperm(tam))=1:tam;
    for i=1:tam %ciclo que recorrera el tamaño de los vectores P y T
        aux=V_aux(i);%variable auxiliar que toma el valor que asigno V_aux
        V_aux(i)=P(aux); %asignacion de valores del vector P a V_aux
        V_aux2(i)=T(aux); %asignacion de valores del vector T a V_aux2
    end
	mEnt=V_aux(1:tam1);%asina los valores a la matriz de entrenamiento
	mVal=V_aux((tam1+1):(tam1+tam2));%asigna valores a la matriz de validacion
	mPru=V_aux((tam-tam2+1):tam);%asigna valroes a la matriz de prueba
    tEnt=V_aux2(1:tam1);%asina los valores a la matriz de entrenamiento
	tVal=V_aux2((tam1+1):(tam1+tam2));%asigna valores a la matriz de validacion
	tPru=V_aux2((tam-tam2+1):tam);%asigna valroes a la matriz de prueba
end
