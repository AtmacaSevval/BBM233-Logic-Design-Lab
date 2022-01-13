`timescale 1ns / 1ps
`include "Dflipflop.v"

module controller(
    input[1:0] M,//two inputs (x and y)
    input clock,
    input reset,
    output[1:0] out
    );
    
    reg[1:0] state = 2'b00;
    wire[1:0] next_state;
    wire[1:0] state1;
    wire t, t1;
    wire t2, t3, t4;
    
    and G1(t, ~state[1], state[0]);
    and G2(t1, state[1], M[1]);
    or G3(state1[1], t, t1);//state1
    
    and G4(t2, state[0], ~state[1], M[0]);
    and G5(t3, ~state[0], ~state[1], M[1]);
    and G6(t4, M[1], M[0]);
    or G7(state1[0] , t2, t3, t4);//state0
    
    Dflipflop D1(.D(state1[1]) ,.Clk(clock), .Q(next_state[1]));
    Dflipflop D0(.D(state1[0]) ,.Clk(clock), .Q(next_state[0]));
    
    always@ (reset or next_state) begin
        if(reset) begin state <= 2'b00; end
        else begin state<= next_state;end
    end
    
    or G8(out[1], t, t1);//output1
    or G9(out[0] , t2, t3, t4);//output0


endmodule

