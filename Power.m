Unprotect[Power];
Power[x_?NumberQ,y_]:= ( x ) * Power[x, y - 1] /; y > 1 ; 
Power[x_?NumberQ,y_]:= ( 1 / x) * Power[x, y + 1] /; y < -1;
Protect[Power];

