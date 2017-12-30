clear
syms d00 d10 d20 d01 d11 d21 d02 d12 d22
syms t00 t01 t02 t11 t12 t22
syms L00 L01 L02 L11 L12 L22

b = [ d00 d10 d20
      d01 d11 d21
      d02 d12 d22 ];
t = [ t00 t01 t02
      t01 t11 t12
      t02 t12 t22 ];
L = [ L00 L01 L02
      L01 L11 L12
      L02 L12 L22 ];
R = [  0 -1  0
       1  0  0
       0  0  1  ];


