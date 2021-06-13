function [centroids] = clustering_pc(points, NC)
 [n d] = size(points);
 q = fix(n / NC);
 centroids = zeros(NC, d);
  
 for i = 1 : NC
  cluster{i} = zeros(q, d) ;
 endfor
 % am initializat clusterele;

  for t = 1 : NC
    l = 1;
    for i = t : NC : n
      for j = 1 : d
        cluster{t}(l, j) = points(i, j);
     endfor
     l++;
   endfor
  endfor
  % am adaugat punctele in clusterul corespunzator;

  for i = 1 : NC
    for j = 1 : d
      centroids(i,j) = mean(cluster{i}(:, j));
    endfor
  endfor
  
  % am initializat centroizii;
  
 centroids_new = centroids;
 
 while 1
   
  for i = 1 : NC
   list{i} = centroids(i,:);
  endfor
  % am creat noi clustere in care am pus pe prima pozitie centroidul corespunzator;
  
  for i = 1 : n
    dist = 1e10;
    
    for j = 1 : NC
      if(norm(centroids(j,:) - points(i,:)) < dist)
       dist = norm(centroids(j,:) - points(i,:));
       k=j;
     endif
    endfor
    
    if ( dist != 1e10 )
      list{k} = [list{k}; points(i,:)];
    endif
    
  endfor
  
  % am adaugat fiecare punct in cel mai apropiat centroid;
  
  for i = 1 : NC
    [r p] = size(list{i});
    for j = 1 : d
      centroids_new(i, j) = mean(list{i}(2:r, j));
   endfor
  endfor
  %am recalculat centroizii;
  
  if ( centroids_new == centroids )
            break;
  endif
  % in cazul in care dupa actualizare centroizii sunt aceiasi, m-am oprit;
  centroids = centroids_new;
    
endwhile
   
endfunction