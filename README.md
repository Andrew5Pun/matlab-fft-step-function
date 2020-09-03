# matlab-fft-step-function
A Matlab program that depicts the changing plots of an FFT to portray a step function. Uses 4, 10, 20, 40, 80, 160, 320, and 640 terms and also saves an .mp4 of this animation with those frames.

Does not use any built in Matlab Fourier functions, only ```int``` and ```symsum```.

# animation
The program saves an .mp4 of the frames of the animation using the ```writeVideo``` function. I've included the .mp4 in the repository as well. There is another .mp4 that I rendered that uses up to 20480 (5×2<sup>12</sup>) steps, but it barely shows any visual improvement past 2560 steps (due to resolution of plot).
