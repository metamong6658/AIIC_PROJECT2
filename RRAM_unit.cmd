*
.MODEL a2d_default A2D MODE=std_logic vth=0.5
.MODEL d2a_default D2A MODE=std_logic vlo=0.0 vhi=1.0 trise=1p tfall=1p
.DEFHOOK a2d_default d2a_default

.MODEL RRAM_unit_tb MACRO LANG=veriloga LIB=RRAM_lib
.MODEL RRAM_unit MACRO LANG=veriloga LIB=RRAM_lib

Y_RRAMstim RRAM_unit_tb
+PORT: Dwl5 Dwl4 Dwl3 Dwl2 Dwl1 Dwl0 Dsl5 Dsl4 Dsl3 Dsl2 Dsl1 Dsl0 Dbl5 Dbl4 Dbl3 Dbl2 Dbl1 Dbl0 Dset Dback Dlabel

Y_RRAMcell RRAM_unit
+PORT: Dwl5 Dwl4 Dwl3 Dwl2 Dwl1 Dwl0 Dsl5 Dsl4 Dsl3 Dsl2 Dsl1 Dsl0 Dbl5 Dbl4 Dbl3 Dbl2 Dbl1 Dbl0 Dset Dback Dlabel


.TRAN 0 150ns
.PLOT TRAN V(Dwl5) V(Dwl4) V(Dwl3) V(Dwl2) V(Dwl1) V(Dwl0) V(Dsl5) V(Dsl4) V(Dsl3) V(Dsl2) V(Dsl1) V(Dsl0) V(Dbl5) V(Dbl4) V(Dbl3) V(Dbl2) V(Dbl1) V(Dbl0) V(Dset) V(Dback) V(Dlabel)
.end