
nx = 100;
ny = 100;
numit = 200;

V=zeros(nx,ny);

L1R0B0 = 0;  %voltage = 0
L1R1B0 = 1;


for k = 1:numit
    for m = 2:(nx -1)  % going thru all x value
        for n = 2:(ny -1)% going thru all y values
            if(L1R0B0 == 1)
                V(1,:) = 1;  % when x= 0 and y is anything, left  voltage is 1 (hight)
                V(nx,:) = 0;  %greatest x value and y is anything voltage is 0
                V(:,ny) = V(:, ny-1); %greatest y and any x, voltage is the same voltage - 1
                V(:,1) = V(:,2);  % make 2 voltages side by side in y the save value 
            end

          if(L1R1B0 == 1)
                V(1,:) = 1;  % Left volage = 1
                V(nx,:) = 1; %right voltage is equal to 1
                V(:,ny) = 0; %Top voltage = 0
                V(:,1) = 0; %Bottom voltage = 0

          end

       
V(m,n) = (V(m+1, n) + V(m-1, n) + V(m,n+1) + V(m,n-1))/4;  %derived Tm, n equation

        end 
   

    end 
            if mod(k, 50) == 0  %modulus, take k and if bigger from 50 it subtracts 50
                surf(V')
                pause(0.05)
            end
        end
  
        [Ex, Ey] = gradient(V);  %plot the gradient 


        figure
        quiver(-Ey', -Ex', 10)  %creates vectrors of gradient, 10 = size arrows
        pause (.001)