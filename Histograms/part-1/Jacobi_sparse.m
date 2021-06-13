function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  n = length(G_rowptr) - 1;
  y = zeros(n);
  z = csr_multiplication(G_values, G_colind, G_rowptr, y);
  x = z + c;
  e = norm(x - y);
  
  while ( e > tol )    
   y = x; 
   z = csr_multiplication(G_values, G_colind, G_rowptr, y);
   x = z + c;
   e = norm(x - y);
  
endwhile

endfunction