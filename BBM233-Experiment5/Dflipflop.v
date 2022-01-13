`timescale 1ns / 1ps


module Dflipflop(D, Clk,  Q);

    output reg  Q; //next
    input  D, Clk;  


    always @(posedge Clk) 
        begin
            Q <= D;
        end 

endmodule

