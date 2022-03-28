function analysis(f, xmin, xmax, ymin, ymax, i, n)
q = zeros(1, n);
for j = 1:n
    q(j) = tmquad2d(f, xmin, xmax, ymin, ymax, j, j);
end 
err = abserror(q, i);

plot(1:n, err)
xlabel("Liczba przedziałów");
ylabel("Błąd bezwzględny");
end 