% x = 0:0.1:5;
% y = dsigmf(x,[2.5 1 2.5 4]);
% plot(x,y)
% xlabel('dsigmf, P = [5 2 5 5]')


% 
% x = 0:0.1:10;
% y = gaussmf(x,[1 5]);
% plot(x,y)
% xlabel('gaussmf, P=[1 5]')
% x = 45:0.1:135;
% y = gaussmf(x,[10 90]);
% plot(x,y)

CEX = 45:0.1:135;
CEY = gaussmf((45:0.1:135),[10 90]);
plot(CEX,CEY)