function[x1,y1] = allpairs(x,y)
lx = length(x);
ly = length(y);
x1 = kron(ones(ly,1),x);
y1 = kron(y,ones(lx,1));
