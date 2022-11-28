`include "disciplines.h"
module RRAM_error(Dlabel,sum,error);
// input
input Dlabel;
// electrical
electrical sum, error;
// analog
analog begin
    V(error) <+ (V(sum) - Dlabel) * (V(sum)) * (1-V(sum));
end
endmodule

