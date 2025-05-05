function v = toy_model(t_sim,v_in)

%% MODEL SETTING
conv_model = "toy_model.slx";
t_sim = t_sim;
v_in = v_in;
%% SIMULATION C
load_system(conv_model)
out = sim(conv_model);
vel = out.v;
pulley_radius = 6.35e-3;
m = 0.5;
force_min = max(vel)^2 * m /pulley_radius;
figure()
plot(out.v, 'o')
y=force_min;
end

