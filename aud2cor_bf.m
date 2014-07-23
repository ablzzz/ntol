function cr=aud2cor_bf(y, gab_filters)
[m1 n1 o1] = size(gab_filters);
[m n] = size(y);
for j = 1 : m1
    for k = 1 : n1
        
        for k1 = 1 : o1
            for l = 1 : m
                tem(1,:) = gab_filters(j, k, k1).G(l, :);
                cr(j,k, k1, l,:) = conv(y(l,:), tem, 'same');
            end
         end
    end
end
