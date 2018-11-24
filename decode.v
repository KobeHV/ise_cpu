`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:56:19 11/21/2018 
// Design Name: 
// Module Name:    decode 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module decode(clk,ir_i,op,A,B,Imm,reg_update,reg_i);

input clk;
input [31:0]ir_i;
input reg_update;
input [31:0]reg_i;
output [5:0]op;
output [31:0]A;
output [31:0]B;
output [31:0]Imm;


// 32
reg [31:0]Regs [31:0];
initial
begin
    Regs[0] = 2;
    Regs[1] = 3;
    Regs[2] = 4;
    Regs[3] = 0;
	Regs[4] = 3;
end

wire [4:0]Ri;
wire [4:0]Rj;
wire [4:0]Rk;
wire [5:0]op;
wire [31:0]A;
wire [31:0]B;
wire [31:0]Imm;
assign Ri = ir_i[25:21];
assign Rj = ir_i[20:16];
assign Rk = ir_i[15:11];

assign op = ir_i[31:26];

assign A =  op == 6'b100001 ? 0:   //JMP
			op == 6'b100000 ? Regs[Ri] ^ Regs[Rj]:  //BEQ，结果为0则跳转
			Regs[Rj];
assign B =  (op[5:4] == 2'b00) ? Regs[Rk] : 
			Regs[Ri];//SW
assign Imm = op == 6'b100001 ? ir_i[25:0] : //JMP
	   ir_i[15:0];//BEQ

always @(negedge clk)
begin
    if (reg_update)
		begin
			Regs[Ri] <= reg_i;
		end
end 

endmodule