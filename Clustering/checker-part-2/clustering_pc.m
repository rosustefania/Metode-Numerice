function [centroids] = clustering_pc(points, NC)
 format long
 [n d]=size(points);
  q=fix(n/NC);
  centroids=zeros(NC,d);
  
 for i=1:NC
     cluster{i} = zeros(q,d) ;
 endfor
 


for t=1:NC
  l=1;
  for i=t:NC:n
    for j=1:d
      cluster{t}(l,j)=points(i,j);
    endfor
    l++;
  endfor
endfor


for i=1:NC
  for j=1:d
  centroids(i,j)=mean(cluster{i}(:,j));
endfor
endfor


 centroids_new=centroids;

 
 while true
   for i=1:NC
   list{i}(1,1:d)=centroids(i,:);
   endfor
     
   for i=1:n
     dist=norm(centroids(1,:) -points(i,:));
     k=1;
     for j=2:NC
       if(norm(centroids(j,:) -points(i,:)) < dist)
        dist=(centroids(j,:) -points(i,:));
        k=j;
      endif
    endfor
    list{k}=[list{k};points(i,:)];
  endfor

  for i=1:NC
    [o p]=size(list{i});
    centroids_new(i,:) = mean(list{i}(2:0,:));
    endfor

    if( centroids_new == centroids )
            break;
    endif
  centroids = centroids_new;
endwhile
   
endfunction
