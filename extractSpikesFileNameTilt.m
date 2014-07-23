function [R] = extractSpikesFileName(y, cr1, rt1, rsf1, linS, flag)
%    loadload;
    paras(1)=10;
    paras(2)=4;
    paras(4)=0;
    rv=2.^[1:1:5];
    sv=2.^[-2:1:3];
    %x = x(:,1);
    %x=unitseq(x);
    %fs = 16000;
    %rsf = rsf(:,1:5,:);
    %y=wav2aud(x,paras);
    [m n] = size(linS);
    cr1 = abs(cr1);
  parfor j = 1 : m
    j 
    gab_filters = create_filters_ashwintilt(paras,rv,sv, linS(j,:), flag);
    cr= aud2cor_bf(y', gab_filters);
    cr = abs(cr);
    cr2 = cr(:, 1: length(rv), : ,:, :);
    cr12 = cr1(:, 1: length(rv), : ,:, :);
    rt = squeeze(sum((abs(cr)), 4));
    rt2 = rt(:, 1 : length(rv), :,:);
    rt12 = rt1(:, 1 : length(rv),:, :);
    rsf = mean(squeeze(sum((cr), 3)),4);
    rsf2 = rsf(:, 1 : length(rv), :);
    rsf12 = rsf1(:, 1 : length(rv), :);   
    
    
    
    %rsf1 =  rsf1(:, 1:5, :);
    %d1 = ((rsf1 - rsf).*(rsf1 - rsf)); 
    
    
    
    %%% Distances
    distval_rt(j) = pdist2(abs(rt(:))', abs(rt1(:))', 'cosine') ;
    distval_cr(j) = pdist2(abs(cr(:))', abs(cr1(:))', 'cosine') ;
    distval_rsf(j) = pdist2(abs(rsf(:))', abs(rsf1(:))', 'cosine') ;
    distval_rtp(j) = pdist2(abs(rt2(:))', abs(rt12(:))', 'cosine') ;
    distval_crp(j) = pdist2(abs(cr2(:))', abs(cr12(:))', 'cosine') ;
    distval_rsfp(j) = pdist2(abs(rsf2(:))', abs(rsf12(:))', 'cosine') ;
    distvald = ((cr1(:) - cr(:)).*(cr1(:) - cr(:)));
    distval_euc_cr(j) = sum(distvald(:));
    distvald1 = ((rt1(:) - rt(:)).*(rt1(:) - rt(:))); 
    distval_euc_rt(j) = sum(distvald1(:));
    distvald1 = ((rsf1(:) - rsf(:)).*(rsf1(:) - rsf(:))); 
    distval_euc_rsf(j) = sum(distvald1(:));
    distvald = ((cr12(:) - cr2(:)).*(cr12(:) - cr2(:)));
    distval_euc_crp(j) = sum(distvald(:));
    distvald1 = ((rt12(:) - rt2(:)).*(rt12(:) - rt2(:))); 
    distval_euc_rtp(j) = sum(distvald1(:));
    distvald1 = ((rsf12(:) - rsf2(:)).*(rsf12(:) - rsf2(:))); 
    distval_euc_rsfp(j) = sum(distvald1(:));


    %save('distval', 'distval');
  end
   R.distval_cos_rt = distval_rt; [a b] = sort(distval_rt); R.col_cos_rt = linS(b,:);
   R.distval_cos_cr = distval_cr; [a b] = sort(distval_cr); R.col_cos_cr = linS(b,:);
   R.distval_cos_rsf = distval_rsf; [a b] = sort(distval_rsf); R.col_cos_rsf = linS(b,:);
   R.distval_cos_rtp = distval_rtp; [a b] = sort(distval_rtp); R.col_cos_rtp = linS(b,:);
   R.distval_cos_crp = distval_crp; [a b] = sort(distval_crp); R.col_cos_crp = linS(b,:);
   R.distval_cos_rsfp = distval_rsfp; [a b] = sort(distval_rsfp); R.col_cos_rsfp = linS(b,:);
   R.distval_euc_rt = distval_euc_rt; [a b] = sort(distval_euc_rt); R.col_euc_rt = linS(b,:);
   R.distval_euc_cr = distval_euc_cr; [a b] = sort(distval_euc_cr); R.col_euc_cr = linS(b,:);
   R.distval_euc_rsf = distval_euc_rsf; [a b] = sort(distval_euc_rsf); R.col_euc_rsf = linS(b,:);
   R.distval_euc_rtp = distval_euc_rtp; [a b] = sort(distval_euc_rtp); R.col_euc_rtp = linS(b,:);
   R.distval_euc_crp = distval_euc_crp; [a b] = sort(distval_euc_crp); R.col_euc_crp = linS(b,:);
   R.distval_euc_rsfp = distval_euc_rsfp; [a b] = sort(distval_euc_rsfp); R.col_euc_rsfp = linS(b,:);
          

