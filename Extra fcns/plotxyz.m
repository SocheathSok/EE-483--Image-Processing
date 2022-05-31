function plotxyz()
  nxyz = dlmread('ciexyz31_1.csv');
  n = nxyz(:,1);
  x = nxyz(:,2);
  y = nxyz(:,3);
  z = nxyz(:,4);
  plot(n,x,'linestyle','-','linewidth',2),text(600,1.1,'X')
  axis([360 750 0 2])
  h = gca();
  set(h,'xtick',[400:50:750]);
  hold on
  plot(n,y,'linestyle','-.','linewidth',2),text(550,1.05,'Y')
  plot(n,z,'linestyle','--','linewidth',2),text(455,1.8,'Z')
end
