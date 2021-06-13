function [sol] = rgbHistogram(path_to_image, count_bins)
  A = imread(path_to_image);
  int = 0 * 256 / count_bins;
  i = 0;
  while (i <= (count_bins - 1))
    int = [int, i * 256 / count_bins + 256 / count_bins];
    i++;
  endwhile
  % am stabilit intervalele;
  
  sr=sum(histc(A(:, :, 1), int')');
  % am retinut in vectorul sr numarul de aparitii pentru matricea de rosu;  
  i = 1;
  j = 1;
  while (i <= count_bins && j <= count_bins)
   sol(i) = sr(j);
   i++;
   j++;
  endwhile  
  % am adaugat vectorul corespunzator culorii rosie in vectorul sol;  
   
  sg = sum(histc(A(:, :, 2), int')');
  % am retinut in vectorul sg  numarul de aparitii pentru matricea de verde;
  j = 1;
  while (i <= (count_bins * 2) && j <= count_bins)
   sol(i) = sg(j);
   i++;
   j++;
  endwhile
  % am adaugat vectorul corespunzator culorii verde in vectorul sol; 

  sb = sum(histc(A(:, :, 3), int')');
  % am retinut in vectorul sb numarul de aparitii pentru matricea de albastru;
  j = 1;
  while (i <= (count_bins * 3) && j <= count_bins)
   sol(i) = sb(j);
   i++;
   j++;
  endwhile
  % am adaugat vectorul corespunzator culorii albastre in vectorul sol; 
 
endfunction