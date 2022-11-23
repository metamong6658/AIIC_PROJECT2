`include "disciplines.h"
module RRAM_unit(Dwl5,Dwl4,Dwl3,Dwl2,Dwl1,Dwl0,Dsl5,Dsl4,Dsl3,Dsl2,Dsl1,Dsl0,Dbl5,Dbl4,Dbl3,Dbl2,Dbl1,Dbl0,Dset,Dback,Dlabel);
// input
input Dwl5, Dwl4, Dwl3, Dwl2, Dwl1, Dwl0;
input Dsl5, Dsl4, Dsl3, Dsl2, Dsl1, Dsl0;
input Dbl5, Dbl4, Dbl3, Dbl2, Dbl1, Dbl0;
input Dset, Dback, Dlabel;
// electrical
electrical[5:0] wl,al,bl,al_d,bl_d;
electrical[5:0] sl;
electrical[5:0] o_delta;
electrical sum5, sum4, sum3, sum2, sum1, sum0;
electrical error;
electrical al_u, i_delta;
// RRAM cell instantiation
RRAM_cell L1_11 (.Dback(Dback),.i_delta1(o_delta[3]),.i_delta2(o_delta[2]),.o_delta(),.wl(wl[5]),.sl(sl[5]),.al_u(al_u),.al_d(al_d[5]),.bl_u(),.bl_d(bl_d[5]));
RRAM_cell L1_12 (.Dback(Dback),.i_delta1(o_delta[1]),.i_delta2(o_delta[0]),.o_delta(),.wl(wl[4]),.sl(sl[5]),.al_u(al_u),.al_d(al_d[4]),.bl_u(),.bl_d(bl_d[4]));
RRAM_cell L1_21 (.Dback(Dback),.i_delta1(o_delta[3]),.i_delta2(o_delta[2]),.o_delta(),.wl(wl[5]),.sl(sl[4]),.al_u(al_d[5]),.al_d(al[5]),.bl_u(bl_d[5]),.bl_d(bl[5]));
RRAM_cell L1_22 (.Dback(Dback),.i_delta1(o_delta[1]),.i_delta2(o_delta[0]),.o_delta(),.wl(wl[4]),.sl(sl[4]),.al_u(al_d[4]),.al_d(al[4]),.bl_u(bl_d[4]),.bl_d(bl[4]));

RRAM_cell L2_11 (.Dback(Dback),.i_delta1(o_delta[5]),.i_delta2(i_delta),.o_delta(o_delta[3]),.wl(wl[3]),.sl(sum5),.al_u(al_u),.al_d(al_d[3]),.bl_u(),.bl_d(bl_d[3]));
RRAM_cell L2_12 (.Dback(Dback),.i_delta1(o_delta[4]),.i_delta2(i_delta),.o_delta(o_delta[2]),.wl(wl[2]),.sl(sum5),.al_u(al_u),.al_d(al_d[2]),.bl_u(),.bl_d(bl_d[2]));
RRAM_cell L2_21 (.Dback(Dback),.i_delta1(o_delta[5]),.i_delta2(i_delta),.o_delta(o_delta[1]),.wl(wl[3]),.sl(sum4),.al_u(al_d[3]),.al_d(al[3]),.bl_u(bl_d[3]),.bl_d(bl[3]));
RRAM_cell L2_22 (.Dback(Dback),.i_delta1(o_delta[4]),.i_delta2(i_delta),.o_delta(o_delta[0]),.wl(wl[2]),.sl(sum4),.al_u(al_d[2]),.al_d(al[2]),.bl_u(bl_d[2]),.bl_d(bl[2]));

RRAM_cell L3_11 (.Dback(Dback),.i_delta1(error),.i_delta2(i_delta),.o_delta(o_delta[5]),.wl(wl[1]),.sl(sum3),.al_u(al_u),.al_d(al_d[1]),.bl_u(),.bl_d(bl_d[1]));
RRAM_cell L3_21 (.Dback(Dback),.i_delta1(error),.i_delta2(i_delta),.o_delta(o_delta[4]),.wl(wl[1]),.sl(sum2),.al_u(al_d[1]),.al_d(al[1]),.bl_u(bl_d[1]),.bl_d(bl[1]));

// Error Calculator
RRAM_error i_error(.Dlabel(Dlabel),.sum(al[1]),.error(error));

// RRAM sigconv instantiation
RRAM_cell_sigconv L1_sig (
.Dwl({Dwl5,Dwl4}),
.Dsl({Dsl5,Dsl4}),
.Dbl({Dbl5,Dbl4}),
.Dset(Dset),
.wl(wl[5:4]),
.sl(sl[5:4]),
.al(al[5:4]),
.bl(bl[5:4]),
.sum({sum5,sum4})
);
RRAM_cell_sigconv L2_sig (
.Dwl({Dwl3,Dwl2}),
.Dsl({Dsl3,Dsl2}),
.Dbl({Dbl3,Dbl2}),
.Dset(Dset),
.wl(wl[3:2]),
.sl(sl[3:2]),
.al(al[3:2]),
.bl(bl[3:2]),
.sum({sum3,sum2})
);
RRAM_cell_sigconv L3_sig (
.Dwl({Dwl1,Dwl0}),
.Dsl({Dsl1,Dsl0}),
.Dbl({Dbl1,Dbl0}),
.Dset(Dset),
.wl(wl[1:0]),
.sl(sl[1:0]),
.al(al[1:0]),
.bl(bl[1:0]),
.sum({sum1,sum0})
);

analog begin
    V(al_u) <+ 0;
    V(i_delta) <+ 0;
end

endmodule
