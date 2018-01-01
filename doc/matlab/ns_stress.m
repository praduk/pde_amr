clear
syms d00 d10 d20 d01 d11 d21 d02 d12 d22
syms t00 t01 t02 t11 t12 t22
syms L0000 L0100 L0200 L1000 L1100 L1200 L2000 L2100 L2200
syms L0010 L0110 L0210 L1010 L1110 L1210 L2010 L2110 L2210
syms L0020 L0120 L0220 L1020 L1120 L1220 L2020 L2120 L2220
syms L0001 L0101 L0201 L1001 L1101 L1201 L2001 L2101 L2201
syms L0011 L0111 L0211 L1011 L1111 L1211 L2011 L2111 L2211
syms L0021 L0121 L0221 L1021 L1121 L1221 L2021 L2121 L2221
syms L0002 L0102 L0202 L1002 L1102 L1202 L2002 L2102 L2202
syms L0012 L0112 L0212 L1012 L1112 L1212 L2012 L2112 L2212
syms L0022 L0122 L0222 L1022 L1122 L1222 L2022 L2122 L2222

syms mu0 l;
mu1 = (mu0-l)/sym(2);
syms theta psi;

L0000 = mu0;
L1111 = mu0;
L2222 = mu0;
L0101 = mu1;
L0110 = mu1;
L0202 = mu1;
L0220 = mu1;
L1212 = mu1;
L1221 = mu1;
L0011 = l;
L0022 = l;
L1100 = l;
L1122 = l;
L2200 = l;
L2211 = l;

d = [ d00 d10 d20
      d01 d11 d21
      d02 d12 d22 ].';
dv = d(:);
t = [ t00 t01 t02
      t01 t11 t12
      t02 t12 t22 ];

L = sym(zeros(3,3,3,3));
for i=1:3
for j=1:3
for k=1:3
for l=1:3
    m = i;
    n = j;
    if i>j
        m = j;
        n = i;
    end
    if i==j
        if( k~=l )
            continue
        end
    else 
        if ~( (i==k && j==l) || (i==l && j==k) )
            continue
        end
    end
eval(['L(i,j,k,l) = L' num2str(m-1) num2str(n-1) num2str(k-1) num2str(l-1) ';']);
end
end
end
end

Lv = L(:);
Lz = zeros(size(Lv));

%R = [  1  0  0
%       0 -1  0
%       0  0 -1  ]; Rstr= 'R_0'
%R = [ -1  0  0
%       0  1  0
%       0  0 -1  ]; Rstr= 'R_1'
%R = [  0 -1  0
%       1  0  0
%       0  0  1  ]; Rstr= 'R_2'
%R = [  1  0  0
%       0  0 -1
%       0  1  0  ]; Rstr= 'R_3'
%R = [  0  0 -1
%       0  1  0
%       1  0  0  ]; Rstr= 'R_4'
%s2 = sym(1)/sym(sqrt(2));
%R = [  s2  -s2  0
%       s2  s2   0
%       0  0  1  ]; Rstr= 'R_5'
%R=sym(R);
R = [  cos(theta)  -sin(theta)  0
       sin(theta)  cos(theta)   0
       0  0  1  ]; Rstr= 'R_6'
R=sym(R);

d2 = R*d*R.';
L2 = L;
for k=1:3
    for l=1:3
        L2(:,:,k,l) = R.'*L(:,:,k,l)*R;
    end
end

for i=1:3
for j=i:3

sum = sym(0);
for k=1:3
    for l=1:3
        sum = sum + L(i,j,k,l)*d(k,l) - L2(i,j,k,l)*d2(k,l);
    end
end
sum = collect(simplify(sum),dv);
%sum = collect(sum,dv);

%for m=1:length(Lz)
%    if( diff(sum,Lv(m)) ~= 0 )
%        Lz(m) = 1;
%    end
%end

sum = char(sum);
sum = regexprep(sum,'*','');
sum = regexprep(sum,'L(....)','L_{$1}');
%sum = regexprep(sum,'d(..)','(v \\tp{\\ldel_r})_{$1}');
sum = regexprep(sum,'d(..)','d_{$1}');
sum = regexprep(sum,'mu(.)','\\mu_{$1}');
sum = regexprep(sum,'l','\\lambda');

ij = [ num2str(i-1) num2str(j-1) ];

disp([ '0 &= \tau^L_{' ij '} - \tau^R_{' ij '}(' Rstr ') = ' sum ' \\'])

end
end

%for m=1:length(Lz)
%    if( Lz(m) == 1 )
%        disp(char(Lv(m)))
%    end
%end
