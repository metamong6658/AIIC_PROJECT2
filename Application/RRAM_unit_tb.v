`timescale 1ns/1ns
module RRAM_unit_tb(
	Dwl11,Dwl10,Dwl9,Dwl8,Dwl7,Dwl6,Dwl5,Dwl4,Dwl3,Dwl2,Dwl1,Dwl0,
	Dsl11,Dsl10,Dsl9,Dsl8,Dsl7,Dsl6,Dsl5,Dsl4,Dsl3,Dsl2,Dsl1,Dsl0,
	Dbl11,Dbl10,Dbl9,Dbl8,Dbl7,Dbl6,Dbl5,Dbl4,Dbl3,Dbl2,Dbl1,Dbl0,
	Dset,Dback,Dlabel);
output reg Dwl11,Dwl10,Dwl9,Dwl8,Dwl7,Dwl6,Dwl5,Dwl4,Dwl3,Dwl2,Dwl1,Dwl0;
output reg Dsl11,Dsl10,Dsl9,Dsl8,Dsl7,Dsl6,Dsl5,Dsl4,Dsl3,Dsl2,Dsl1,Dsl0;
output reg Dbl11,Dbl10,Dbl9,Dbl8,Dbl7,Dbl6,Dbl5,Dbl4,Dbl3,Dbl2,Dbl1,Dbl0;
output reg Dset,Dback,Dlabel;
initial begin
   Dwl11= 0;   Dwl10= 0;   Dwl9 = 0;   Dwl8 = 0;   Dwl7 = 0;   Dwl6 = 0;
   Dwl5 = 0;   Dwl4 = 0;   Dwl3 = 0;   Dwl2 = 0;   Dwl1 = 0;   Dwl0 = 0;
   
   Dset = 0;   Dback = 0;  Dlabel = 0;
   
   Dbl11= 0;   Dbl10= 0;   Dbl9 = 0;   Dbl8 = 0;   Dbl7 = 0;   Dbl6 = 0;
   Dbl5 = 0;   Dbl4 = 0;   Dbl3 = 0;   Dbl2 = 0;   Dbl1 = 0;   Dbl0 = 0;
   
   Dsl11= 0;   Dsl10= 0;   Dsl9 = 0;   Dsl8 = 0;   Dsl7 = 0;   Dsl6 = 0;
   Dsl5 = 0;   Dsl4 = 0;   Dsl3 = 0;   Dsl2 = 0;   Dsl1 = 0;   Dsl0 = 0;
   
   #10;
   // Transistor ON
   Dwl11= 1;   Dwl10= 1;   Dwl9 = 1;   Dwl8 = 1;   Dwl7 = 1;   Dwl6 = 1;
   Dwl5 = 1;   Dwl4 = 1;   Dwl3 = 1;   Dwl2 = 1;   Dwl1 = 1;   Dwl0 = 1;
   
   #10;
   // Initialization
   Dset = 1;
   Dbl11= 1;   Dbl10= 1;   Dbl9 = 1;   Dbl8 = 1;   Dbl7 = 1;   Dbl6 = 1;
   Dbl5 = 1;   Dbl4 = 1;   Dbl3 = 1;   Dbl2 = 1;   Dbl1 = 1;   Dbl0 = 1;
   
   #10;
   // Feed-foward
   Dset = 0;
   Dbl11= 0;   Dbl10= 0;   Dbl9 = 0;   Dbl8 = 0;   Dbl7 = 0;   Dbl6 = 0;
   Dbl5 = 0;   Dbl4 = 0;   Dbl3 = 0;   Dbl2 = 0;   Dbl1 = 0;   Dbl0 = 0;
   Dsl11= 1;   Dsl10= 1;   Dsl9 = 1;   Dsl8 = 1;
   
   #10;
   // Error Calculation
   Dlabel = 1;
   
   #10;
   // Weight Update
   Dback = 1;

   Dbl11= 0;   Dbl10= 0;   Dbl9 = 0;   Dbl8 = 0;   Dbl7 = 0;   Dbl6 = 0;
   Dbl5 = 0;   Dbl4 = 0;   Dbl3 = 1;   Dbl2 = 1;   Dbl1 = 1;   Dbl0 = 1;
   
   #10;
   Dbl11= 0;   Dbl10= 0;   Dbl9 = 0;   Dbl8 = 0;   Dbl7 = 1;   Dbl6 = 1;
   Dbl5 = 1;   Dbl4 = 1;   Dbl3 = 1;   Dbl2 = 1;   Dbl1 = 1;   Dbl0 = 1;

   #10;
   Dbl11= 1;   Dbl10= 1;   Dbl9 = 1;   Dbl8 = 1;   Dbl7 = 1;   Dbl6 = 1;
   Dbl5 = 1;   Dbl4 = 1;   Dbl3 = 1;   Dbl2 = 1;   Dbl1 = 1;   Dbl0 = 1;

   #10;
   Dbl11= 0;   Dbl10= 0;   Dbl9 = 0;   Dbl8 = 0;   Dbl7 = 0;   Dbl6 = 0;
   Dbl5 = 0;   Dbl4 = 0;   Dbl3 = 0;   Dbl2 = 0;   Dbl1 = 0;   Dbl0 = 0;
 
   #10;
   Dback = 0;
   
   #10;

end
endmodule
