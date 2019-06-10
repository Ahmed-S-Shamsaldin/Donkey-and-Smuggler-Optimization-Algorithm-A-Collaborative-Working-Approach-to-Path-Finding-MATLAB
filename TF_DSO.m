fitness_population_30=zeros(30:0); %create a vecotor of zeros to hold 30 fitness values. 


for u=1:30 % start the iteration 
    fitness_of_20_Solutions = zeros(20:0);% creating a vectore to to hold the fitness of 20 solutions 
    best_Solution_of_20_Solutions=zeros(20:0); % vector to hold the best fitness of the 20 solutions. 
    fitness_population_20=zeros(20:0); % a vector to hold the fitness population of the 20 solutions
     
     for x=1:20 % start the iteration, x is used for iterate throught the best solution out of the 20 solutions vector   
        for  i=1:20 % start the for loop, i used in the fitness function. 
         parameters=randi([-100,100],20,5); % generating a random number. andi([IMIN,IMAX],...) returns an array containing integervalues drawn from the discrete uniform distribution on IMIN:IMAX.  IMIN:IMAX depends on the test function used. 
         denominator = ((parameters(i,4)+parameters(i,5))+(parameters(i,4)^2 + parameters(i,5)^2)); % setting the denominator of the fitness function. 
         numerator = ((parameters(i,1)+parameters(i,2)+parameters(i,3))+(parameters(i,1)^2 + parameters(i,2)^2+ parameters(i,3)^2)); % setting the numerator of the fitness function. 
         fitness_of_20_Solutions(i) = denominator/numerator; % executing the fitness funtion. 
        end % end the loop
        
        best_Solution_of_20_Solutions(x) = min(fitness_of_20_Solutions); % find the best solution of the best 20 solutions found earlier. 
        index_Best_Solution_of_20_Solutions = find(fitness_of_20_Solutions == best_Solution_of_20_Solutions(x)); % finding the index of the best solution of the best 20 solutions found earlier.
        fprintf('\nthe best solution is = %i\n',index_Best_Solution_of_20_Solutions); % printing teh best solution to the screen. 
        
        fitness_population_20(x)=best_Solution_of_20_Solutions(x); % generating the population of 20 solutions. 
     end
     fitness_population_30(u)=min(fitness_population_20); % generating the population of 30 solutions that contains the best solution in the 20 best solutions population of every iteration.
end 

%% The follwoing conatins the fitness functions 
% In order to execute them, please uncomment the desired test unction.

%%     Fitness Function 1 and 2
%   

%      fitness1=zeros(50:0);
%      for rr=1:30
%      for y=1:30
% 
%          % ***** F1 Sphere
% %      fitness1(rr)=sum(fitness_population_30(y).^2);    
% 
% 
%             % ***** F2 schwefel 2.22
% %      fitness1(rr)=sum(abs(fitness_population_30(y)))+prod(abs(fitness_population_30(y)));  
%      end
% 
% 
% 
%     
%      end
%      fitness = min(fitness1);
        
%%    F3  Schwefel 1.2 Function
%       

%      dim=size(fitness_population_30,2);
%      fitness=0;
%     for i=1:dim
%         fitness=fitness+sum(fitness_population_30(1:i))^2;
%     end
  
%%    F4 Rosenbrock Function
     
% dim=size(fitness_population_30,2);
% fitness=sum(100*(fitness_population_30(2:dim)-(fitness_population_30(1:dim-1).^2)).^2+(fitness_population_30(1:dim-1)-1).^2);

%%    F5 Generalized Schwefel's Function No. 2.26
    
    
% fitness=sum(-fitness_population_30.*sin(sqrt(abs(fitness_population_30))));

%% F6 Generalized Rastrigin's Function 
%  
% dim=size(fitness_population_30,2);
% fitness=fitness+sum(fitness_population_30.^2-10*cos(2*pi.*fitness_population_30))+10*dim;

%% ***** F7 Ackley

% dim=size(fitness_population_30,2);
% fitness=-20*exp(-.2*sqrt(sum(fitness_population_30.^2)/dim))-exp(sum(cos(2*pi.*fitness_population_30))/dim)+20+exp(1);

%% F8 Generalized Griewank?s Function:
    
% dim=size(fitness_population_30,2);
% fitness=sum(fitness_population_30.^2)/4000-prod(cos(fitness_population_30./sqrt([1:dim])))+1;

%%  F11  Six-hump Camel Back Function 


% fitness=4*(fitness_population_30(1)^2)-2.1*(fitness_population_30(1)^4)+(fitness_population_30(1)^6)/3+fitness_population_30(1)*fitness_population_30(2)-4*(fitness_population_30(2)^2)+4*(fitness_population_30(2)^4);

%%  F15 Goldstein-Price Function 

% fitness=(1+(fitness_population_30(1)+fitness_population_30(2)+1)^2*(19-14*fitness_population_30(1)+3*(fitness_population_30(1)^2)-14*fitness_population_30(2)+6*fitness_population_30(1)*fitness_population_30(2)+3*fitness_population_30(2)^2))*...
%     (30+(2*fitness_population_30(1)-3*fitness_population_30(2))^2*(18-32*fitness_population_30(1)+12*(fitness_population_30(1)^2)+48*fitness_population_30(2)-36*fitness_population_30(1)*fitness_population_30(2)+27*(fitness_population_30(2)^2)));
%%

fitness_AVG=fitness/u; %% calculating the final fitness 