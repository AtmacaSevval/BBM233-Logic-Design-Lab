`timescale 1ns / 1ps



module controller_tb;
    reg[1:0] M;//input
    reg clock;
    reg reset;
    wire[1:0] out;
    
    controller UUT(.M(M), .clock(clock), .reset(reset), .out(out));
    
    initial begin
        clock = 0;
        forever begin
            #10;//clock is changing in every 10 ns
            clock = ~clock;
        end
    end
    
    initial begin
        reset   = 1'b1;
        #50;
        reset = 1'b0;
        #100;
    end

       
    initial begin
        M= 2'b00;
        #50 M= 2'b00;
        #50; M=2'b10;
        #50 M= 2'b00;
        #20; M=2'b01;
        #50; M=2'b11;
        #50 M= 2'b10;
        #50; M=2'b11;
        #50; M=2'b01;
    end

endmodule
