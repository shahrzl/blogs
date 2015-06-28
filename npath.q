
fact:{1*/1+til x}

nPath:{[k;i]
        tmp:0.5*k-i;
        l:`long$tmp;
        fk:fact[k];
        fl:fact[l];
        fkl:fact[k-l];
        :fk%fl*fkl
        }
