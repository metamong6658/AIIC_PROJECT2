`timescale 1ns/1ns
module RRAM_unit_tb(Dwl5,Dwl4,Dwl3,Dwl2,Dwl1,Dwl0,Dsl5,Dsl4,Dsl3,Dsl2,Dsl1,Dsl0,Dbl5,Dbl4,Dbl3,Dbl2,Dbl1,Dbl0,Dset,Dback,Dlabel);
output reg Dwl5,Dwl4,Dwl3,Dwl2,Dwl1,Dwl0;
output reg Dsl5,Dsl4,Dsl3,Dsl2,Dsl1,Dsl0;
output reg Dbl5,Dbl4,Dbl3,Dbl2,Dbl1,Dbl0;
output reg Dset,Dback,Dlabel;
initial begin
   Dwl5 = 0;   Dwl4 = 0;   Dwl3 = 0;   Dwl2 = 0;   Dwl1 = 0;   Dwl0 = 0;
   Dset = 0;   Dback = 0;  Dlabel = 0;
   Dbl5 = 0;   Dbl4 = 0;   Dbl3 = 0;   Dbl2 = 0;   Dbl1 = 0;   Dbl0 = 0;
   Dsl5 = 0;   Dsl4 = 0;   Dsl3 = 0;   Dsl2 = 0;   Dsl1 = 0;   Dsl0 = 0;
   #10;
   // Transistor ON
   Dwl5 = 1;   Dwl4 = 1;   Dwl3 = 1;   Dwl2 = 1;   Dwl1 = 1;   Dwl0 = 1;
   #10;
   // Initialization
   Dset = 1;
   Dbl5 = 1;   Dbl4 = 1;   Dbl3 = 1;   Dbl2 = 1;   Dbl1 = 1;   Dbl0 = 1;
   #10;
   // Feed-foward
   Dset = 0;
   Dbl5 = 0;   Dbl4 = 0;   Dbl3 = 0;   Dbl2 = 0;   Dbl1 = 0;   Dbl0 = 0;
   Dsl5 = 1;   Dsl4 = 1;
   #10;
   // Error Calculation
   Dlabel = 1;
   #10;
   // Weight Update
   Dback = 1;
   Dbl5 = 0;   Dbl4 = 0;   Dbl3 = 0;   Dbl2 = 0;   Dbl1 = 1;   Dbl0 = 1;
   #10;
   Dbl5 = 0;   Dbl4 = 0;   Dbl3 = 1;   Dbl2 = 1;   Dbl1 = 1;   Dbl0 = 1;
   #10;
   Dbl5 = 1;   Dbl4 = 1;   Dbl3 = 1;   Dbl2 = 1;   Dbl1 = 1;   Dbl0 = 1;
   #10;
   Dbl5 = 0;   Dbl4 = 0;   Dbl3 = 0;   Dbl2 = 0;   Dbl1 = 0;   Dbl0 = 0;
   #10;
   Dback = 0;
   #10;

   
end
endmodule