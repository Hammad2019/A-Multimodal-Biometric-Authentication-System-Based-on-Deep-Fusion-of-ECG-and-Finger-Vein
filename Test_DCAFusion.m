clc
clear
close all
%%
% Intialize parameters
Result =[];
Result1 =[];
mean_p =[];
mean_r =[];
mean_t =[];
P_R =[];
R_R =[];
H =[];
label = [];
% D =[];
% Final1 =[];
%%
Number_Recors = 18;
for i = 1:Number_Recors % No.of records
    [p_peaks,qpeaks,newMaxB1,s_peaks,t_peaks] = All_peaks(); % ECG Feature Extraction
    
    p_peaks(10) =0;
    newMaxB1(10) =0;
    t_peaks(10) =0;
    p_peaks = p_peaks(1:9); % Calculate first 9 values of P_peaks
    newMaxB1 = newMaxB1(1:9); % Calculate first 9 values of R_peaks
    t_peaks = t_peaks(1:9); % Calculate first 9 values of T_peaks
    
     mean_p = ((mean(p_peaks))); % Calculate The mean of P_peaks
    mean_r = ((mean(newMaxB1))); % Calculate The mean of R_peaks
    mean_t = ((mean(t_peaks))); % Calculate The mean of T_peaks
    
    P_R = ((mean(newMaxB1 - p_peaks))); % Calculate P-R intervals
    R_R =  ((mean(t_peaks - newMaxB1))); % Calculate R-R intervals
    
    Result = [Result;p_peaks,newMaxB1,t_peaks,mean_p,mean_r,mean_t,P_R,R_R]; % Concatenat all features in one vector
end
Result =Result';
for i = 1:Number_Recors % No.of records
    [p_peaks1,qpeaks1,newMaxB11,s_peaks1,t_peaks1] = All_peaks(); % ECG Feature Extraction
    
    p_peaks1(10) =0;
    newMaxB11(10) =0;
    t_peaks1(10) =0;
    p_peaks1 = p_peaks1(1:9); % Calculate first 9 values of P_peaks
    newMaxB11 = newMaxB11(1:9); % Calculate first 9 values of R_peaks
    t_peaks1 = t_peaks1(1:9); % Calculate first 9 values of T_peaks
    
     mean_p1 = ((mean(p_peaks1))); % Calculate The mean of P_peaks
    mean_r1 = ((mean(newMaxB11))); % Calculate The mean of R_peaks
    mean_t1 = ((mean(t_peaks1))); % Calculate The mean of T_peaks
    
    P_R1 = ((mean(newMaxB11 - p_peaks1))); % Calculate P-R intervals
    R_R1 =  ((mean(t_peaks1 - newMaxB11))); % Calculate R-R intervals
    
    Result1 = [Result1;p_peaks1,newMaxB11,t_peaks1,mean_p1,mean_r1,mean_t1,P_R1,R_R1]; % Concatenat all features in one vector
end
Result1 =Result1';
% for l= 1:size(Result,2)
%     h =1;
%   label = [label h];  
%     
% end
label = [1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9];
[Ax,Ay,Xs,Ys] = dcaFuse(Result,Result1,label);





