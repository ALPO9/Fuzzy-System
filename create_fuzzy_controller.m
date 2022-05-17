function f = create_fuzzy_controller()
% Create fuzzy controller
f = newfis('fuzz_auto_drive');

f = addvar(f, 'input', 'phi', [-90 270]);   % Fuzzy phi
f = addmf(f, 'input', 1, 'S3', 'trimf', [-90, -45, 0]);
f = addmf(f, 'input', 1, 'S2', 'trimf', [-45, 0, 45]);
f = addmf(f, 'input', 1, 'S1', 'trimf', [0, 45, 90]);
% f = addmf(f, 'input', 1, 'CE', 'trimf', [45, 90, 135]);
f = addmf(f, 'input', 1, 'CE', 'gaussmf', [10 90]);
f = addmf(f, 'input', 1, 'B1', 'trimf', [90, 135, 180]);
f = addmf(f, 'input', 1, 'B2', 'trimf', [135, 180, 225]);
f = addmf(f, 'input', 1, 'B3', 'trimf', [180, 225, 270]);

f = addvar(f, 'input', 'x', [0, 40]);   % Fuzzy x
f = addmf(f, 'input', 2, 'VL', 'trapmf', [0, 0, 8, 16]);
f = addmf(f, 'input', 2, 'L', 'trimf', [8, 16, 20]);
% f = addmf(f, 'input', 2, 'CE', 'trimf', [16, 20, 24]);
f = addmf(f, 'input', 2, 'CE', 'gaussmf', [1 20]);
f = addmf(f, 'input', 2, 'R', 'trimf', [20, 24, 32]);
f = addmf(f, 'input', 2, 'VR', 'trapmf', [24, 32, 40, 40]);

f = addvar(f, 'output', 'theta', [-40, 40]);    % Fuzzy theta
f = addmf(f, 'output', 1, 'S3', 'trimf', [-30, -30, -20]);
f = addmf(f, 'output', 1, 'S2', 'trimf', [-30, -20, -5]);
f = addmf(f, 'output', 1, 'S1', 'trimf', [-20, -5, 0]);
f = addmf(f, 'output', 1, 'CE', 'trimf', [-5, 0, 5]);
f = addmf(f, 'output', 1, 'B1', 'trimf', [0, 5, 20]);
f = addmf(f, 'output', 1, 'B2', 'trimf', [5, 20, 30]);
f = addmf(f, 'output', 1, 'B3', 'trimf', [20, 30, 30]);

rulelist = [
    1 1 2 1 1;
    1 2 2 1 1;
    1 3 1 1 1;
    1 4 1 1 1;
    1 5 1 1 1;
    
    2 1 3 1 1;
    2 2 2 1 1;
    2 3 2 1 1;
    2 4 1 1 1;
    2 5 1 1 1;
    
    3 1 5 1 1;
    3 2 3 1 1;
    3 3 2 1 1;
    3 4 2 1 1;
    3 5 2 1 1;
    
    4 1 6 1 1;
    4 2 5 1 1;
    4 3 4 1 1;
    4 4 3 1 1;
    4 5 2 1 1;
    
    5 1 6 1 1;
    5 2 6 1 1;
    5 3 6 1 1;
    5 4 4 1 1;
    5 5 3 1 1;
    
    6 1 7 1 1;
    6 2 7 1 1;
    6 3 6 1 1;
    6 4 6 1 1;
    6 5 5 1 1;
    
    7 1 7 1 1;
    7 2 7 1 1;
    7 3 7 1 1;
    7 4 6 1 1;
    7 5 6 1 1];

f = addrule(f, rulelist);
% showrule(f)                     % Show fuzzy rule base

f = setfis(f, 'DefuzzMethod', 'centroid'); %Defuzzy
writefis(f, 'auto_drive_fc');
