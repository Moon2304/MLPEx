function [w1,w2,b1,b2]=inicializardatos(P,T)
    tamEnt=size(P);
    tamTar=size(T);
    w1= -1 + (1 + 1) * rand (tamEnt(1),tamEnt(2));
    w2= -1 + (1 + 1) * rand (tamEnt(1),tamEnt(2));
    b1= -1 + (1 + 1) * rand (tamTar(1),tamTar(2));
    b2= -1 + (1 + 1) * rand (tamTar(1),tamTar(2));
end
