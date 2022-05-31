function plotrgb()
  nxyz = dlmread('ciexyz31_1.csv');
  n = nxyz(:,1)';
  xyz2rgb = [3.063 -1.393 -0.476;-0.969 1.876 0.042;0.068 -0.229 1.069];
  rgb = xyz2rgb*nxyz(:,2:4)';
  r = rgb(1,:);
  g = rgb(2,:);
  b = rgb(3,:);
  plot(n,r,'linestyle','-','linewidth',2),text(640,1.7,'Red')
  axis([360 750 -1 3])
  h = gca();
  set(h,'xtick',[400:50:750]);
  hold on
  plot(n,g,'linestyle','-.','linewidth',2),text(530,1.6,'Green')
  plot(n,b,'linestyle','--','linewidth',2),text(455,2,'Blue')
end
