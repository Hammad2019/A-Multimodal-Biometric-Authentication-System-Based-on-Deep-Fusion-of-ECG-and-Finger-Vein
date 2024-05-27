%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Cancelable Algorithm, to protect the template of ECG image.
%
% Written in 2017 by Mohamed Hammad,
%                    School of Computer Science and Technology,
%                    Harbin Institute of Technology.
%
% E.mail: mohammed.adel@ci.menofia.edu.eg
%
% Implemented in Matlab (a product of The MathWorks, Inc.)
% Note :
% First : Detect the features of ECG image then,
% This algorithm is generated pseudorandom scalar integer of zeros and ones as the same size of feature matrix 
% Finally, Compute inner product between ECG features and Random matrix (Random) and
% compute the product vector (Final).
% The ECG features that used in this algorithm are:
% P-peaks,R-peaks,T-peaks,mean of P-peaks,mean of R-peaks,mean of T-peaks,
% P-R intervals and R-R intervals
%%
clc
clear
close all
%%
% Intialize parameters
Result =[];
mean_p =[];
mean_r =[];
mean_t =[];
P_R =[];
R_R =[];
H =[];
% D =[];
% Final1 =[];
%%
Number_Recors = 24;
for i = 1:Number_Recors % No.of records
    [p_peaks,qpeaks,newMaxB1,s_peaks,t_peaks] = All_peaks(); % ECG Feature Extraction
    
    p_peaks(10) =0;
    newMaxB1(10) =0;
    t_peaks(10) =0;
    p_peaks = p_peaks(1:9); % Calculate first 9 values of P_peaks
    newMaxB1 = newMaxB1(1:9); % Calculate first 9 values of R_peaks
    t_peaks = t_peaks(1:9); % Calculate first 9 values of T_peaks
    
    mean_p = abs(round(mean(p_peaks))); % Calculate The mean of P_peaks
    mean_r = abs(round(mean(newMaxB1))); % Calculate The mean of R_peaks
    mean_t = abs(round(mean(t_peaks))); % Calculate The mean of T_peaks
    
    P_R = abs(round(mean(newMaxB1 - p_peaks))); % Calculate P-R intervals
    R_R = abs (round(mean(t_peaks - newMaxB1))); % Calculate R-R intervals
    
    Result = [Result;p_peaks,newMaxB1,t_peaks,mean_p,mean_r,mean_t,P_R,R_R]; % Concatenat all features in one vector
end
%%
V1 = size(Result,1);
V2 = size(Result,2);
% increasing the Diminsion of Hash-code according to N 
for N =1:6
    
Random = randi([0 1],V1,V2); % pseudorandom scalar integer 

Final = Result.*Random; % inner product
 Final = Final * 0.001;
Final = (sum(Final'));
disp(Final);
% save('Final.mat','Final');
%
% Check the values according to threshold
% Thre_Max = max(Final);
% Thre_Min = min(Final);
 Thre_Min = 1.5;
 Thre_Max = 4.5;
% Thre = ((Thre_Max - Thre_Min)/3);
    for j =1:length(Final)
        if Final(j)>Thre_Min && Final(j)<Thre_Max
            Final(j) =1;
        else
            Final(j) =0;
        end
    end
    
    H = [H;Final];
%     D = [D sum(pdist(H,'Hamming'))];
end
disp(round(mean(H)));
