%% No Linkage

clear all, clc, 
close all

r = @(k) randn(30,1) + k; 
a = [r(7) r(1)]; b = [r(1) r(-1)]; %c = [r(0) r(5)];

figure
hold on

plot(a(:,1),a(:,2),'k.')
plot(b(:,1),b(:,2),'r.')
%plot(c(:,1),c(:,2),'g.')
axis equal
grid on


set(gca,'FontName','Candara')
set(gca,'FontSize',18)

%% Single Linkage

d = [a;b];
Z = linkage(d);
c = cluster(Z, 'maxclust', 2);
plot(d(c==1,1),d(c==1,2),'mo','linewidth',3)
plot(d(c==2,1),d(c==2,2),'bo','linewidth',3)
