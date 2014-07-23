    
function gab_filter=create_filters_ashwintilt(paras,rv,sv, linS, flag)
if flag == 1
	bw = linS; wt = ones(1,8); theta = [ 0.0873    0.0873   -0.0873   -0.0873   -0.0873    0.0873    0.0873    0.0873];
else if flag == 2
	bw = 2*ones(1,8); wt = linS; theta = [ 0.0873    0.0873   -0.0873   -0.0873   -0.0873    0.0873    0.0873    0.0873];
     else
	bw = 2*ones(1,8); wt = ones(1,8); theta = linS;
     end
end
f0 = 5.3/128 : 16*5.3/128: 5.3;
for j1 = 1 : length(sv)
    for k = 1 : length(rv)
        for find = 1 : length(f0)
            tsf=100;
            fsf=128/5.3;
            G = gaborFilter_MAC(rv(k), sv(j1),  tsf , fsf, f0(find), bw(find), wt(find), theta(find));
            gab_filter(j1, k ,find).G=G;
            G = gaborFilter_MAC(rv(k), sv(j1),  tsf , fsf, 5.3 - f0(find), bw(find), wt(find), theta(find));
            gab_filter(j1, k + length(rv), find).G=flipud(G);
        end
    end
end
      
    
    
    


function [G,tidx,fidx] = gaborFilter_MAC(rateVal, scaleVal,  fs_t, fs_f, f0, bw, wt, theta)

% GABORFILTER Returns a complex-valued Gabor filter with specified tuning.
%
% Usage:
% [g,tidx,fidx] = gaborFilter(rateVal, scaleVal, psi, fs_t, fs_f);
%
% Input:
% rateVal  = char. rate (in Hz)
% scaleVal = char. scale (in cyc/oct)
% psi      = char. phase (in radians)
% fs_t     = temporal sampling rate (in Hz)
% fs_f     = spectral sampling rate (in cyc/oct)
% 
% Output:
% g    = Gabor filter
% tidx = temporal index for filter (in sec)
% fidx = spectral index for filter (in oct)

% Michael A. Carlin (macarlin@jhu.edu)
% Created: 15 Feb 2014

% setup filter bandwidths (roughly two peaks along time and freq)
var_t = (1/(bw*abs(rateVal)))^2;
var_f = (1/(bw*scaleVal))^2;
 %var_t = 0.0039
%var_f = 0.0625

% time/freq indices extend roughly +/- two std in each direction
tidx = 1/fs_t:1/fs_t:1;
fidx = 5.3/128 : 1/fs_f: 5.3;
%theta = pi/3;
%tidx = tidx*cos(theta) + fidx*sin(theta);
%fidx = -tidx*sin(theta) + fidx*cos(theta);

[T1,F1] = meshgrid(tidx ,fidx);
T1 = T1 - 0.2;
F1 = F1 - f0;
T = T1*cos(theta) + T1*sin(theta);
F = -T1*sin(theta) + F1*cos(theta);

% design filter
G_env = exp(-0.5*((T).^2/var_t + (F).^2/var_f));        % envelope
G_sin = exp(1j*2*pi*(rateVal*(T) + scaleVal*(F))); % sinusoid
G = G_env.*G_sin;
G = G/sqrt(sum(sum(G.^2)));
G = wt*real(G);


