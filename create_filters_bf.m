    
function gab_filter=create_filters_bf(paras,rv,sv, bw)
f0 = 5.3/128 : 16*5.3/128: 5.3;
for j1 = 1 : length(sv)
    for k = 1 : length(rv)
        for find = 1 : length(f0)
            tsf=100;
            fsf=128/5.3;
            G = gaborFilter_MAC(rv(k), sv(j1), 0, tsf , fsf, f0(find), bw(find));
            gab_filter(j1, k ,find).G=G;
            G = gaborFilter_MAC(rv(k), sv(j1), 0, tsf , fsf, 5.3 - f0(find), bw(find));
            gab_filter(j1, k + length(rv), find).G=flipud(G);
        end
    end
end
      
    
    
    


function [G,tidx,fidx] = gaborFilter_MAC(rateVal, scaleVal, psi, fs_t, fs_f, f0, bw)

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
[T,F] = meshgrid(tidx ,fidx);
% design filter
G_env = exp(-0.5*((T - 0.2).^2/var_t + (F - f0).^2/var_f));        % envelope
G_sin = exp(j*2*pi*(rateVal*(T - 0.2) + scaleVal*(F - f0) + psi)); % sinusoid
G = G_env.*G_sin;
G = G/sqrt(sum(sum(G.^2)));
G = real(G);


