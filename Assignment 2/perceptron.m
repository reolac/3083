function w = perceptron(d,l,eta)
[p q] = size(d);
w = rand(q+1,1);
X = [min(d(:,1)), max(d(:,1))];
figure;
hold on;
grid on;
axis([0 1 0 1]);


Y = ((w(2) * -1) * X + (w(1) * -1))/w(3);
plot(X, Y, 'k');
while q*q'
    for i = 1:p
        z = [1 d(i,:)];
        v = z * w < 0;
        q(i) = v==l(i);
        w = w + q(i)*(2*v-1)*eta*z';
        Y = ((w(2) * -1) * X + (w(1) * -1))/w(3);
        labN =  w(2) * d(:,1) + w(3) * d(:,2) + w(1) > 0;
        plot(X, Y, 'k');
        
    end

end
    Y = (-0.4 * X + 0.4)/0.4;
plot(X, Y, 'b','Linewidth',3);
    plot(d(labN == 0,1), d(labN == 0,2), 'r.', 'MarkerSize', 25);
    plot(d(labN == 1,1), d(labN == 1,2), 'g.', 'MarkerSize', 25); 
end
