
clear
tic
N=16; % size of the lattice
T0=10; % initial tempreture
a=0.1; 
b=0.05;

%M=zeros(1,N);
A=(rand(N)>0.5)*2-1;
%b=ones(N+2);
%for i=2:N+1
    %for j=2:N+1
        %b(i,j)=a(i-1,j-1);
   %b(1,j)=a(N,j-1);
   %b(i,1)=a(i-1,N);
    %b(N+2,j)=a(1,j-1);
    %b(i,N+2)=a(i-1,1);
    %end
%end
 
T1=zeros(1,120); % we try two split the steps of tempreture more in the critical vicinity
for i =1:50
    T1(1,i)=T0 - a*i;
end
for j=51:90
    T1(1,j)= 5 - (b*(j-50));
end
for k =91:120
    T1(1,k)=3-(a*(k-90));
end
%for i=1:24
    %dt=0.1;
    %T(i)=5.4-i*dt;
%end
%for i=25:44
    %dt=0.05;
    %T(i)=3-(i-24)*dt;
%end
%for i=45:64
    %dt=0.1;
    %T(i)=2-(i-44)*dt;
%end
d(1:N)=(1:N)+1;d(N)=1; % applying periodic condition
u(1:N)=(1:N)-1;u(1)=N;
r(1:N)=(1:N)+1;r(N)=1;
l(1:N)=(1:N)-1;l(1)=N;
 
 
num=0;
for e=1:50 % number of ensembles
    num=num+1
    
    for i=1:120 
        T(i)=T1(i);
        for q=1:N^3
            x=floor(rand*(N))+1;
            y=floor(rand*(N))+1;
            H=A(x,y).*(A(d(x),y)+A(u(x),y)+A(x,r(y))+A(x,l(y))+A(u(x),r(y))+A(u(x),l(y))+A(d(x),r(y))+A(d(x),l(y)));
        
            %H=b(x,y)*(b(x+1,y)+b(x-1,y)+b(x,y-1)+b(x,y+1))-h*b(x,y);
            p=exp(-(2*H)/T(i));
            %if (2*H)<0
                %a(x,y)=-a(x,y);
       
            if p > rand
               A(x,y)=-A(x,y);
            end
        end
        H1=0;
        %M1=0;
        for k=1:N
            for j=1:N
                H1=H1-(A(k,j)*(A(d(k),j)+A(u(k),j)+A(k,r(j))+A(k,l(j))+A(u(k),r(j))+A(u(k),l(j))+A(d(k),r(j))+A(d(k),l(j))))/2;
                %M1=M1+a(k,j);
            end
        end
        H2(e,i)=H1/(N^2);
        %M1(i)=M1/(N^2);
        M(e,i)=sum(sum(A))/(N^2);
        %imagesc(a)
        %pause(0.0001)
    end
end
Cv=(var(abs(M)))./(T.^2);
X=(var(H2))./T;
figure
plot(T,mean(abs(M)));xlabel('Temperature');ylabel('Magnetization');
figure
plot(T,Cv);xlabel('Temperature');ylabel('heat capacity');
figure
plot(T,X);xlabel('Temperature');ylabel('susceptibility')
%w=1;
    %while w < e
    %w=w+1;
    %if abs(M(w,end)) >0.7
    %mm(w,:)=M(w,:);
    %ee(w,:)=H2(w,:);
    %end
    %end
    %z=(mm(:,1)~=0);
    %z1=(ee(:,end)~=0);
    %Cv=(((((sum(ee.^2))./(sum(z1)))-((((sum(ee))./(sum(z1))).^2))./(T.^2));
    
    %M2=(sum(mm))/24;
    %plot(T,M2);
    %w=0;
    %while w < e
    %w=w+1;
    %if M(w,end))==1
    %M1(w,:)=M(w,:);
    %ee(w,:)=H2(w,:);
    %end
    %end
    %z=(M1(:,end)==1);
    %M2=sum(M1)/(sum(z));
    %plot(T,M2);
    %plot(T,((sum(abs(mm)))/(sum(z))));   sum(z)=tedad ensemble ke ba
    %sharayete ghabl baghi mande
%M1=sum(M)/e;
%E=sum(H2)/e;
%C=(var(H2))./(T.^2);
%figure
%plot(T,C);xlabel('heat capacity');ylabel('tempreture');title('Cv vs. T');
 
%figure
%plot(T,M)
%xlabel('Magnetization');ylabel('Tempreture');title('M & T');
toc