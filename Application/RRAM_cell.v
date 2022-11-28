`include "disciplines.h"
module RRAM_cell(Dback,i_delta1,i_delta2,i_delta3,i_delta4,
	o_delta,wl,sl,al_u,al_d,bl_u,bl_d);  //weight_out);
// input
input Dback;
// real
real Icp = 0;
real Icp_out = 0;
real vdd=1.0;
real Gp_time, Gp_time_start;
real lr = 0.1;
real delta = 0;
// electrical
electrical i_delta1, i_delta2, i_delta3, i_delta4, 
           o_delta, wl, sl, al_u, al_d, bl_u, bl_d;
// analog
analog begin
        @(cross (V(bl_d)-1.5*vdd)) begin // Set
                if(V(wl)>0.5*vdd && V(bl_d)>1.5*vdd) // wl : 1V, bl : 1.5V+
                        Gp_time_start=$abstime;
                else if(V(wl)>0.5*vdd && V(bl_d)<=1.5*vdd) begin // wl : 1V, bl : 1.5V-
                        Gp_time = $abstime - Gp_time_start;
                        Icp =  0.1 * Gp_time/10e-9;
                end
        end

        @(cross (V(bl_d)-0.5*vdd)) begin // back operation
                if(Dback && V(bl_d) > 0.5*vdd && V(wl) > 0.5*vdd) begin
                        delta = (V(i_delta1) + V(i_delta2)+V(i_delta3)+V(i_delta4))* V(sl) * (1.0 - V(sl)) * Icp;
                        Icp = Icp - lr * (V(i_delta1) + V(i_delta2)+V(i_delta3)+V(i_delta4)) * V(sl);
                end
        end

        if (V(wl)>0.5*vdd) begin // on mode
                Icp_out= Icp*V(sl);
        end
        else if (V(wl)<0.5*vdd) begin // Reset
                Icp_out = 0;
                Icp = 0;
                delta = 0;
        end

        V(al_d) <+ Icp_out + V(al_u);
        V(bl_u) <+ V(bl_d);
        V(o_delta) <+ delta;
end
endmodule


