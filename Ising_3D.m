
clear
tic
N=8;
 T0=8;
 a=0.1;
 B=0.05;
%A=zeros(N,N,N);
%M=zeros(1,N);
A=(rand(N,N,N)>0.5)*2-1;
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
 
T1=zeros(1,90);
    for i =1:30
        T1(1,i)=T0 - a*i;
    end
    for j=31:50
        T1(1,j)= 5 - (B*(j-30));
    end
    for k =51:90
        T1(1,k)=4 -(a*(k-50));
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
b(1:N)=(1:N)-1;b(1)=N;
f(1:N)=(1:N)+1;f(N)=1;
d(1:N)=(1:N)+1;d(N)=1;
u(1:N)=(1:N)-1;u(1)=N;
r(1:N)=(1:N)+1;r(N)=1;
l(1:N)=(1:N)-1;l(1)=N;
 
 
 num=0;
for e=1:50
    num=num+1
    
    for i=1:90
    T(i)=T1(i);
        for q=1:N^4
            x=floor(rand*(N))+1;
            y=floor(rand*(N))+1;
            z=floor(rand*(N))+1;
            H=A(x,y,z).*(A(d(x),y,z)+A(u(x),y,z)+A(x,r(y),z)+A(x,l(y),z)+A(x,y,f(z))+A(x,y,b(z)));
        
            %H=b(x,y)*(b(x+1,y)+b(x-1,y)+b(x,y-1)+b(x,y+1))-h*b(x,y);
            p=exp(-(2*H)/T(i));
            %if (2*H)<0
                %a(x,y)=-a(x,y);
       
            if p > rand
                A(x,y,z)=-A(x,y,z);
            end
        end
        H1=0;
        %M1=0;
        for k=1:N
            for j=1:N
                for v=1:N

                    H1=H1-(A(k,j,v).*(A(d(k),j,v)+A(u(k),j,v)+A(k,r(j),v)+A(k,l(j),v)+A(k,j,f(v))+A(k,j,b(v))))/2;
                    %M1=M1+a(k,j);
                end
            end
        end
        H2(e,i)=H1/(N^3);
        %M1(i)=M1/(N^2);
        M(e,i)=sum(sum(sum(A)))/(N^3);
        %imagesc(a)
        %pause(0.0001)
    end
end
% w=1;
%     while w < e
%     w=w+1;
%     if abs(M(w,end)) >0.7
%     mm(w,:)=M(w,:);
%     ee(w,:)=H2(w,:);
%     end
%     end
%     z=(mm(:,1)~=0);
%     z1=(ee(:,end)~=0);
%     Cv=(((((sum(ee.^2))./(sum(z1)))-((((sum(ee))./(sum(z1))).^2))./(T.^2))));
    
    
w=0;
while w < e
    w=w+1;
    if M(w,end)==1
        M1(w,:)=M(w,:);
        ee(w,:)=H2(w,:);
    end
end
z=(M1(:,end)==1);
M2=sum(M1)/(sum(z));
    
   % plot(T,((sum(abs(mm)))/(sum(z))));   %sum(z)=tedad ensemble ke ba
     %sharayete ghabl baghi mande
M1=sum(M)/e;
E=sum(H2)/e;
C=(var(H2))./(T.^2);
figure
plot(T,C);xlabel('heat capacity');ylabel('tempreture');title('Cv vs. T');
 
figure
%plot(T,M)
plot(T,M2);
xlabel('Magnetization');ylabel('Tempreture');title('M & T');
toc