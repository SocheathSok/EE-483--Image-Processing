function B=ipButter(f,d,n)
     [L C]=size(f);
     [U V]=meshgrid(-L/2:L/2-1,-C/2:C/2-1);
     D=sqrt(U.^2+V.^2);
     B=1./(1+(sqrt(2)-1)*((D/d).^(2*n)));
