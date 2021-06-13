function [sol] = hsvHistogram(path_to_image, count_bins)
  A = imread(path_to_image);
  M = rgbhsv(A);
  int = 0 * 1.01 / count_bins;
  i = 0;
  while (i <= count_bins - 1)
    int = [int, (i * (1.01 / count_bins) + (1.01 / count_bins))];
    i++;
  endwhile
  % am stabilit intervalele;
  
  sh = sum(histc(M(:, :, 1), int')');
  % am retinut in vectorul sh numarul de aparitii pentru matricea H;  
  i = 1;
  j = 1;
  while (i <= count_bins && j <= count_bins)
   sol(i) = sh(j);
   i++;
   j++;
  endwhile  
  % am adaugat vectorul corespunzator lui H in vectorul sol;  
   
  ss = sum(histc(M(:, :, 2), int')');
  % am retinut in vectorul ss  numarul de aparitii pentru matricea S;
  j = 1;
  while (i <= (count_bins * 2) && j <= count_bins)
    sol(i) = ss(j);
    i++;
    j++;
  endwhile
   % am adaugat vectorul corespunzator lui S in vectorul sol; 

  sv = sum(histc(M(:, :, 3), int')');
  % am retinut in vectorul sv numarul de aparitii pentru matricea V;
  j = 1;
  while (i <= (count_bins * 3) && j <= count_bins)
   sol(i) = sv(j);
   i++; 
   j++;
  endwhile
  % am adaugat vectorul corespunzator lui V in vectorul sol; 
endfunction