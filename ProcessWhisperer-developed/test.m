%% MODEL SETTING
conv_model = "toy_model_advanced.slx";
t_sim = 10;
v_in = 4;
distancePulleyAB = [-30 -5 0]
distancePulleyAC = [30 0 0]
massPulleyA = 100

cable_k = 1
cable_b = 2
g = 1
n_lines = 2
payload_mass = 1
%% SIMULATION C
load_system(conv_model)
out = sim(conv_model);

