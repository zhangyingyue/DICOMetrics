function CV=cvlocal(I,Ws,inses)
% CVlocal   Local Square Coefficient of variation
%
% CV=variance/mean^2
%
%    INPUT:
%
%	- I: input image
%       - Ws: Estimation window Ws=[Wx Wy];
%	- inses: if inses=1 unbiased estimation of Variance
%
%   Author: Santiago Aja Fernandez
%   LOCAL STATISTICS TOOLBOX 
%
%   Modified: Feb 01 2008
%
I=double(I);
localMean = filter2(ones(Ws), I) / prod(Ws);
localVar = filter2(ones(Ws), I.^2) / prod(Ws) -localMean.^2;

if inses
	CN=(Ws(1)*Ws(2))./((Ws(1)*Ws(2))-1);
	Vl=localVar.*CN;
else
	Vl=localVar;
end

CV=localVar./(localMean.^2);
