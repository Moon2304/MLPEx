function [w,b]=inicializardatos(vcn,P,T)
    w={ };
	b={ };
    tamEnt=size(P);
    tamTar=size(T);
    w{1}= -1 + (1 + 1) * rand (vcn(2),tamEnt(1));
    b{1}= -1 + (1 + 1) * rand (vcn(2),tamTar(1));
    w{2}= -1 + (1 + 1) * rand (vcn(3),tamEnt(1));
    b{2}= -1 + (1 + 1) * rand (vcn(3),tamTar(1));
end
