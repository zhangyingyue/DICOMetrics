function localMean=localmean3D(I,Ws)
% varlocal   Local variance
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
[Mx My Mz]=size(I);

if length(Ws)==2

   for ii=1:Mz
      localMean(:,:,ii) = filter2(ones(Ws), I(:,:,ii)) / prod(Ws);
    
   end

else
   localMean = convn(I,ones(Ws),'same') / prod(Ws);
end
