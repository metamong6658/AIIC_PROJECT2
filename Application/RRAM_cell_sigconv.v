`include "disciplines.h"
module RRAM_cell_sigconv(Dwl,Dsl,Dbl,Dset,wl,sl,al,bl,sum);
// input
input[3:0] Dwl,Dsl,Dbl;
input Dset;
// electrical
electrical[3:0] wl,sl,al,bl,sum;
// real
real vdd=1.0;
// analog
analog begin
   // wl
   if(Dwl[3]) begin V(wl[3]) <+ vdd; end
   else begin V(wl[3]) <+ 0; end
   if(Dwl[2]) begin V(wl[2]) <+ vdd; end
   else begin V(wl[2]) <+ 0; end
   if(Dwl[1]) begin V(wl[1]) <+ vdd; end
   else begin V(wl[1]) <+ 0; end
   if(Dwl[0]) begin V(wl[0]) <+ vdd; end
   else begin V(wl[0]) <+ 0; end
   // sl
   if(Dsl[3]) begin  V(sl[3]) <+ vdd; end
   else begin V(sl[3]) <+ 0; end
   if(Dsl[2]) begin  V(sl[2]) <+ vdd; end
   else begin V(sl[2]) <+ 0; end
   if(Dsl[1]) begin  V(sl[1]) <+ vdd; end
   else begin V(sl[1]) <+ 0; end
   if(Dsl[0]) begin  V(sl[0]) <+ vdd; end
   else begin V(sl[0]) <+ 0; end
   // bl
   if (Dset) begin
      if(Dbl[3]) begin V(bl[3]) <+ 2*vdd; end
      else begin V(bl[3]) <+ 0; end
      if(Dbl[2]) begin V(bl[2]) <+ 2*vdd; end
      else begin V(bl[2]) <+ 0; end
      if(Dbl[1]) begin V(bl[1]) <+ 2*vdd; end
      else begin V(bl[1]) <+ 0; end
      if(Dbl[0]) begin V(bl[0]) <+ 2*vdd; end
      else begin V(bl[0]) <+ 0; end
   end
   else begin
      if(Dbl[3]) begin V(bl[3]) <+ vdd; end
      else begin V(bl[3]) <+ 0; end
      if(Dbl[2]) begin V(bl[2]) <+ vdd; end
      else begin V(bl[2]) <+ 0; end
      if(Dbl[1]) begin V(bl[1]) <+ vdd; end
      else begin V(bl[1]) <+ 0; end
      if(Dbl[0]) begin V(bl[0]) <+ vdd; end
      else begin V(bl[0]) <+ 0; end
   end
   // al
   V(sum[3])<+ 1 / (1 + exp(-1 * V(al[3])));
   V(sum[2])<+ 1 / (1 + exp(-1 * V(al[2])));
   V(sum[1])<+ 1 / (1 + exp(-1 * V(al[1])));
   V(sum[0])<+ 1 / (1 + exp(-1 * V(al[0])));

end
endmodule

