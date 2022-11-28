module control (clk, set, learn, Xin0, Xin1, Xin2, Xin3, Xin4, Xin5, Xin6,
	Dwl11,Dwl10,Dwl9,Dwl8,Dwl7,Dwl6,Dwl5,Dwl4,Dwl3,Dwl2,Dwl1,Dwl0,
	Dsl11,Dsl10,Dsl9,Dsl8,Dsl7,Dsl6,Dsl5,Dsl4,Dsl3,Dsl2,Dsl1,Dsl0,
	Dbl11,Dbl10,Dbl9,Dbl8,Dbl7,Dbl6,Dbl5,Dbl4,Dbl3,Dbl2,Dbl1,Dbl0,
	Dset,Dback,Dlabel0,Dlabel1,Dlabel2,write_en);

input clk, set, learn;
input Xin0, Xin1, Xin2, Xin3, Xin4, Xin5, Xin6;

output reg Dwl11,Dwl10,Dwl9, Dwl8, Dwl7, Dwl6, Dwl5, Dwl4, Dwl3, Dwl2, Dwl1, Dwl0;
output Dsl11, Dsl10, Dsl9, Dsl8;
output reg Dsl7, Dsl6, Dsl5, Dsl4, Dsl3, Dsl2, Dsl1, Dsl0;
output reg Dbl11,Dbl10,Dbl9, Dbl8, Dbl7, Dbl6, Dbl5, Dbl4, Dbl3, Dbl2, Dbl1, Dbl0;
output reg Dset, Dback;
output Dlabel0,Dlabel1,Dlabel2;
output reg write_en;


reg train_start;
reg update_start;
reg input_delay;
reg [1:0] pstate, nstate;
reg [2:0] update;
reg [15:0] trained_num;
parameter s0 = 2'b00;
parameter s1 = 2'b01;
parameter s2 = 2'b10;
parameter s3 = 2'b11;

parameter train_num = 1000; // set train repeat num

assign Dsl11 = Xin6;
assign Dsl10 = Xin5;
assign Dsl9 = Xin4;
assign Dsl8 = Xin3;
assign Dlabel2 = Xin2;
assign Dlabel1 = Xin1;
assign Dlabel0 = Xin0;

initial begin
    Dwl0 = 0;   Dwl1 = 0;   Dwl2 = 0;   Dwl3 = 0;   Dwl4 = 0;   Dwl5 = 0;   
    Dwl6 = 0;   Dwl7 = 0;   Dwl8 = 0;   Dwl9 = 0;   Dwl10 = 0;   Dwl11 = 0;
    Dset = 0;   Dback = 0;  
    // Dlabel0 = 0;   Dlabel1 = 0;   Dlabel2 = 0;
    Dbl0 = 0;   Dbl1 = 0;   Dbl2 = 0;   Dbl3 = 0;   Dbl4 = 0;   Dbl5 = 0;   
    Dbl6 = 0;   Dbl7 = 0;   Dbl8 = 0;   Dbl9 = 0;   Dbl10 = 0;   Dbl11 = 0;
    Dsl0 = 0;   Dsl1 = 0;   Dsl2 = 0;   Dsl3 = 0;   Dsl4 = 0;   Dsl5 = 0;   
    Dsl6 = 0;   Dsl7 = 0;   
    //Dsl8 = 0;   Dsl9 = 0;   Dsl10 = 0;   Dsl11 = 0;
    // Transistor ON    
    Dwl0 = 1;   Dwl1 = 1;   Dwl2 = 1;   Dwl3 = 1;   Dwl4 = 1;   Dwl5 = 1;   
    Dwl6 = 1;   Dwl7 = 1;   Dwl8 = 1;   Dwl9 = 1;   Dwl10 =1;   Dwl11 = 1;
    pstate = s1;
    trained_num = 0;
    train_start = 0;
    update = 0;
    update_start = 0;
    write_en = 0;
    input_delay = 0;

end

