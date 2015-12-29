function NewLabels = classifier(Z,Y)
u = unique(Y);
NewLabels = u((pdist2(Z,mean(Z(Y==u(1),:))) > ...
 pdist2(Z,mean(Z(Y==u(2),:))))+1);



end

