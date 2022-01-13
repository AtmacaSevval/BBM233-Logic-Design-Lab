`timescale 1ns / 1ps

module decoder_3x8_tb;
    //inputs
    reg [2:0] input_stimuli;
    reg En;
    //outputs
    wire [7:0]D;
    
    decoder_3x8 UUT( .A(input_stimuli[2]),.B(input_stimuli[1]),.C(input_stimuli[0]),.En(En),.D(D));
    //stimuli
    initial
     begin
      En=1'b0; input_stimuli = 3'b0;
      #100 En=1'b0; input_stimuli = 3'b001;
      #100 En=1'b1; input_stimuli = 3'b0;
        for(integer i = 0; i<7; i=i+1)begin
            #100 En = 1'b1 ;input_stimuli = input_stimuli + 1;  
        end
        #100 $finish;
     end       
endmodule

