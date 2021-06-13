function [values, colind, rowptr] = matrix_to_csr(A)
 k = 1;
 [n n] = size(A);
 values = nonzeros(A')';
 m = length(values);
  
 for i = 1 : n
   for j = 1 : n
    if ( A(i, j) != 0 )
      colind(k) = j;
      k++;
    endif
   endfor
 endfor 
  
 t = 1; 
 z = 1;
 
 for i = 1 : n
  ok = 0;
  l = sum(A(i,:) != 0);
   for j = 1 : n
     if ( A(i, j) != 0 && ok == 0 )
       rowptr(t) = z; 
       ok = 1;
       t++;
       z = z + l;   
    endif
  endfor
 endfor

 rowptr(t) = length(colind) + 1;
 
endfunction