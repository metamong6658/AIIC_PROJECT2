`include "disciplines.h"
module RRAM_cell_sigconv(Dwl,Dsl,Dbl,Dset,wl,sl,al,bl,sum);
// input   
input[1:0] Dwl,Dsl,Dbl;
input Dset;
// electrical
electrical[1:0] wl,sl,al,bl,sum;
// real
real vdd=1.0;
// analog
analog begin
   // wl
   if(Dwl[1]) begin
      V(wl[1]) <+ vdd;
   end
   else begin
      V(wl[1]) <+ 0;
   end
   if(Dwl[0]) begin
      V(wl[0]) <+ vdd;
   end
   else begin
      V(wl[0]) <+ 0;
   end
   // sl
   if(Dsl[1]) begin
      V(sl[1]) <+ vdd;
   end
   else begin
      V(sl[1]) <+ 0;
   end
   if(Dsl[0]) begin
      V(sl[0]) <+ vdd;
   end
   else begin
      V(sl[0]) <+ 0;
   end
   // bl
   if (Dset) begin
      if(Dbl[1]) begin
         V(bl[1]) <+ 2*vdd;   
      end
      else begin
         V(bl[1]) <+ 0;
      end
      if(Dbl[0]) begin
         V(bl[0]) <+ 2*vdd;
      end
      else begin
         V(bl[0]) <+ 0;
      end
   end
   else begin
      if(Dbl[1]) begin
         V(bl[1]) <+ vdd;   
      end
      else begin
         V(bl[1]) <+ 0;
      end
      if(Dbl[0]) begin
         V(bl[0]) <+ vdd;
      end
      else begin
         V(bl[0]) <+ 0;
      end
   end
   // al
   V(sum[1])<+ 1 / (1 + exp(-1 * V(al[1])));
   V(sum[0])<+ 1 / (1 + exp(-1 * V(al[0])));

end
endmodule