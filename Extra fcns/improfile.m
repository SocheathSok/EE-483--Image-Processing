function out = improfile(im,th)
%
% Produces a line of pixels through the centre of an image IM at angle TH
%
[rs,cs] = size(im);
rad = ceil(sqrt(rs^2+cs^2)/2);
z = zeros(2*rad+2);
start = [rad+1-floor(rs/2),rad+1-floor(cs/2)];
z(start(1):start(1)+rs-1,start(2):start(2)+cs-1) = im;
out = zeros(1,2*rad+1);
for i = -rad:rad,
%  [rad+floor(i*cosd(th))+1,rad+floor(i*sind(th))+1]
  out(i+rad+1) = z(rad+floor(i*cosd(th))+1,rad+floor(i*sind(th))+1);
end  
end
