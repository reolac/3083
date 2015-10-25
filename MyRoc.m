function [A] = MyRoc ( Z, Y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Tp = Z*0;
Fp = Tp;
Tn = Tp;
Fn = Tp;


    
for i = 1:(numel(Z))-1
    mid = ((Z(i)) + (Z(i+1))) / 2;
    for j = 1:numel(Z)
     if Z(j) < mid & Y(j) == 1
         Tp(i) = Tp(i) + 1;
     elseif Z(j) < mid & Y(j) ~= 1
         Fp(i) = Fp(i) + 1;
     elseif Z(j) > mid & Y(j) == 2
         Tn(i) = Tn(i) + 1;
     else
         Fn(i) = Fn(i) + 1;
     end
    end
    A(i, 1) = sum(Tp)/((sum(Tp)+sum(Fn)));
    A(i, 2) = 1-(sum(Tn)/((sum(Tn)+sum(Fp))));
end
end
