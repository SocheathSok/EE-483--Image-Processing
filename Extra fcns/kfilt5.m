# This is a function to apply Kuwahara filtering on a single 5x5 block for use
# with the colfilt function.  It assumes that the input is given as a columns
# of length 25

function out = kfilt5(x)
  b1 = [1 2 3 6 7 8 11 12 13];
  b2 = [3 4 5 8 9 10 13 14 15];
  b3 = [11 12 13 16 17 18 21 22 23];
  b4 = [13 14 15 18 19 20 23 24 25];
  vs = [var(x(b1,:));var(x(b2,:));var(x(b3,:));var(x(b4,:))];
  ms = [mean(x(b1,:));mean(x(b2,:));mean(x(b3,:));mean(x(b4,:))];
  [mn,k] = min(vs);
  out = ms(sub2ind(size(ms),k,[1:length(k)]));
end
