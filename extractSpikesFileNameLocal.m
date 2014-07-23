function [R] = extractSpikesFileName(y, cr1, rt1, rsf1, wt)
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
    [m n] = size(wt);
    cr1 = abs(cr1);
  for j = 1 : m
    j 
    gab_filters = create_filters_bf(paras,rv,sv, wt(j,:));
    cr= aud2cor_bf(y', gab_filters);
    cr = abs(cr);
    cr1 = abs(cr1);
    rt = squeeze(sum((abs(cr)), 4));
    rsf = mean(squeeze(sum(abs(cr), 3)),4);
    [p r l] = size(gab_filters)
    k = 1;
    for u = 1 : p
       for v = 1 : r
           for w = 1 : l
               [u v w];
    %%% Distances
                distval_rt(j,k) = pdist2(abs(squeeze(rt(u,v,w,:)))', abs(squeeze(rt1(u,v,w,:)))', 'cosine'); 
                distval_cr(j,k) = pdist2(abs(squeeze(cr(u,v,w,:)))', abs(squeeze(cr1(u,v,w,:)))', 'cosine') ;
                distvald = (squeeze(cr1(u,v,w,:)) - squeeze(cr(u,v,w,:))).*(squeeze(cr1(u,v,w,:)) - squeeze(cr(u,v,w,:)));
                distval_euc_cr(j,k) = sum(distvald(:));
                distvald1 = (squeeze(rt1(u,v,w,:)) - squeeze(rt(u,v,w,:))).*(squeeze(rt1(u,v,w,:)) - squeeze(rt(u,v,w,:)));
                distval_euc_rt(j,k) = sum(distvald1(:));
                k = k +1;
           end
       end
    end


    %save('distval', 'distval');
  end
    R.bw = wt;
    R.distval_cos_rt = distval_rt; [a, b] = sort(distval_rt); for j = 1 : 8;  R.fil_cos_rt(j).val = b(:,[j : 8 : 480]);  end;
    R.distval_cos_cr = distval_cr; [a b] = sort(distval_cr); for j = 1 : 8;  R.fil_cos_cr(j).val = b(:,[j : 8 : 480]);  end;
    R.distval_euc_rt = distval_euc_rt; [a b] = sort(distval_euc_rt); for j = 1 : 8;  R.fil_euc_rt(j).val = b(:,[j : 8 : 480]);  end;
    R.distval_euc_cr = distval_euc_cr; [a b] = sort(distval_euc_cr); for j = 1 : 8;  R.fil_euc_cr(j).val = b(:,[j : 8 : 480]);  end;
%           

