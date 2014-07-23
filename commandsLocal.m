R1 = extractSpikesFileNameLocal(yndm10, cr_tn, rt_tn, rsf_tn, col)
[a b] = sort(R1.distval_cos_cr);
b
%c = reshape(b(:,1),60,8);
c = b(:,[1 : 8 : 480);
c = b(:,[1 : 8 : 480]);
c
for j = 1 : 8; fil(j).val = b(:,[j : 8 : 480]); end
plot(fil(1).val)
plot(fil(1).val')
plot(fil(1).val(1,:))
hold on
plot(fil(1).val(2,:),'r')
plot(fil(1).val(3,:),'b')
plot(fil(1).val(4,:),'g')
legend('b1','b2','b3','b4')
for j = 1 : 8; subplot(8,1,j); fil(j).val = b(:,[j : 8 : 480]); plot(fil(j).val') end; end
for j = 1 : 8; subplot(8,1,j); fil(j).val = b(:,[j : 8 : 480]); plot(fil(j).val') end;
fil
for j = 1 : 8; subplot(8,1,j); plot(fil(j).val'); end;
%for j = 1 : 8; subplot(8,1,j); for k = 1 : 4; plot(fil(j).val(:,k), col(k)) ; hold on; end;
col = ['r', 'b', 'k', 'g']
col = ['r'; 'b'; 'k'; 'g']
for j = 1 : 8; subplot(8,1,j); for k = 1 : 4; plot(fil(j).val(:,k), col(k)) ; hold on; end;
;end
for j = 1 : 8; subplot(8,1,j); for k = 1 : 4; plot(fil(j).val(k,:), col(k)) ; hold on; end;
;end
for j = 1 : 8; subplot(8,1,j); for k = 1 : 4; plot(fil(j).val(k,:), col(k)); axis([0 480 -1 5]) ; hold on; end;
;end
for j = 1 : 8; subplot(8,1,j); for k = 1 : 4; plot(fil(j).val(k,:), col(k));   hold on; end;
;end
for j = 1 : 8; subplot(8,1,j); for k = 1 : 4; plot(fil(j).val(k,:), col(k)); axis([0 61 -1 5]) ; hold on; end; end
%[cr_n_300 rt_n_300 rsf_n_300] = extractSpikesFileName(ndm10_300(1:16000),  2*ones(1,8), ones(1,8));
cd ..
[cr_n_300 rt_n_300 rsf_n_300] = extractSpikesFileName(ndm10_300(1:16000),  2*ones(1,8), ones(1,8));
cd nsltools/
cd ..
[cr_tn_300 rt_tn_300 rsf_tn_300] = extractSpikesFileName(tone_300(1:16000),  2*ones(1,8), ones(1,8));
cd nsltools/
R1 = extractSpikesFileNameLocal(yndm10_300, cr_tn_300, rt_tn_300, rsf_tn_300, col)
R2 = extractSpikesFileNameLocal(yndm10_300, cr_tn_300, rt_tn_300, rsf_tn_300, col)
col = [ones(1,8) ; 2*ones(1,8); 4*ones(1,8); 6*ones(1,8)];
R2 = extractSpikesFileNameLocal(yndm10_300, cr_tn_300, rt_tn_300, rsf_tn_300, col)
[a b] = sort(R2.distval_cos_cr);
for j = 1 : 8; subplot(8,1,j); fil(j).val = b(:,[j : 8 : 480]);  end;
[a b] = sort(R1.distval_cos_cr);
for j = 1 : 8; subplot(8,1,j); fil(j).val = b(:,[j : 8 : 480]);  end;
[a b] = sort(R2.distval_cos_cr);
for j = 1 : 8; subplot(8,1,j); fil2(j).val = b(:,[j : 8 : 480]);  end;
for j = 1 : 8; subplot(8,1,j); for k = 1 : 4; plot(fil(j).val(k,:), col(k)); axis([0 61 -1 5]) ; hold on; end; end
col = ['r'; 'b'; 'k'; 'g']
for j = 1 : 8; subplot(8,1,j); for k = 1 : 4; plot(fil(j).val(k,:), col(k)); axis([0 61 -1 5]) ; hold on; end; end
figure
for j = 1 : 8; subplot(8,1,j); for k = 1 : 4; plot(fil2(j).val(k,:), col(k)); axis([0 61 -1 5]) ; hold on; end; end