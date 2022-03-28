function [abserror] = abserror(aproxval, trueval)
abserror = norm(aproxval - trueval);
end