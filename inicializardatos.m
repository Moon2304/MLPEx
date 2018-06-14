function [w,b]=inicializardatos(vcn)
    w={ };
	b={ };
    
    for cont=2:length(vcn)
        w{cont-1}=rand(vcn(cont),vcn(cont-1));
        b{cont-1}=rand(vcn(cont),1);
    end
end
