`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:48:39 12/12/2018 
// Design Name: 
// Module Name:    ID_EX 
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
module ID_EX(clk,op_id,A_id,B_id,Imm_id,op_ex,A_ex,B_ex,Imm_ex,npc_id,npc_ex,Ri_id,Ri_ex);
input             clk;
input        [5:0]op_id;
input       [31:0]A_id;
input       [31:0]B_id;
input       [31:0]Imm_id;
output reg   [5:0]op_ex;
output reg  [31:0]A_ex;
output reg  [31:0]B_ex;
output reg  [31:0]Imm_ex;
input       [31:0]npc_id;
output reg  [31:0]npc_ex;
input       [31:0]Ri_id;
output reg  [4:0] Ri_ex;

always @(posedge clk)
begin 
	op_ex  <=op_id;
	A_ex   <=A_id;
	B_ex   <=B_id;
	Imm_ex <=Imm_id;
	npc_ex <=npc_id;
	Ri_ex  <=Ri_id;	
end

endmodule