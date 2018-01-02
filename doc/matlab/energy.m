clear
syms xx xy xz
syms yx yy yz
syms zx zy zz
syms mu

Jv = [ xx xy xz
       yx yy yz
       zx zy zz ];

dv = Jv.';
tau = simplify(mu*(Jv + Jv.' + -sym(2)/sym(3)*(xx+yy+zz)*eye(3)));

ref = simplify(expand(tau(1,:)*dv(:,1) + tau(2,:)*dv(:,2) + tau(3,:)*dv(:,3)));
wik = simplify(expand(mu*(2*xx^2 + 2*yy^2 + 2*zz^2 + (xy + yx)^2 + (xz + zx)^2 + (yz+zy)^2) - 2*mu/3*(xx + yy + zz)^2));
