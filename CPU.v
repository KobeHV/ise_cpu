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
input        rst;
input        clk;
output [31:0]PC;

//IF
wire [31:0]ir_if;
wire [31:0]npc_if;
wire       pc_update;
wire [31:0]pc_new;
fetch Fetch(rst,clk,ir_if,npc_if,pc_update,pc_new,PC);

//ID
wire [31:0]ir_id;
wire [31:0]npc_idi;
wire [5:0] op_id;
wire [31:0]A_id;
wire [31:0]B_id;
wire [31:0]Imm_id;
wire [31:0]npc_ido;
wire [4:0] Ri_id;
wire       reg_update;
wire [31:0]reg_new;
wire [4:0] Ri_in;
//IF/ID
always @(posedge clk)
begin
	
end
decode Decode(clk,ir_id,npc_idi,op_id,A_id,B_id,Imm_id,npc_ido,Ri_id,reg_update,reg_new,Ri_in);

//EX
wire [5:0] op_ex;
wire [31:0]npc_ex;
wire [4:0] Ri_exi;
wire [31:0]A_ex;
wire [31:0]B_ex;
wire [31:0]Imm_ex;
wire [4:0] Ri_exo;
wire       ife_ex;
wire [31:0]alu_ex;
wire [31:0]addr_ex;
alu Alu(op_ex,npc_ex,Ri_exi,A_ex,B_ex,Imm_ex,Ri_exo,ife_ex,alu_ex,addr_ex);

//MEM
wire [5:0] op_mem;
wire [31:0]alu_mem;
wire [31:0]addr_mem;
wire       ife_memi;
wire [4:0] Ri_memi;
wire       ife_memo;
wire[4:0]  Ri_memo;
wire [31:0]write_mem;
v_memory Memory(clk,op_mem,alu_mem,addr_mem,ife_memi,Ri_memi,ife_memo,Ri_memo,write_mem);

//WB
wire      ife_wb;
wire[5:0] op_wb;
wire[4:0] Ri_wbi;
wire[31:0]write_wb;
wire[4:0] Ri_wbo;
wire      reg_update;
wire[31:0]reg_new;
wire      pc_update;
wire[31:0]pc_new;
write Write(ife_wb,op_wb,Ri_wbi,write_wb,Ri_wbo,reg_update,reg_new,pc_update,pc_new);

endmodule