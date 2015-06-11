impliedRNpdf:{[c2;c3;c1;rF;T;dS]
       ipdf: (c3+c1)-2*c2;
       ipdf: ipdf%(dS xexp 2);
       ipdf: ipdf * exp[rF*T];
       :ipdf
       }
