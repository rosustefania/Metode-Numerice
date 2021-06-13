function [G_J, c_J] = Jacobi_factorization(A, b)

  N = diag(diag(A));
  P = N - A;
  M = inv(N);
  G_J = M * P;
  c_J = M * b;
  
endfunction  

