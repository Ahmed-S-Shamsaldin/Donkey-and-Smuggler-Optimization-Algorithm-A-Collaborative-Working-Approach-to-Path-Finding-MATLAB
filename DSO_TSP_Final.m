tic; % start calculating the execution time for the Smuggler part.
clear all % removes all variables, globals, functions and MEX links.
clear min % clear the variable min
Dis =[0 10 12 11 14; 10 0 13 15 8; 12 13 0 9 14 ; 11 15 9 0 16; 15 8 14 16 0]; % matrix contains the distances between the cities

%  figure() % uncomment this line if the results are to be shown on graphs
    
names = {'path from city 1' ,'path from city 2' ,'path from city 3', 'path from city 4', 'path from city 5'}; % array to hold the names of the paths to be printed on the figures
namespossible = {'Possible path 1' ,'Possible path 2' ,'Possible path 3', 'Possible path 4'}; % array to hold the names of the possible paths to be printed on the figures

for i=1:5 % start the iterations.
    temp=Dis; % assigning the distances to a temporary matrix.
    temp(temp == 0 ) = NaN; % replacing the zeros in the distances with a nan value. 
    temp(:,i) = NaN; % rmoving the column from the matrix after being examined. 
           out = min(temp(i,:)) ; % find the minimum in the i row.
           [rowOfMin, colOfMin] = find(temp(i,:) == out) ; % finding the row and the column of the minimum value
           temp(:,colOfMin) = NaN; % removing the column that contains the minimum value so the salesman won't go back to that city.
        
           out1 = min(temp(colOfMin,:)) ; % finding the next minimum value in the new destination
           [rowOfMin1, colOfMin1] = find(temp(colOfMin,:) == out1) ; % finding the row and the column of the minimum value
           temp(:,colOfMin1) = NaN; % removing the column that contains the minimum value so the salesman won't go back to that city.
           
           out2=min(temp(colOfMin1,:)); % finding the next minimum value in the new destination
           [rowOfMin2, colOfMin2] = find(temp(colOfMin1,:) == out2) ;% finding the row and the column of the minimum value
           temp(:,colOfMin2) = NaN; % removing the column that contains the minimum value so the salesman won't go back to that city.

           out3=min(temp(colOfMin2,:));% finding the next minimum value in the new destination
           [rowOfMin3, colOfMin3] = find(temp(colOfMin2,:) == out3) ; % finding the row and the column of the minimum value
         
           
           % showing the results on the console 
           disp('city')
           disp(i)
           
           path=[i colOfMin colOfMin1 colOfMin2 colOfMin3 i] % putting the path in a vector form
           weight=out+out1+out2+out3+Dis(colOfMin3,i) % calculating the total weight of the path
           
           % showing the results on the graph, to show the results on
           % graphs please uncomment this part.
%            subplot(3, 2, i) ;
%             plot(path,'-*','MarkerEdgeColor','red') ;
%             title([ names(i)  'weight' num2str(weight)]);
%             ylabel('City','FontSize',12,'FontWeight','bold');
%             grid on
%             set(gca,'XTick',[])
%             set(gcf,'units','points','position',[10,10,900,900])

end % end of the iterations
execution_Time= toc;
x = input( 'choose the departure city: ' ); % asking the user to choose the city he wants the salseman to start from.
    
%% The donkey Part 
 
tic;   % start calculating the execution time for the Smuggler part.
    % finding the possible paths 
    
%     figure() % uncomment this line if the results are to be shown on graphs
    
    for r=x:x % loop to set the starting and ending city
        
        n=1; % counter for the subplots 
        
        for c=1:5 % Start teh iteration
             temp=Dis; % assigning the distances to a temporary matrix.
            temp(temp == 0 ) = NaN; % replacing the zeros in the distances with a nan value. 
            temp(:,r)=NaN;% rmoving the column from the matrix after being examined. 
             
            if ~isnan(temp(r,c)) % if it is not a NaN
                out = temp(r,c) ; % set the initial value for this iteration 
                [rowOfMin, colOfMin] = find(temp(r,:) == out); % finding the row and the column of the minimum value 
                temp(:,colOfMin) = NaN;% removing the column that contains the minimum value so the salesman won't go back to that city.
     
                 out1 = min(temp(colOfMin,:)) ;% finding the next minimum value in the new destination
                 [rowOfMin1, colOfMin1] = find(temp(colOfMin,:) == out1) ;% finding the row and the column of the minimum value 
                 temp(:,colOfMin1) = NaN;% removing the column that contains the minimum value so the salesman won't go back to that city.
           
                 out2=min(temp(colOfMin1,:));% finding the next minimum value in the new destination
                 [rowOfMin2, colOfMin2] = find(temp(colOfMin1,:) == out2) ;% finding the row and the column of the minimum value 
                 temp(:,colOfMin2) = NaN;% removing the column that contains the minimum value so the salesman won't go back to that city.
           
                 out3=min(temp(colOfMin2,:));% finding the next minimum value in the new destination
                 [rowOfMin3, colOfMin3] = find(temp(colOfMin2,:) == out3) ;% finding the row and the column of the minimum value 
                 temp(:,colOfMin3) = NaN;% removing the column that contains the minimum value so the salesman won't go back to that city.
           
                 path=[x colOfMin colOfMin1 colOfMin2 colOfMin3 x] % putting the path in a vector form 
                 weight=out+out1+out2+out3+Dis(colOfMin3,x) % calculating the total weight of the path
           
                 temp(r,c)=NaN; %% setting the initial value to NaN for this iteration. 
                 
                 %showing the results on the graph, to show the results on
                 % graphs please uncomment this part.
%                  subplot(2, 2, n); %% creating a subplot 
%                  plot(path,'-*','MarkerEdgeColor','red'); % ploting and setting the characteristics of the subplot
%                  title([ namespossible(n)  'weight' num2str(weight)]); % setting a title for the subplots
%                  ylabel('City','FontSize',12,'FontWeight','bold'); %% ading labels to the subplots
%                  grid on % adds major grid lines to the current axes.
%                  set(gca,'XTick',[]) % setting the displayed values of the X-axis to none.
%                  set(gca,'YTick',1:5) % numbering the Y-axis from 1 to 5.
%                  set(gcf,'units','points','position',[10,10,900,900]) % setting the layout of the subplot 
 
                 n=n+1; % incremeanting the subplots' counter
            end % end of the if condition 
             
        end % End of the iteration 
       
        
        
        
        
    end %end of teh start,end loop
execution_Time2= toc; % stop calculating the execution time.
  
% printing the execution time to the user. 
  fprintf('exectution time of the first part = %f',execution_Time);
  fprintf('\n');  
  fprintf('exectution time of the second part = %f',execution_Time2);
  fprintf('\n');  
  