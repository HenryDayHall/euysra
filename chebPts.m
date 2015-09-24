function x = chebPts(nodes)
x=zeros(1,nodes);
for i=1:nodes
    j=(nodes+1) -i;
    x(j) = pi + pi*cos(((2*i -1)*pi)/(2*nodes +2));
end

x(nodes) = 2*pi;
x(1) = 0;
end
