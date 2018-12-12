`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:56:56 11/21/2018 
// Design Name: 
// Module Name:    alu 
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
module alu(op_exi,op_exo,npc_ex,Ri_exi,A_ex,B_ex,Imm_ex,Ri_exo,ife_ex,alu_ex,addr_ex);
input  [5:0] op_exi;
output [5:0] op_exo;
input  [31:0]npc_ex;
input  [4:0] Ri_exi;
input  [31:0]A_ex;
input  [31:0]B_ex;
input  [31:0]Imm_ex;
output [4:0] Ri_exo;
output       ife_ex;
output [31:0]alu_ex;
output [31:0]addr_ex;

wire [4:0] Ri_exo;
wire [31:0]alu_ex;
wire [31:0]addr_ex;
wire       ife_ex;

assign Ri_exo  = Ri_exi;
assign alu_ex  = op_exi == 6'b000000 ? A_ex + B_ex:
				 op_exi == 6'b000001 ? A_ex - B_ex:
				 op_exi == 6'b000010 ? A_ex & B_ex:
				 op_exi == 6'b000011 ? A_ex | B_ex:
				 op_exi == 6'b000100 ? A_ex ^ B_ex:
				 op_exi == 6'b000101 ? (A_ex < B_ex): //STL
				 op_exi == 6'b010000 ? A_ex:       //SW
				 op_exi == 6'b100000 ? A_ex^B_ex:     //BEQ 
				 32'h0000_0000;
				 
assign addr_ex = op_exi == 6'b010000 ? B_ex + Imm_ex: //SW      
				 op_exi == 6'b010001 ? B_ex + Imm_ex: //LW
				 op_exi == 6'b100000 ? Imm_ex+npc_ex: //BEQ 
				 op_exi == 6'b100001 ? Imm_ex:     //JMP
                 32'h0000_0000;
assign ife_ex  = (op_exi==6'b100000 && alu_ex==0) ? 1:0;//BEQ
assign op_exo  = op_exi;
endmodule
