`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:50:48 12/12/2018 
// Design Name: 
// Module Name:    EX_MEM 
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
module EX_MEM(clk,op_ex,op_mem,alu_ex,addr_ex,ife_ex,Ri_ex,alu_mem,addr_mem,ife_mem,Ri_mem);
input             clk;
input       [5:0] op_ex;
output reg  [5:0] op_mem;
input      [31:0] alu_ex;
input      [31:0] addr_ex;
input             ife_ex;
input       [4:0] Ri_ex;
output reg [31:0] alu_mem;
output reg [31:0] addr_mem;
output reg        ife_mem;
output reg  [4:0] Ri_mem;
always @(posedge clk)
begin 
	op_mem   <=op_ex;
	alu_mem  <=alu_ex;
	addr_mem <=addr_ex;
	ife_mem  <=ife_ex;
	Ri_mem   <=Ri_ex;
end


endmodule