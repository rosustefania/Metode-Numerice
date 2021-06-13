function [cost] = compute_cost_pc(points, centroids)
 [n m] = size(centroids);
 [p m] = size(points);
  cost = 0;
  
 for i = 1 : n
  list{i} = centroids(i,:);
 endfor
 % am creat liste in care pe prima pozitie am pus centroidul corespunzator;
 
 for i = 1 : p
   dist = 1e10;
   for j = 1 : n
     if ( norm(centroids(j,:) - points(i,:)) < dist )
       dist = norm(centroids(j,:) - points(i,:));
       k = j;
     endif
   endfor
   
   if ( dist != 1e10 )
      list{k} = [list{k}; points(i,:)];
    endif
 endfor
 % am luat fiecare punct si l-am adaugat in lista corespunzatoare celui mai apropiat centroid;
 
 for i = 1 : n
   [x z] = size(list{i});   
   for j = 2 : x
     cost = cost + norm(centroids(i,:) - list{i}(j,:));
    endfor 
  endfor
 % am calculat costul;
 
endfunction

