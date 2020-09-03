% Andrew Pun
% Assignment 0
% 4.3.4.2 (iii)

clear
clc
close all

syms t n

L = pi; % 1/2 of period of function
C = 1; % amplitude

a0 = (1/(2*L))*(int(-C, t, -L,0)+int(C, t, 0, L)) % constant coefficient
an = (1/L)*(int(-C*cos((n*pi/L)*t), t, -L, 0)+int(C*cos((n*pi/L)*t), t, 0, L)) % cos coefficients. In odd step function they are all 0
bn = (1/L)*(int(-C*sin((n*pi/L)*t), t, -L, 0)+int(C*sin((n*pi/L)*t), t, 0, L)) % sin coefficients

figh = figure;

for r=1:8 % loop from 1 to 8 (allows for 5, 10, 20, 40, 80, 160, 320, 640 steps)

    
    t = 0:0.1:2*L; % t goes from 0 to 2*L
    
    y = a0 + symsum(an*cos((n*pi/L)*t)+bn*sin((n*pi/L)*t), n, 1, 5*2^(r-1)) % fourier series. Consists of summation of an*cos((n*pi/L)*t) and bn*sin((n*pi/L)*t). There are 5*2^r steps

    % Plot settings
    plot(t, y,'r-','LineWidth', 2); % plot FFT
    title(['Step function with N = ', num2str(5*2^(r-1)), ' terms'])
    xlabel('t');
    ylabel('f(t)');
    grid on
    % ax = gca;
    % ax.XAxisLocation = 'origin';
    
    
    animation(r) = getframe(figh, [10 10 520 400]); % save frame of animation to animation matrix
    
    drawnow; % force draw each plot after loop (Matlab usually ignores drawing plots until loop is finished)
    
end

myWriter = VideoWriter('FFT_Step_function', 'MPEG-4') % write video in mp4
myWriter.FrameRate = 3; % write video with 0.25 FPS (4 seconds for each frame)

open(myWriter);
writeVideo(myWriter, animation);
close(myWriter);