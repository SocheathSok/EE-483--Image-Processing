function randisland(n,p)
    xs = [0 16 16 0 0];
    ys = [0 0 16 16 0];
    d = [2 -2 4 -4]*p;
    for k = 1:n
        L = length(xs);
        r = randi(4,1,L-1);
        x2 = (xs(1:L-1)+xs(2:L))/2 + d(r);
        y2 = (ys(1:L-1)+ys(2:L))/2 + d(r);
        xs2 = zeros(1,2*L-1);
        xs2(1:2:2*L-1) = xs;
        xs2(2:2:2*L-2) = x2;
        ys2 = zeros(1,2*L-1);
        ys2(1:2:2*L-1) = ys;
        ys2(2:2:2*L-2) = y2;
        xs = xs2;
        ys = ys2;
        d = d/2;
        end
    plot(xs,ys,"linewidth",3,"color","b")
    end
        
