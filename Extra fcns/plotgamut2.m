function plotgamut2()
  xyz2rgb = [3.063 -1.393 -0.476; -0.969 1.876 0.042;0.068 -0.229 1.069];
  ciexyz = csvread('ciexyz31_1.csv');
  ciexyz = [ciexyz;ciexyz(1,:)];
  W = ciexyz(:,1);
  X = ciexyz(:,2);
  Y = ciexyz(:,3);
  Z = ciexyz(:,4);
  S = X+Y+Z;

  [xx,yy] = meshgrid(1:512);
  z0 = zeros([size(xx),3]);
  z0(:,:,1)=xx/512;                  
  z0(:,:,2) = yy/512;                
  z0(:,:,3) = 1-xx/512-yy/512; 
  z0r = reshape(z0,prod(size(xx)),3)';
  rgb0 = xyz2rgb*z0r;
  mn = min(rgb0)<0;
  rgb1 = max(rgb0,[mn;mn;mn]);
  # rgb1(find(rgb1>1))=1;
  # mm = min(rgb0)>=0 & max(rgb0)<=1;
  # rgb1 = rgb0.*[mm;mm;mm];
  # rgb1(find(rgb1==0))=1;
  rgbs = reshape(rgb1',[size(xx),3]);
  figure,imshow(flipdim(rgbs,1))
  #figure,imshow(rgbs)
  hold on
  plot(floor(X./S*512),512-floor(Y./S*512),"-k","linewidth",3),axis on
  #plot(floor(X./S*512),floor(Y./S*512),"-k","linewidth",3),axis on
end
