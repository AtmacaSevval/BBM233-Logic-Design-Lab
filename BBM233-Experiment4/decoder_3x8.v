`timescale 1ns / 1ps


module decoder_3x8(
    //inputs
    input A,
    input B,
    input C,
    input En,//enable
    //outputs
    output [7:0]D
    );// behavoral 
    assign D[0]= En & ~A & ~B & ~C;
    assign D[1]= En & ~A & ~B & C;
    assign D[2]= En & ~A & B & ~C;
    assign D[3]= En & ~A & B & C;
    assign D[4]= En & A & ~B & ~C;
    assign D[5]= En & A & ~B & C;
    assign D[6]= En & A & B & ~C;
    assign D[7]= En & A & B & C;
endmodule

