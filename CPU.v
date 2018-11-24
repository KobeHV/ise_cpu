`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:59:32 11/21/2018 
// Design Name: 
// Module Name:    CPU 
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
module CPU(rst,clk,PC);

input rst;
input clk;
output [31:0]PC;
//fetch module
wire pc_update;
wire [31:0]pc_new;
//wire [31:0]PC;

wire [31:0]ir_o;
wire [31:0]npc;
fetch Fetch(rst,clk,ir_o,npc,pc_update,pc_new,PC);

//decode module
wire reg_update;
wire[31:0]reg_new;

wire [5:0]op;
wire [31:0]A;
wire [31:0]B;
wire [31:0]Imm;
decode Decode(clk,ir_o,op,A,B,Imm,reg_update,reg_new);

//alu module
wire ife;
wire [31:0]alu_o;
wire [31:0]addr_o;
alu Alu(op,npc,A,B,Imm,ife,alu_o,addr_o);

//v_memory module
wire [31:0]write_o;
v_memory Memory(clk,op,alu_o,addr_o,write_o);

//write module
write Write(ife,op,write_o,reg_update,reg_new,pc_update,pc_new);

endmodule