always @(posedge clk) begin
    pstate <= nstate;
    input_delay <= write_en;

    if(update_start) update <= update + 1;
    
    
end

always @(pstate or set or learn or update or input_delay) begin
    case (pstate)
        // Initialization
        s0 : begin
            Dset <= 1;
            Dbl0 <= 1;   Dbl1 <= 1;   Dbl2 <= 1;   Dbl3 <= 1;   Dbl4 <= 1;   Dbl5 <= 1;   
            Dbl6 <= 1;   Dbl7 <= 1;   Dbl8 <= 1;   Dbl9 <= 1;   Dbl10 <= 1;   Dbl11 <= 1;
            if(!set) nstate <= s1;
        end
        // Feed-foward
        s1 : begin
            Dset <= 0;
            Dbl0 <= 0;   Dbl1 <= 0;   Dbl2 <= 0;   Dbl3 <= 0;   Dbl4 <= 0;   Dbl5 <= 0;   
            Dbl6 <= 0;   Dbl7 <= 0;   Dbl8 <= 0;   Dbl9 <= 0;   Dbl10 <= 0;   Dbl11 <= 0;
            //Dsl11 <= 1;   Dsl10 <= 1;   Dsl9 <= 1;   Dsl8 <= 1; // 4 input
            //Dsl11 <= Xin0;   Dsl10 <= Xin1;   Dsl9 <= Xin2;   Dsl8 <= Xin3; // 4 input
            update <= 0;
            if(learn) begin
                train_start <= 1;
            end 
            if(train_start)begin
                write_en <= 1;
            end
            if(input_delay)begin
                nstate <= s2;
                write_en <= 0;
            end

            if(set)nstate <= s0;

        end
        // Error Calculation
        s2 : begin
            // Dlabel <= 1;    //input label
            nstate <= s3;
        end
        // Weight Update
        s3:
        begin
            case (update)
                0 : begin
                    Dback <= 1;
                    Dbl0 <= 1;   Dbl1 <= 1;   Dbl2 <= 1;   Dbl3 <= 1;   Dbl4 <= 0;   Dbl5 <= 0;   
                    Dbl6 <= 0;   Dbl7 <= 0;   Dbl8 <= 0;   Dbl9 <= 0;   Dbl10 <= 0;   Dbl11 <= 0;
                    update_start <= 1;
                end
                1 : begin
                    Dbl0 <= 1;   Dbl1 <= 1;   Dbl2 <= 1;   Dbl3 <= 1;   Dbl4 <= 1;   Dbl5 <= 1;   
                    Dbl6 <= 1;   Dbl7 <= 1;   Dbl8 <= 0;   Dbl9 <= 0;   Dbl10 <= 0;   Dbl11 <= 0;
                end
                2 : begin
                    Dbl0 <= 1;   Dbl1 <= 1;   Dbl2 <= 1;   Dbl3 <= 1;   Dbl4 <= 1;   Dbl5 <= 1;   
                    Dbl6 <= 1;   Dbl7 <= 1;   Dbl8 <= 1;   Dbl9 <= 1;   Dbl10 <= 1;   Dbl11 <= 1;  
                end 
                3 : begin
                    Dbl0 <= 0;   Dbl1 <= 0;   Dbl2 <= 0;   Dbl3 <= 0;   Dbl4 <= 0;   Dbl5 <= 0;   
                    Dbl6 <= 0;   Dbl7 <= 0;   Dbl8 <= 0;   Dbl9 <= 0;   Dbl10 <= 0;   Dbl11 <= 0; 

                end
                4 : begin
                    Dback <= 0;
                    nstate <= s1;
                    update_start <= 0;

                    if(train_num == (trained_num + 1)) begin
                    train_start <= 0;
                    trained_num <= 0;
                    end
                    else begin
                        trained_num <= trained_num + 1;
                    end
                end
            endcase

        end
        default : nstate <= s1;

    endcase


end

endmodule
