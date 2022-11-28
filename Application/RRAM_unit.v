`include "disciplines.h"
module RRAM_unit(
	Dwl11,Dwl10,Dwl9,Dwl8,Dwl7,Dwl6,Dwl5,Dwl4,Dwl3,Dwl2,Dwl1,Dwl0,
	Dsl11,Dsl10,Dsl9,Dsl8,Dsl7,Dsl6,Dsl5,Dsl4,Dsl3,Dsl2,Dsl1,Dsl0,
	Dbl11,Dbl10,Dbl9,Dbl8,Dbl7,Dbl6,Dbl5,Dbl4,Dbl3,Dbl2,Dbl1,Dbl0,
	Dset,Dback,Dlabel1,Dlabel2,Dlabel3);
// input
input Dwl11,Dwl10,Dwl9, Dwl8, Dwl7, Dwl6, Dwl5, Dwl4, Dwl3, Dwl2, Dwl1, Dwl0;
input Dsl11,Dsl10,Dsl9, Dsl8, Dsl7, Dsl6, Dsl5, Dsl4, Dsl3, Dsl2, Dsl1, Dsl0;
input Dbl11,Dbl10,Dbl9, Dbl8, Dbl7, Dbl6, Dbl5, Dbl4, Dbl3, Dbl2, Dbl1, Dbl0;
input Dset, Dback;
input Dlabel1,Dlabel2,Dlabel3;
// electrical
electrical[11:0] wl,al,bl,al_d_1,al_d_2,al_d_3,bl_d_1,bl_d_2,bl_d_3;
electrical[11:0] sl;
electrical[27:0] o_delta;
electrical sum11, sum10, sum9, sum8, sum7, sum6, sum5, sum4, sum3, sum2, sum1, sum0;
electrical[3:1] error;
electrical al_u;
electrical i_delta;

/////////////////////////////////////////////////////////////////////////////////////////////
// RRAM cell instantiation
// layer1
RRAM_cell L1_11 (.Dback(Dback),
	.i_delta1(o_delta[15]),.i_delta2(o_delta[14]),.i_delta3(o_delta[13]),.i_delta4(o_delta[12]),
	.o_delta(),.wl(wl[11]),.sl(sl[11]),
	.al_u(al_u),.al_d(al_d_1[11]),.bl_u(),.bl_d(bl_d_1[11]));
RRAM_cell L1_21 (.Dback(Dback),
        .i_delta1(o_delta[15]),.i_delta2(o_delta[14]),.i_delta3(o_delta[13]),.i_delta4(o_delta[12]),
        .o_delta(),.wl(wl[11]),.sl(sl[10]),
        .al_u(al_d_1[11]),.al_d(al_d_2[11]),.bl_u(bl_d_1[11]),.bl_d(bl_d_2[11]));
RRAM_cell L1_31 (.Dback(Dback),
        .i_delta1(o_delta[15]),.i_delta2(o_delta[14]),.i_delta3(o_delta[13]),.i_delta4(o_delta[12]),
        .o_delta(),.wl(wl[11]),.sl(sl[9]),
        .al_u(al_d_2[11]),.al_d(al_d_3[11]),.bl_u(bl_d_2[11]),.bl_d(bl_d_3[11]));
RRAM_cell L1_41 (.Dback(Dback),
        .i_delta1(o_delta[15]),.i_delta2(o_delta[14]),.i_delta3(o_delta[13]),.i_delta4(o_delta[12]),
        .o_delta(),.wl(wl[11]),.sl(sl[8]),
        .al_u(al_d_3[11]),.al_d(al[11]),.bl_u(bl_d_3[11]),.bl_d(bl[11]));

RRAM_cell L1_12 (.Dback(Dback),
        .i_delta1(o_delta[11]),.i_delta2(o_delta[10]),.i_delta3(o_delta[9]),.i_delta4(o_delta[8]),
        .o_delta(),.wl(wl[10]),.sl(sl[11]),
        .al_u(al_u),.al_d(al_d_1[10]),.bl_u(),.bl_d(bl_d_1[10]));
RRAM_cell L1_22 (.Dback(Dback),
        .i_delta1(o_delta[11]),.i_delta2(o_delta[10]),.i_delta3(o_delta[9]),.i_delta4(o_delta[8]),
        .o_delta(),.wl(wl[10]),.sl(sl[10]),
        .al_u(al_d_1[10]),.al_d(al_d_2[10]),.bl_u(bl_d_1[10]),.bl_d(bl_d_2[10]));
RRAM_cell L1_32 (.Dback(Dback),
        .i_delta1(o_delta[11]),.i_delta2(o_delta[10]),.i_delta3(o_delta[9]),.i_delta4(o_delta[8]),
        .o_delta(),.wl(wl[10]),.sl(sl[9]),
        .al_u(al_d_2[10]),.al_d(al_d_3[10]),.bl_u(bl_d_2[10]),.bl_d(bl_d_3[10]));
RRAM_cell L1_42 (.Dback(Dback),
        .i_delta1(o_delta[11]),.i_delta2(o_delta[10]),.i_delta3(o_delta[9]),.i_delta4(o_delta[8]),
        .o_delta(),.wl(wl[10]),.sl(sl[8]),
        .al_u(al_d_3[10]),.al_d(al[10]),.bl_u(bl_d_3[10]),.bl_d(bl[10]));

RRAM_cell L1_13 (.Dback(Dback),
        .i_delta1(o_delta[7]),.i_delta2(o_delta[6]),.i_delta3(o_delta[5]),.i_delta4(o_delta[4]),
        .o_delta(),.wl(wl[9]),.sl(sl[11]),
        .al_u(al_u),.al_d(al_d_1[9]),.bl_u(),.bl_d(bl_d_1[9]));
RRAM_cell L1_23 (.Dback(Dback),
        .i_delta1(o_delta[7]),.i_delta2(o_delta[6]),.i_delta3(o_delta[5]),.i_delta4(o_delta[4]),
        .o_delta(),.wl(wl[9]),.sl(sl[10]),
        .al_u(al_d_1[9]),.al_d(al_d_2[9]),.bl_u(bl_d_1[9]),.bl_d(bl_d_2[9]));
RRAM_cell L1_33 (.Dback(Dback),
        .i_delta1(o_delta[7]),.i_delta2(o_delta[6]),.i_delta3(o_delta[5]),.i_delta4(o_delta[4]),
        .o_delta(),.wl(wl[9]),.sl(sl[9]),
        .al_u(al_d_2[9]),.al_d(al_d_3[9]),.bl_u(bl_d_2[9]),.bl_d(bl_d_3[9]));
RRAM_cell L1_43 (.Dback(Dback),
        .i_delta1(o_delta[7]),.i_delta2(o_delta[6]),.i_delta3(o_delta[5]),.i_delta4(o_delta[4]),
        .o_delta(),.wl(wl[9]),.sl(sl[8]),
        .al_u(al_d_3[9]),.al_d(al[9]),.bl_u(bl_d_3[9]),.bl_d(bl[9]));

RRAM_cell L1_14 (.Dback(Dback),
        .i_delta1(o_delta[3]),.i_delta2(o_delta[2]),.i_delta3(o_delta[1]),.i_delta4(o_delta[0]),
        .o_delta(),.wl(wl[8]),.sl(sl[11]),
        .al_u(al_u),.al_d(al_d_1[8]),.bl_u(),.bl_d(bl_d_1[8]));
RRAM_cell L1_24 (.Dback(Dback),
        .i_delta1(o_delta[3]),.i_delta2(o_delta[2]),.i_delta3(o_delta[1]),.i_delta4(o_delta[0]),
        .o_delta(),.wl(wl[8]),.sl(sl[10]),
        .al_u(al_d_1[8]),.al_d(al_d_2[8]),.bl_u(bl_d_1[8]),.bl_d(bl_d_2[8]));
RRAM_cell L1_34 (.Dback(Dback),
        .i_delta1(o_delta[3]),.i_delta2(o_delta[2]),.i_delta3(o_delta[1]),.i_delta4(o_delta[0]),
        .o_delta(),.wl(wl[8]),.sl(sl[9]),
        .al_u(al_d_2[8]),.al_d(al_d_3[8]),.bl_u(bl_d_2[8]),.bl_d(bl_d_3[8]));
RRAM_cell L1_44 (.Dback(Dback),
        .i_delta1(o_delta[3]),.i_delta2(o_delta[2]),.i_delta3(o_delta[1]),.i_delta4(o_delta[0]),
        .o_delta(),.wl(wl[8]),.sl(sl[8]),
        .al_u(al_d_3[8]),.al_d(al[8]),.bl_u(bl_d_3[8]),.bl_d(bl[8]));

//layer2
RRAM_cell L2_11 (.Dback(Dback),
        .i_delta1(o_delta[27]),.i_delta2(o_delta[26]),.i_delta3(o_delta[26]),.i_delta4(i_delta),
        .o_delta(o_delta[15]),.wl(wl[7]),.sl(sum11),
        .al_u(al_u),.al_d(al_d_1[7]),.bl_u(),.bl_d(bl_d_1[7]));
RRAM_cell L2_21 (.Dback(Dback),
	.i_delta1(o_delta[27]),.i_delta2(o_delta[26]),.i_delta3(o_delta[26]),.i_delta4(i_delta),
        .o_delta(o_delta[11]),.wl(wl[7]),.sl(sum10),
        .al_u(al_d_1[7]),.al_d(al_d_2[7]),.bl_u(bl_d_1[7]),.bl_d(bl_d_2[7]));
RRAM_cell L2_31 (.Dback(Dback),
	.i_delta1(o_delta[27]),.i_delta2(o_delta[26]),.i_delta3(o_delta[26]),.i_delta4(i_delta),
        .o_delta(o_delta[7]),.wl(wl[7]),.sl(sum9),
        .al_u(al_d_2[7]),.al_d(al_d_3[7]),.bl_u(bl_d_2[7]),.bl_d(bl_d_3[7]));
RRAM_cell L2_41 (.Dback(Dback),
	.i_delta1(o_delta[27]),.i_delta2(o_delta[26]),.i_delta3(o_delta[26]),.i_delta4(i_delta),
        .o_delta(o_delta[3]),.wl(wl[7]),.sl(sum8),
        .al_u(al_d_3[7]),.al_d(al[7]),.bl_u(bl_d_3[7]),.bl_d(bl[7]));

RRAM_cell L2_12 (.Dback(Dback),
	.i_delta1(o_delta[24]),.i_delta2(o_delta[23]),.i_delta3(o_delta[22]),.i_delta4(i_delta),
        .o_delta(o_delta[14]),.wl(wl[6]),.sl(sum11),
        .al_u(al_u),.al_d(al_d_1[6]),.bl_u(),.bl_d(bl_d_1[6]));
RRAM_cell L2_22 (.Dback(Dback),
	.i_delta1(o_delta[24]),.i_delta2(o_delta[23]),.i_delta3(o_delta[22]),.i_delta4(i_delta),
        .o_delta(o_delta[10]),.wl(wl[6]),.sl(sum10),
        .al_u(al_d_1[6]),.al_d(al_d_2[6]),.bl_u(bl_d_1[6]),.bl_d(bl_d_2[6]));
RRAM_cell L2_32 (.Dback(Dback),
	.i_delta1(o_delta[24]),.i_delta2(o_delta[23]),.i_delta3(o_delta[22]),.i_delta4(i_delta),
        .o_delta(o_delta[6]),.wl(wl[6]),.sl(sum9),
        .al_u(al_d_2[6]),.al_d(al_d_3[6]),.bl_u(bl_d_2[6]),.bl_d(bl_d_3[6]));
RRAM_cell L2_42 (.Dback(Dback),
	.i_delta1(o_delta[24]),.i_delta2(o_delta[23]),.i_delta3(o_delta[22]),.i_delta4(i_delta),
        .o_delta(o_delta[2]),.wl(wl[6]),.sl(sum8),
        .al_u(al_d_3[6]),.al_d(al[6]),.bl_u(bl_d_3[6]),.bl_d(bl[6]));

RRAM_cell L2_13 (.Dback(Dback),
	.i_delta1(o_delta[21]),.i_delta2(o_delta[20]),.i_delta3(o_delta[19]),.i_delta4(i_delta),
        .o_delta(o_delta[13]),.wl(wl[5]),.sl(sum11),
        .al_u(al_u),.al_d(al_d_1[5]),.bl_u(),.bl_d(bl_d_1[5]));
RRAM_cell L2_23 (.Dback(Dback),
	.i_delta1(o_delta[21]),.i_delta2(o_delta[20]),.i_delta3(o_delta[19]),.i_delta4(i_delta),
        .o_delta(o_delta[9]),.wl(wl[5]),.sl(sum10),
        .al_u(al_d_1[5]),.al_d(al_d_2[5]),.bl_u(bl_d_1[5]),.bl_d(bl_d_2[5]));
RRAM_cell L2_33 (.Dback(Dback),
	.i_delta1(o_delta[21]),.i_delta2(o_delta[20]),.i_delta3(o_delta[19]),.i_delta4(i_delta),
        .o_delta(o_delta[5]),.wl(wl[5]),.sl(sum9),
        .al_u(al_d_2[5]),.al_d(al_d_3[5]),.bl_u(bl_d_2[5]),.bl_d(bl_d_3[5]));
RRAM_cell L2_43 (.Dback(Dback),
	.i_delta1(o_delta[21]),.i_delta2(o_delta[20]),.i_delta3(o_delta[19]),.i_delta4(i_delta),
        .o_delta(o_delta[1]),.wl(wl[5]),.sl(sum8),
        .al_u(al_d_3[5]),.al_d(al[5]),.bl_u(bl_d_3[5]),.bl_d(bl[5]));

RRAM_cell L2_14 (.Dback(Dback),
	.i_delta1(o_delta[18]),.i_delta2(o_delta[17]),.i_delta3(o_delta[16]),.i_delta4(i_delta),
        .o_delta(o_delta[12]),.wl(wl[4]),.sl(sum11),
        .al_u(al_u),.al_d(al_d_1[4]),.bl_u(),.bl_d(bl_d_1[4]));
RRAM_cell L2_24 (.Dback(Dback),
        .i_delta1(o_delta[18]),.i_delta2(o_delta[17]),.i_delta3(o_delta[16]),.i_delta4(i_delta),
        .o_delta(o_delta[8]),.wl(wl[4]),.sl(sum10),
        .al_u(al_d_1[4]),.al_d(al_d_2[4]),.bl_u(bl_d_1[4]),.bl_d(bl_d_2[4]));
RRAM_cell L2_34 (.Dback(Dback),
	.i_delta1(o_delta[18]),.i_delta2(o_delta[17]),.i_delta3(o_delta[16]),.i_delta4(i_delta),
        .o_delta(o_delta[4]),.wl(wl[4]),.sl(sum9),
        .al_u(al_d_2[4]),.al_d(al_d_3[4]),.bl_u(bl_d_2[4]),.bl_d(bl_d_3[4]));
RRAM_cell L2_44 (.Dback(Dback),
	.i_delta1(o_delta[18]),.i_delta2(o_delta[17]),.i_delta3(o_delta[16]),.i_delta4(i_delta),
        .o_delta(o_delta[0]),.wl(wl[4]),.sl(sum8),
        .al_u(al_d_3[4]),.al_d(al[4]),.bl_u(bl_d_3[4]),.bl_d(bl[4]));

//layer3
RRAM_cell L3_11 (.Dback(Dback),
        .i_delta1(i_delta),.i_delta2(i_delta),.i_delta3(error[3]),.i_delta4(i_delta),
        .o_delta(o_delta[27]),.wl(wl[3]),.sl(sum7),
        .al_u(al_u),.al_d(al_d_1[3]),.bl_u(),.bl_d(bl_d_1[3]));
RRAM_cell L3_21 (.Dback(Dback),
	.i_delta1(i_delta),.i_delta2(i_delta),.i_delta3(error[3]),.i_delta4(i_delta),
        .o_delta(o_delta[24]),.wl(wl[3]),.sl(sum6),
        .al_u(al_d_1[3]),.al_d(al_d_2[3]),.bl_u(bl_d_1[3]),.bl_d(bl_d_2[3]));
RRAM_cell L3_31 (.Dback(Dback),
	.i_delta1(i_delta),.i_delta2(i_delta),.i_delta3(error[3]),.i_delta4(i_delta),
        .o_delta(o_delta[21]),.wl(wl[3]),.sl(sum5),
        .al_u(al_d_2[3]),.al_d(al_d_3[3]),.bl_u(bl_d_2[3]),.bl_d(bl_d_3[3]));
RRAM_cell L3_41 (.Dback(Dback),
	.i_delta1(i_delta),.i_delta2(i_delta),.i_delta3(error[3]),.i_delta4(i_delta),
        .o_delta(o_delta[18]),.wl(wl[3]),.sl(sum4),
        .al_u(al_d_3[3]),.al_d(al[3]),.bl_u(bl_d_3[3]),.bl_d(bl[3]));

RRAM_cell L3_12 (.Dback(Dback),
	.i_delta1(i_delta),.i_delta2(error[2]),.i_delta3(i_delta),.i_delta4(i_delta),
        .o_delta(o_delta[26]),.wl(wl[2]),.sl(sum7),
        .al_u(al_u),.al_d(al_d_1[2]),.bl_u(),.bl_d(bl_d_1[2]));
RRAM_cell L3_22 (.Dback(Dback),
	.i_delta1(i_delta),.i_delta2(error[2]),.i_delta3(i_delta),.i_delta4(i_delta),
        .o_delta(o_delta[23]),.wl(wl[2]),.sl(sum6),
        .al_u(al_d_1[2]),.al_d(al_d_2[2]),.bl_u(bl_d_1[2]),.bl_d(bl_d_2[2]));
RRAM_cell L3_32 (.Dback(Dback),
	.i_delta1(i_delta),.i_delta2(error[2]),.i_delta3(i_delta),.i_delta4(i_delta),
        .o_delta(o_delta[20]),.wl(wl[2]),.sl(sum5),
        .al_u(al_d_2[2]),.al_d(al_d_3[2]),.bl_u(bl_d_2[2]),.bl_d(bl_d_3[2]));
RRAM_cell L3_42 (.Dback(Dback),
	.i_delta1(i_delta),.i_delta2(error[2]),.i_delta3(i_delta),.i_delta4(i_delta),
        .o_delta(o_delta[17]),.wl(wl[2]),.sl(sum4),
        .al_u(al_d_3[2]),.al_d(al[2]),.bl_u(bl_d_3[2]),.bl_d(bl[2]));

RRAM_cell L3_13 (.Dback(Dback),
	.i_delta1(error[1]),.i_delta2(i_delta),.i_delta3(i_delta),.i_delta4(i_delta),
        .o_delta(o_delta[25]),.wl(wl[1]),.sl(sum7),
        .al_u(al_u),.al_d(al_d_1[1]),.bl_u(),.bl_d(bl_d_1[1]));
RRAM_cell L3_23 (.Dback(Dback),
	.i_delta1(error[1]),.i_delta2(i_delta),.i_delta3(i_delta),.i_delta4(i_delta),
        .o_delta(o_delta[22]),.wl(wl[1]),.sl(sum6),
        .al_u(al_d_1[1]),.al_d(al_d_2[1]),.bl_u(bl_d_1[1]),.bl_d(bl_d_2[1]));
RRAM_cell L3_33 (.Dback(Dback),
	.i_delta1(error[1]),.i_delta2(i_delta),.i_delta3(i_delta),.i_delta4(i_delta),
        .o_delta(o_delta[19]),.wl(wl[1]),.sl(sum5),
        .al_u(al_d_2[1]),.al_d(al_d_3[1]),.bl_u(bl_d_2[1]),.bl_d(bl_d_3[1]));
RRAM_cell L3_43 (.Dback(Dback),
	.i_delta1(error[1]),.i_delta2(i_delta),.i_delta3(i_delta),.i_delta4(i_delta),
        .o_delta(o_delta[16]),.wl(wl[1]),.sl(sum4),
        .al_u(al_d_3[1]),.al_d(al[1]),.bl_u(bl_d_3[1]),.bl_d(bl[1]));

/////////////////////////////////////////////////////////////////////////////////////////////

// Error Calculator
RRAM_error i_error1(.Dlabel(Dlabel1),.sum(sum1),.error(error[1]));
RRAM_error i_error2(.Dlabel(Dlabel2),.sum(sum2),.error(error[2]));
RRAM_error i_error3(.Dlabel(Dlabel3),.sum(sum3),.error(error[3]));

// RRAM sigconv instantiation
RRAM_cell_sigconv L1_sig (
.Dwl({Dwl11,Dwl10,Dwl9,Dwl8}),
.Dsl({Dsl11,Dsl10,Dsl9,Dsl8}),
.Dbl({Dbl11,Dbl10,Dbl9,Dbl8}),
.Dset(Dset),
.wl(wl[11:8]),
.sl(sl[11:8]),
.al(al[11:8]),
.bl(bl[11:8]),
.sum({sum11,sum10,sum9,sum8})
);
RRAM_cell_sigconv L2_sig (
.Dwl({Dwl7,Dwl6,Dwl5,Dwl4}),
.Dsl({Dsl7,Dsl6,Dsl5,Dsl4}),
.Dbl({Dbl7,Dbl6,Dbl5,Dbl4}),
.Dset(Dset),
.wl(wl[7:4]),
.sl(sl[7:4]),
.al(al[7:4]),
.bl(bl[7:4]),
.sum({sum7,sum6,sum5,sum4})
);
RRAM_cell_sigconv L3_sig (
.Dwl({Dwl3,Dwl2,Dwl1,Dwl0}),
.Dsl({Dsl3,Dsl2,Dsl1,Dsl0}),
.Dbl({Dbl3,Dbl2,Dbl1,Dbl0}),
.Dset(Dset),
.wl(wl[3:0]),
.sl(sl[3:0]),
.al(al[3:0]),
.bl(bl[3:0]),
.sum({sum3,sum2,sum1,sum0})
);

analog begin
    V(al_u) <+ 0;
    V(i_delta) <+ 0;
end

endmodule
