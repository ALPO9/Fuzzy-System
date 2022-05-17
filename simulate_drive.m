function [xy_n, p_n] = simulate_drive(xy_o, p_o, theta)
% Simulate driving model

if abs(theta) < 3
    if abs(30-xy_o(2)) < 3+5
        v = 0.2; % average v
    elseif abs(30-xy_o(2)) < 5+5 && abs(30-xy_o(2)) > 3+5
        v = 0.4; % average v
    else
        v = 4; % average v
    end
%     v = 4; % average v
elseif abs(theta) < 10 && abs(theta) > 5
    v = 2; % average v
else
    v = 1; % average v
end

% v = 1; % average v
% v = 2; % average v
p = p_o * pi / 180;
t = theta * pi / 180;
% xy_n(1) = xy_o(1) + cos(p + t) + sin(t) * sin(p);
% xy_n(2) = xy_o(2) + sin(p + t) - sin(t) * sin(p);
% p_n = p_o - 1 / sin(2 * sin(t) / b);

xy_n(1) = xy_o(1) + v * cos(p) * cos(t);
xy_n(2) = xy_o(2) + v * sin(p) * cos(t);
p_n = p_o - theta;
end