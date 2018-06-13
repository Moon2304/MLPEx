function [w,b]=inicializardatos(vcn,P,T)
    tamEnt=size(P);
    tamTar=size(T);
    w= -1 + (1 + 1) * rand (vcn(2),tamEnt(1));
    b= -1 + (1 + 1) * rand (vcn(2),tamTar(1));
end
