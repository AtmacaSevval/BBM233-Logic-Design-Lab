`timescale 1ns / 1ps
`include "decoder_3x8.v"

module decoder_4x16(
    //inputs
    input x,
    input y,
    input z,
    input w,
    
    //outputs
    output [15:0]output_D
    );
    //two decoders
    decoder_3x8 A1(.A(x), .B(y), .C(z), .En(~w), .D(output_D[7:0]));
    decoder_3x8 A2(.A(x), .B(y), .C(z), .En(w), .D(output_D[15:8]));
endmodule
