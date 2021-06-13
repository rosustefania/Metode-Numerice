function [M]=rgbhsv(A)
  A = double(A);
  [n m p] = size(A);
  M = zeros(n,m,p);
  for i = 1 : n
    for j = 1 : m
      R = double(A(i, j, 1) / 255);
      G = double(A(i, j, 2) / 255);
      B = double(A(i, j, 3) / 255);
  
      maxi = max([R, G, B]);
      mini = min([R, G, B]);
      delta = maxi - mini;
      
      if ( delta == 0 )
        H(i, j) = 0;
      else
        deltaR = ( ( ( maxi - R ) / 6 ) + (delta / 2) ) / delta;
        deltaG = ( ( ( maxi - G ) / 6 ) + (delta / 2) ) / delta;
        deltaB = ( ( ( maxi - B ) / 6 ) + (delta / 2) ) / delta;
        
        if ( maxi == R )
          H(i, j) =  deltaB - deltaG;
        endif
        
        if ( maxi == G )
          H(i, j) = 1 / 3 + deltaR - deltaB;
        endif
        
        if ( maxi == B )
          H(i, j) = 2 / 3 + deltaG - deltaR;
        endif
        
        if ( H(i, j) < 0 )
          H(i, j) = H(i, j) + 1;
        endif
        
        if ( H(i, j) > 1 )
          H(i, j) = H(i, j) - 1;
        endif
        
      endif      
      
      if ( maxi == 0 )
        S(i, j) = 0;
      else
        S(i, j) = delta / maxi;
      endif
      
      V(i, j) = maxi;
      
    endfor
  endfor
  M(:, :, 1) = H;
  M(:, :, 2) = S;
  M(:, :, 3) = V;
      
endfunction