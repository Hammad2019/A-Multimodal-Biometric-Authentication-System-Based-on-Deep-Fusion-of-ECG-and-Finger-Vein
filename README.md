# Cancelable Algorithm for Protecting the Template of ECG Images

This repository contains MATLAB code for a cancelable algorithm designed to protect the template of ECG images. The algorithm detects the features of an ECG image, generates a pseudorandom matrix of zeros and ones, and computes the inner product between the ECG features and the random matrix.

## Author

Written in 2017 by Mohamed Hammad,
School of Computer Science and Technology,
Harbin Institute of Technology.

**Email:** mohammed.adel@ci.menofia.edu.eg

## Algorithm Description

The cancelable algorithm involves the following steps:

1. **Feature Detection**:
   - Detects features of the ECG image, including P-peaks, R-peaks, T-peaks, the mean of P-peaks, the mean of R-peaks, the mean of T-peaks, P-R intervals, and R-R intervals.

2. **Random Matrix Generation**:
   - Generates a pseudorandom scalar integer matrix of zeros and ones of the same size as the feature matrix.

3. **Inner Product Computation**:
   - Computes the inner product between the ECG features and the random matrix, resulting in a product vector (`Final`).

## ECG Features Used

- **P-peaks**
- **R-peaks**
- **T-peaks**
- **Mean of P-peaks**
- **Mean of R-peaks**
- **Mean of T-peaks**
- **P-R intervals**
- **R-R intervals**

## Prerequisites

- MATLAB (a product of The MathWorks, Inc.)
- The code has been tested with 24 records.

## How to Run the Code

1. **Clone or Download the Repository**:
    ```sh
    git clone <repository_url>
    ```

2. **Navigate to the Project Directory**:
    Open MATLAB and navigate to the directory where the project files are located.

3. **Run the Script**:
    Run the main script `CancelableAlgorithmECG.m` to execute the algorithm.

## Script Overview

### Main Script: `CancelableAlgorithmECG.m`

```matlab
clc;
clear;
close all;

% Initialize parameters
Result = [];
mean_p = [];
mean_r = [];
mean_t = [];
P_R = [];
R_R = [];
H = [];

Number_Recors = 24;

for i = 1:Number_Recors % Number of records
    [p_peaks, qpeaks, newMaxB1, s_peaks, t_peaks] = All_peaks(); % ECG Feature Extraction
    
    p_peaks(
