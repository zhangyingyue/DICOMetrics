function Output = Step3ShowResults()
% Step3ShowResults - the purpose of this function is to output the latest results in a organized fashion to be ready to be interpreted 
%
% Syntax:  [output1,output2] = function_name(input1,input2,input3)
%
% Inputs:
%    	input1 			- Description
%    	input2 			- Description
%    	input3 			- Description
%
% Outputs:
%    	output1			- Description
%    	output2			- Description
%
% Example:
%    	Line 1 of example
%    	Line 2 of example
%    	Line 3 of example
%
% Other m-files required: 		none
% Subfunctions: 				none
% MAT-files required: 			none
%
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2

% Author: Yang Ding
% All works sponsored by Dr. Gregory Lodygensky and the Canadian Neonatal Brain Platform
% Saint. Justine Hospital, Montreal, Quebec,
% email address: it@cnbp.ca
% Website: http://cnbp.ca
% 2017; Last revision: 2017-09-19 12:54:20 Eastern Time

%------------- BEGIN CODE --------------
% Visualize all trees:
for treeIndex = 1:size(ClassSummary,2)
    view(ClassSummary(5,treeIndex).cvClassifier,'Mode','graph');
    disp(ClassSummary(5,treeIndex).cvResubError);
end


%------------- END OF CODE --------------
