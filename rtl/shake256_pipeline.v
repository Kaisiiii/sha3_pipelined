`include "keccak_permutation.v"
`include "pad.v"
module shake256_pipeline(
    input clk,
    input rstn,
    input en,
    input [10 : 0] len,
    input [3 : 0] block_num, 
    input [1087 : 0] s_in,

    output [255 : 0] hash,
    output done,
    output reg busy
);

reg [1599 : 0] r0, r1, r2, r3, r4;
reg [1599 : 0] s_in_0;
wire [1087 : 0] s_in_pad;
wire [1599 : 0] stage0, stage01, stage1, stage2, stage3;
wire [1599 : 0] stage4, stage5, stage6, stage7;
wire [1599 : 0] stage8, stage9, stage10,stage11;

wire [12 : 0] rdy;



keccak_permutation#(7'b0000001, 7'b0011010) f0 (.clk(clk),.rstn(rstn),.en(en),     .s_in ({s_in_pad,512'b0}),.s_out(stage0),.rdy(rdy[0]));
keccak_permutation#(7'b1011110, 7'b1110000) f1 (.clk(clk),.rstn(rstn),.en(rdy[0]), .s_in (stage0),.s_out(stage1),.rdy(rdy[1]));
keccak_permutation#(7'b0011111, 7'b0100001) f2 (.clk(clk),.rstn(rstn),.en(rdy[1]), .s_in (stage1),.s_out(stage2),.rdy(rdy[2]));
keccak_permutation#(7'b1111001, 7'b1010101) f3 (.clk(clk),.rstn(rstn),.en(rdy[2]), .s_in (stage2),.s_out(stage3),.rdy(rdy[3]));
keccak_permutation#(7'b0001110, 7'b0001100) f4 (.clk(clk),.rstn(rstn),.en(rdy[3]), .s_in (stage3),.s_out(stage4),.rdy(rdy[4]));
keccak_permutation#(7'b0110101, 7'b0100110) f5 (.clk(clk),.rstn(rstn),.en(rdy[4]), .s_in (stage4),.s_out(stage5),.rdy(rdy[5]));
keccak_permutation#(7'b0111111, 7'b1001111) f6 (.clk(clk),.rstn(rstn),.en(rdy[5]), .s_in (stage5),.s_out(stage6),.rdy(rdy[6]));
keccak_permutation#(7'b1011101, 7'b1010011) f7 (.clk(clk),.rstn(rstn),.en(rdy[6]), .s_in (stage6),.s_out(stage7),.rdy(rdy[7]));
keccak_permutation#(7'b1010010, 7'b1001000) f8 (.clk(clk),.rstn(rstn),.en(rdy[7]), .s_in (stage7),.s_out(stage8),.rdy(rdy[8]));
keccak_permutation#(7'b0010110, 7'b1100110) f9 (.clk(clk),.rstn(rstn),.en(rdy[8]), .s_in (stage8),.s_out(stage9),.rdy(rdy[9]));
keccak_permutation#(7'b1111001, 7'b1011000) f10(.clk(clk),.rstn(rstn),.en(rdy[9]), .s_in (stage9),.s_out(stage10),.rdy(rdy[10]));
keccak_permutation#(7'b0100001, 7'b1110100) f11(.clk(clk),.rstn(rstn),.en(rdy[10]),.s_in (stage10),.s_out(stage11),.rdy(rdy[11]));

assign done = rdy[11];
assign hash = stage11[1599 -: 256];

wire [1087 : 0] dont_care;
pad pad_u0(
    .data_in(s_in),
    .data_length(len),
    .data_out(s_in_pad),
    .data_next(dont_care)
);

endmodule