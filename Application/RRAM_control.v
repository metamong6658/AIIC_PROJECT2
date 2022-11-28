`include "disciplines.h"

module RRAM_control(clk, set, learn, reset);

electrical clk, set, learn;
electrical reset;
// electrical Xin0, Xin1, Xin2, Xin3, Xin4, Xin5, Xin6,
// 	Dwl11,Dwl10,Dwl9,Dwl8,Dwl7,Dwl6,Dwl5,Dwl4,Dwl3,Dwl2,Dwl1,Dwl0,
// 	Dsl11,Dsl10,Dsl9,Dsl8,Dsl7,Dsl6,Dsl5,Dsl4,Dsl3,Dsl2,Dsl1,Dsl0,
// 	Dbl11,Dbl10,Dbl9,Dbl8,Dbl7,Dbl6,Dbl5,Dbl4,Dbl3,Dbl2,Dbl1,Dbl0,
// 	Dset,Dback,Dlabel0,Dlabel1,Dlabel2,write_en;

control ctrl(clk, set, learn, Xin0, Xin1, Xin2, Xin3, Xin4, Xin5, Xin6,
	Dwl11,Dwl10,Dwl9,Dwl8,Dwl7,Dwl6,Dwl5,Dwl4,Dwl3,Dwl2,Dwl1,Dwl0,
	Dsl11,Dsl10,Dsl9,Dsl8,Dsl7,Dsl6,Dsl5,Dsl4,Dsl3,Dsl2,Dsl1,Dsl0,
	Dbl11,Dbl10,Dbl9,Dbl8,Dbl7,Dbl6,Dbl5,Dbl4,Dbl3,Dbl2,Dbl1,Dbl0,
	Dset,Dback,Dlabel0,Dlabel1,Dlabel2,write_en);


RRAM_unit Rut(
	Dwl11,Dwl10,Dwl9,Dwl8,Dwl7,Dwl6,Dwl5,Dwl4,Dwl3,Dwl2,Dwl1,Dwl0,
	Dsl11,Dsl10,Dsl9,Dsl8,Dsl7,Dsl6,Dsl5,Dsl4,Dsl3,Dsl2,Dsl1,Dsl0,
	Dbl11,Dbl10,Dbl9,Dbl8,Dbl7,Dbl6,Dbl5,Dbl4,Dbl3,Dbl2,Dbl1,Dbl0,
	Dset,Dback,Dlabel0,Dlabel1,Dlabel2);

input_allocation ia(clk, reset, write_en, Xin6, Xin5, Xin4, Xin3, Xin2, Xin1, Xin0);

endmodule