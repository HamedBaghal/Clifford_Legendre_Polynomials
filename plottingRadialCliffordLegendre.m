%This Programing will give us the radial Clifford-Legendre for n=0, k=1,
%you can chnge k and n
%Note that if you choose even n\in{0,2,4,...} or odd n\in{1,3,5,...} you will use evencliffordlegendrewithoutyk(r,N,k) or oddcliffordlegendrewithoutyk(r,N,k) 
%you may change the n and k, while changing n you should change the Z
%function (even/odd) approporiately

k=1;
N=1;

[R,T] = meshgrid(0:1/50:1,0:pi/50:2*pi);
X = R.*cos(T);
Y = R.*sin(T);
Z=evencliffordlegendrewithoutyk(R,N,k);
surf(X,Y,Z)



function D=oddcliffordlegendrewithoutyk(r,N,k)

if N==0
C=-2*((r.^(k+1))/(sqrt(2*pi)));
else 
C=-((((2^((2*N)+1))).*gamma((2*N)+2))./(gamma(N+1)))*(gamma(k+N+2)/(gamma(k+2))*(((r.^(k+1))/(sqrt(2*pi)))));
for i=1:N
C=C-((((2^((2*N)+1)))*gamma((2*N)+2))/(gamma(N+1)))*((nchoosek(N,i)*((gamma(i+k+N+2))/(gamma(i+k+2)))*((-1).^i)*(1/(sqrt(2*(pi))))*(r.^(2*i+k+1))));
end
end

D=(sqrt((2*k)+(4*N)+4)/(2.^(2*N+1)*factorial(2*N+1)))*C;
end


function D=evencliffordlegendrewithoutyk(r,N,k)

if N==0
C=((r.^(k))./(sqrt(2*pi)));
else
C=((((2.^(2*N)))*gamma((2*N)+1))/(gamma(N+1)))*((gamma(k+N+1)/(gamma(k+1)))*(((r.^k)/(sqrt(2*pi)))));
for i=1:N
C=C+((((2^(2*N)))*gamma((2*N)+1))/(gamma(N+1)))*((nchoosek(N,i)*((gamma(i+k+N+1))/(gamma(i+k+1)))*((-1)^i)*(1/(sqrt(2*(pi))))*(r.^(2*i+k))));
end
end

D=(sqrt((2*k)+(4*N)+2)/(2^(2*N)*factorial(2*N))).*C;
end