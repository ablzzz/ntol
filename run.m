%j6 = batch('extractSpikesFileName',  1, {yndm20,  cr_tn, rt_tn, rsf_tn, col}, 'AdditionalPaths','\shared\persisted\nsltools', 'matlabpool', 31);
%wait(j6); data6 = fetchOutputs(j6); R_wt_norm_ndm20_tone_cos_euc = data6{1};
%j6 = batch('extractSpikesFileName',  1, {yndm5,  cr_tn, rt_tn, rsf_tn, col}, 'AdditionalPaths','\shared\persisted\nsltools', 'matlabpool', 31);
% wait(j6); data6 = fetchOutputs(j6); R_wt_norm_ndm5_tone_cos_euc = data6{1};
%save('Res_wt.mat', 'R_wt*');
j6 = batch('extractSpikesFileNameTilt',  1, {ynramp_300_1250_m10,  cr_ramp_300_1250, rt_ramp_300_1250, rsf_ramp_300_1250, col, 3}, 'AdditionalPaths','\shared\persisted\nsltools', 'matlabpool', 31);
wait(j6); data6 = fetchOutputs(j6); R_theta_norm_nramp_300_1250_m10_tone_cos_euc = data6{1};
save('Res_wt.mat', 'R_wt*');

j6 = batch('extractSpikesFileName',  1, {ynd5,  cr_tn, rt_tn, rsf_tn, col}, 'AdditionalPaths','\shared\persisted\nsltools', 'matlabpool', 31);
 wait(j6); data6 = fetchOutputs(j6); R_wt_norm_nd5_tone_cos_euc = data6{1};
save('Res_wt.mat', 'R_wt*');

%j6 = batch('extractSpikesFileName',  1, {ynd20,  cr_tn, rt_tn, rsf_tn, col}, 'AdditionalPaths','\shared\persisted\nsltools', 'matlabpool', 31);
%wait(j6); data6 = fetchOutputs(j6); R_wt_norm_nd20_tone_cos_euc = data6{1};
%save('Res_wt.mat', 'R_wt*');

