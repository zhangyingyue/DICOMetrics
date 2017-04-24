% Main Analyses Script. 

% Author: Yang Ding
% All works sponsored by Dr. Gregory Lodygensky and the Canadian Neonatal Brain Platform
% Saint. Justine Hospital, Montreal, Quebec, 
% email address: it@cnbp.ca
% Website: http://cnbp.ca
% 2017-03; Last revision: 10:02 PM March 20, 2017

%------------- BEGIN CODE --------------

clc;
clear;



% Get current path of current script. 
scriptName = mfilename('fullpath');
[currentpath, filename, fileextension]= fileparts(scriptName);

% Ensure dependencies are properly referred to
addpath(currentpath);
addpath(genpath([currentpath,'\Classification']));
addpath(genpath([currentpath,'\Results']));

tic; 
% Get output. 
Output = RecursivelyLoadDICOM();
Timer(1,2) = toc;

% Put everything in a gigantic matrix for further analyses. 
ComprehensiveMatrix = cat (2, Output.FocusMetrics, Output.SNRMetrics, Output.TextureMetrics, Output.LiveLabMetrics);

% Need to condut quality control on ComprehensiveMatrix
tic;
ClassSummary = RecursivelyAnalyzeResults(ComprehensiveMatrix,LabelString);

% Each COLUMN in ClassSummary represent the label data correspond to the each column in LabelString preloaded. 
% Each ROW in ClassSummary represent the type of classifier algorithem used. Row 1 is LDA, Row 2 is QDA, Row 3 is NB, Row 4 is NB with kernel distribution, Row 5 is decision tree. 
% Each CELL represent the Classifier as well as the cvClassifier in them. 

% Visualize all trees:
for treeIndex = 1:size(ClassSummary,2)
    view(ClassSummary(5,treeIndex).cvClassifier,'Mode','graph');
    disp(ClassSummary(5,treeIndex).cvResubError);
end

Timer(2,2) = toc;
%------------- END OF CODE --------------
