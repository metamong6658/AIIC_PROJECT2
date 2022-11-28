module input_allocation (clk, reset, write_en, Xout6, Xout5, Xout4, Xout3, Xout2, Xout1, Xout0);
    
    input clk, reset, write_en;
    output Xout6, Xout5, Xout4, Xout3, Xout2, Xout1, Xout0; //4bit Input allocation
    
    // reg first;
    reg [6:0] x_memory[0:999]; //save 6bit * 1152 Input
    integer i = 0;
    reg [6:0] Xout;
    // integer j = 0;
    
    initial begin
        $readmemb("traindata.txt", x_memory);
        Xout <= 0;
    
    end

    assign Xout0 = Xout[0]; //label0
    assign Xout1 = Xout[1]; //label1
    assign Xout2 = Xout[2]; //label2
    assign Xout3 = Xout[3]; //input0
    assign Xout4 = Xout[4]; //input1
    assign Xout5 = Xout[5]; //input2
    assign Xout6 = Xout[6]; //input3

    always @(posedge clk) begin
        if (reset)begin
            Xout  <= 0;
            // first <= 1;
        end
        else begin
            if (write_en == 1) begin
                
                // if (first) begin
                //     first <= 0;
                //     $readmemh("FC_1_i.txt",x_memory,0,1151);
                // end

                    
                    
                    //output neuron input allocation end
                    //neuron num : 1152
                    if (i == 999)begin
                        //i = 0;
                        Xout <= 0;
                    end
                    else begin
                        Xout <= x_memory[i];
                        i    <= i + 1;
                    end
                
            end
        end
        
        
    end
endmodule
