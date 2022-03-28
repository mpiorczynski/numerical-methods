function [relerror] = relerror(aproxval, trueval)
relerror = norm(aproxval - trueval) / norm(trueval);
end