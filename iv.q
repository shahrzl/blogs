/Implied Volatility using Newton Raphson method.

\l stat.q

/Implementation using do loop.
iv1:{[volGuess;S;K;T;rF;price]
        sigma:volGuess;
        do[10;
        p:bsput[S;K;T;rF;sigma];
        v:vega[S;K;T;rF;sigma];
        sigma: (price-p-v*sigma)%v;
        ];
        :sigma
        }

/Implementation without do loop
/How to use iv2:
/iv2[;19299;19375;0.13;0.0007;520]/[10;enlist 0.2]
/You can use the adverb \ in require the intermediate values.
iv2:{[volGuess;S;K;T;rF;price]
        p:bsput[S;K;T;rF;volGuess];
        v:vega[S;K;T;rF;volGuess];
        :(price - p -v*volGuess)%v
        }

bsput:{[S;K;T;rF;vol]
        d1: (((rF+vol*vol*0.5)*T) + log S%K)%vol*sqrtT:sqrt[T];
        d2: d1 - vol*sqrtT;
        prc:(K*exp[neg rF*T]*1-nx[d2])-S*1-nx[d1];
        :prc
        }

vega:{[S;K;T;rF;vol]
        d1: (((rF+vol*vol*0.5)*T) + log S%K)%vol*sqrtT:sqrt[T];
        vg:S*sqrtT*cdf[d1];
        :vg
        }

cdf:{
        :(exp neg x*x*0.5)%sqrt[2*pi]
        }
