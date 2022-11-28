*
.MODEL a2d_default A2D MODE=std_logic vth=0.5
.MODEL d2a_default D2A MODE=std_logic vlo=0.0 vhi=1.0 trise=1p tfall=1p
.DEFHOOK a2d_default d2a_default

.MODEL RRAM_unit_tb MACRO LANG=veriloga LIB=RRAM_lib
.MODEL RRAM_unit MACRO LANG=veriloga LIB=RRAM_lib

Y_RRAMstim tb_RRAM_control
+PORT: clk set learn reset

Y_RRAMcell RRAM_control
+PORT: clk set learn reset


.TRAN 0 100000ns
.PLOT TRAN V(clk) V(set) V(learn) V(reset)
.end
