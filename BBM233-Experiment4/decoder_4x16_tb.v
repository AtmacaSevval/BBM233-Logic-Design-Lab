`timescale 1ns /1ps

module decoder_4x16_tb;
    reg [3:0] input_stimulus;
    wire [15:0] output_D;
    
    decoder_4x16 UUT(.x(input_stimulus[2]),.y(input_stimulus[1]),.z(input_stimulus[0]),.w(input_stimulus[3]),.output_D(output_D));
    
    //stimule
    initial
     begin
      input_stimulus = 4'b0;
        for(integer i = 0; i<15; i=i+1)begin
            #100 input_stimulus = input_stimulus + 1;  
        end
        #100 $finish;
     end 
endmodule

