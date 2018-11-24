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
module alu(op,npc,A,B,Imm,ife,alu_o,addr_o);
input [5:0]op;
input [31:0]npc;
input [31:0]A;
input [31:0]B;
input [31:0]Imm;
output ife;
output [31:0]alu_o;
output [31:0]addr_o;

wire ife;
wire [31:0]alu_o;
wire [31:0]addr_o;

assign alu_o  =  op == 6'b000000 ? A + B:
				 op == 6'b000001 ? A - B:
				 op == 6'b000010 ? A & B:
				 op == 6'b000011 ? A | B:
				 op == 6'b000100 ? A ^ B:
				 op == 6'b000101 ? (A < B):      //STL
				 op == 6'b010000 ? B:          //SW
				 32'h0000_0000;
				 
assign addr_o =  op == 6'b010000 ? A + Imm:    //SW      
				 op == 6'b010001 ? A + Imm:    //LW
				 op == 6'b100000 ? Imm: //BEQ !!!!!!!!!!when << add ()!!!!!!!!!!
				 op == 6'b100001 ? Imm: //JMP
                 32'h0000_0000;
				 
assign ife =  (op==6'b100000 && A==0) ? 1:0;//BEQ

endmodule
