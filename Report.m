clear all ; clc


n= 35
m= 35
ax= 0;
bx=2*pi;
ay=0;
by=2*pi
A=pi/2;
C_1=n^2;
C_2=n^2;
C_3=(-2*m^2-2*n^2+m^2*n^2*A)
C_4=m^2
C_5=m^2
%setting the boudary conditon
x=ax:2*pi/n:bx
y=ay:2*pi/m:by
%setting the boundary conditon when y=ax
for i=1:length(x)
        u_x_ax(i)= cos(pi*(x(i)-ax))*cosh(bx-x(i));
end
%setting the boundary condition when y=by
for i=1:length(x)
    u_x_by(i)= ((x(i)-ax)^2)*sin((x(i)-ax)/(2*bx-ax));
end
% setting the F function
for j=1:length(x)
    for k=1:length(y)
        F(j,k)=cos(pi/2*(x(j)-ax)/(bx-ax)+1)*sin(pi*((y(k)-ay)/(by-ay)))
    end
end

U=zeros([length(x),length(y)])
for j=2:length(x);
    for k=2:length(y);
       
        % setting function of F
        % F(j,k)=cos(pi/2*(x(j)-ax)/(bx-ax)+1)*sin(pi*((y(k)-ay)/(by-ay)))
        % setting for(2)
        U(j,1)=u_x_ax(i)
        U(j,length(y))=u_x_by(i)
        % setting for(1)
        U(1,k)=(1/C_3).*(F(j,k)-C_1.*U(j-1,k)-C_2.*U(j-1,k)-C_4.*U(j,k-1)-C_5.*U(j,k+1))
        U(length(x),k)= (1/C_3).*(F(j,k)-C_1.*U(j-1,k)-C_2.*U(j-1,k)-C_4.*U(j,k-1)-C_5.*U(j,k+1))
        % setting for the orginal terms
        U(j,k)=(1/C_3).*(F(j,k)-C_1.*U(j-1,k)-C_2.*U(j+1,k)-C_4.*U(j,k-1)-C_5.*U(j,k+1))
        
    end
end
        


    
