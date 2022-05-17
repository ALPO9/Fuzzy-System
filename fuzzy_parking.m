
function fuzzy_parking(init)
% Initialiate
%init = [13, 30];

% initial plot
init_plot()

% Create fuzzy controller
f = create_fuzzy_controller();

% Main process
d_xy = [init(1), init(2)];
d_phi = init(3);
err_x = 99;
err_phi = 99;
err_y = 99;
draw_car(d_xy, d_phi);	% draw initial draw

while ((err_x > 1) || (err_phi > 4) || (err_y > 5))
    % fuzzy control
    d_theta = evalfis([d_phi, d_xy(1)], f);     
    % simulate drive
    [d_xy, d_phi] = simulate_drive(d_xy, d_phi, d_theta);   
    
    % draw car
    draw_car(d_xy, d_phi);                    
    
    % update errors
    err_x = abs(d_xy(1) - 20);
    err_phi = abs(d_phi - 90);
    err_y = abs(d_xy(2) - 30);
end

% output error information
err_x, err_phi
end

% Draw Arror Function
function draw_car(pos, angle)
length = 4.428;
headsize = 1.660;
ra = angle * pi / 180;
p2(1) = pos(1) + length * cos(ra);
p2(2) = pos(2) + length * sin(ra);
draw(pos, p2, headsize, length, ra)
% draw(pos, p2, 0.7, 1.5, ra)
end

% Initial Plot Function
function init_plot()
figure
grid on
%axis equal
axis([0 40 0 40])
set(gca, 'XTick', [0 20 40]);
set(gca, 'YTick', []);
% draw_annotation()
end
% Draw Annotation Function
function draw_annotation()
xa = [.2 .2];
ya = [.9 .75];
annotation('draw',xa,ya, 'LineWidth', 1.5)
xl = [.28 .28];
yl = [.9 .75];
annotation('line',xl,yl, 'LineWidth', 1.5)
xl = [.36 .36];
yl = [.9 .75];
annotation('line',xl,yl, 'LineWidth', 1.5)
xl = [.28 .36];
yl = [.9 .9];
annotation('line',xl,yl, 'LineWidth', 1.5)
xl = [.28 .36];
yl = [.75 .75];
annotation('line',xl,yl, 'LineWidth', 1.5)
xl = [.27 .27];
yl = [.8 .76];
annotation('line',xl,yl, 'LineWidth', 1.5)
xl = [.37 .37];
yl = [.8 .76];
annotation('line',xl,yl, 'LineWidth', 1.5)
xl = [.27 .29];
yl = [.9 .86];
annotation('line',xl,yl, 'LineWidth', 1.5)
xl = [.35 .37];
yl = [.9 .86];
annotation('line',xl,yl, 'LineWidth', 1.5)
end