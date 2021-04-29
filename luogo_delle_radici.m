
clear all;
close all;

syms s
syms k

num = k*(s+3);
den = s*(s+12)*(s-3);

re_min = -2;
k_trovato = 154;

fsk = subs(den + num, s, s+re_min);

c = flip(coeffs(fsk, s));
routh = myRouth(c)

for r = 1:size(routh, 1)
    if has(routh(r, 1), k)
        s = solve(routh(r, 1), k);
        if s > 0
            fprintf("k > %f\n", s)
        end
    end
end

den = subs(den, k, k_trovato);
num = subs(num, k, k_trovato);

cnum = sym2poly(num);
cden = sym2poly(den);

sys = tf(cnum, cden);

figure
rlocus(sys)