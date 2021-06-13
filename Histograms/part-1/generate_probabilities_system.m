function [A, b] = generate_probabilities_system(rows)
  % n reprezinta numarul de pozitii din labirint;
  n = rows * (rows + 1) / 2;
  % in matricea M voi retine labirintul in forma sa de piramida;
  M = zeros(rows + 2, n + 2 );
  A = zeros(n, n);
  
  % verific daca numarul pozitiilor este par sau impar;
  % il adaug pe 1 in matricea M si deplasez indicele coloanei in stanga lui;
  if ( mod(n, 2) == 0 )
    M(2, (n + 2) / 2) = 1;
    j = n / 2;
  else
    M(2, (n + 1) / 2) = 1;
    j = (n - 1) / 2;
  endif
 
 % realizez conturul din partea stanga piramidei, adica pozitiile din extremitatea stanga; 
 % totodata acestea au 5 iesiri( exceptand colturile), asa ca pt fiecare pozitie de pe conturul stang
 % voi adauga 5 pe diagonala principala;
 % la fel procedez si pe partea dreapta;
  i = 3;
  r = 1;
  p = 1;
  t = j + 2;
  
  while ( j > 1 && i <= rows + 1 && t <= n )
    r = r + i - 2;
    p = p + i - 1;
    A(p, p) = 5;
    A(r, r) = 5;
    M(i, t) = p;
    M(i, j) = r;
    
    for k = (j + 2) : 2 : t
      M(i, k) = M(i, k - 2) + 1;        
    endfor
    
    i++;
    j--;
    t++;    
  endwhile
  
  % bag in matricea M pozitiile din inferioriatea labirintului;
  % acestea au cate 5 iesiri( exceptie fac colturile), 
  % asa ca adaug in matricea A 5 in dreptul poiztiei corespunzatoare;
  for k = (j + 1) : (t - 1)
   if ( M(rows + 1, k) != 0 )
    m = M(rows + 1, k);
    A(m, m) = 5;
    endif
  endfor
  
  % in matricea A adaug numarul de iesire pt pozitiile din colt, adica 4;
  A(1, 1) = 4;
  A(n, n) = 4;
  A(n - rows + 1, n - rows + 1) = 4;
  
  % elementele care pe diagonala principala a lui A au ramas necompletate 
  % vor avea cate 6 iesiri deorece se afla in mijloc;
  for i = 4 : (n - rows + 1)
    if ( A(i, i) == 0 )
      A(i, i) = 6;
    endif   
 endfor
 
 % matricea A este simetrica fata de diag pricipala asa ca voi lua in calcul doar pozitiile
 % din fata, stanga, dreapta in care se va duce nu si cele precedente;
 % adaug in matricea A -1 pe in locurile in care se poate ajunge de pe o anumita pozitie;
 A(1, 2) = A(1, 3) = -1;

  for i = 2 : (rows + 1)
    for j = 1 : n
   
      if ( M(i, j) != 0 && M(i, j + 2) != 0 )
        m = M(i, j);
        k = M(i, j + 2);
        A(m, k) = -1;
     endif
    
      if ( M(i, j) != 0 && M(i + 1, j - 1) != 0 && M(i + 1, j + 1) !=0 )
       m = M(i, j);
       k = M(i + 1, j - 1);
       p = M(i + 1, j + 1);
       A(m, k) = -1;
       A(m, p) = -1;
      endif
    
   endfor
  endfor
  
 % completez sub diag principala cu elementelede deasuora ei;
  for i = 2 : n
   for j = 1 : (i - 1)
      if ( A(j, i) == -1 )
        A(i, j) = -1;
      endif
    endfor
  endfor
  
  % construiesc vectorul coloana al termenilor liberi;
  b = zeros(n, 1);
  b((n - rows + 1): n, 1) = 1;
    
endfunction