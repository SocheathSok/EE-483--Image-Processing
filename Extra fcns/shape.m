function [cc,bdy] = shape(im,varargin)

% Change Log:
% Variable name change: im --> im to avoid reserved word

    if length(varargin) == 0
        k = 4;
    else
        k = varargin{1};
    end

    if ~((k==4) || (k==8))  % KH changed not operator from ! to ~
        error('k must be 4 or 8')
    end

    if (k==4)
        n = [0 1;-1 0;0 -1;1 0];
    else
        n = [0 1;-1 1;-1 0;-1 -1;0 -1;1 -1;1 0;1 1];
    end

    flag = 1;
    cc = [];
    [xs ys] = find(im==1);
    x = min(xs);
    imx = im(x,:);
    y = min(find(imx==1));
    first = [x y];
    bdy = [];
    dir = k-1;

    while flag==1,
        tt = zeros(1,k);
        if (k==4)
	    newdir = mod(dir+3,4);
        else
	    newdir = mod(dir+7-mod(dir,2),8);
        end 
        for i=0:k-1,
	    j = mod(newdir+i,k)+1;
	    tt(i+1) = im(x+n(j,1),y+n(j,2));
        end
	d = min(find(tt==1));
        dir = mod(newdir+d-1,k);
        cc = [cc,dir];
        x = x+n(dir+1,1);y = y+n(dir+1,2);
        bdy = [bdy;[x y]];
        if x==first(1) && y==first(2)
	    flag=0;
        end
    end
end
