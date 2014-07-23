function [R] = extractSpikesFileNameMI(y, cr1, rt1, rsf1, wt)
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
    distval_rt(j) = getMutualInfo(abs(rt), abs(rt1), gab_filters);
    


    %save('distval', 'distval');
  end
    R.bw = wt;
    R.distval_cos_rt = distval_rt; [a, b] = sort(distval_rt); [a b] = sort(distval_rt); R.col_cos_rt = wt(b,:);
   
%           
end
function distval_rt = getMutualInfo(rt, rt1, gab_filters) 
[p r l] = size(gab_filters);
distval_rt = 0;
    for u = 1 : p
       for v = 1 : r
           for w = 1 : l
               [u v w]
    %%% Distances
                distval_rt = distval_rt + mutualinfo(abs(squeeze(rt(u,v,w,:)))', abs(squeeze(rt1(u,v,w,:)))'); 
              
  
           end
       end
    end
end