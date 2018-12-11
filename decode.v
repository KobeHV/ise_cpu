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
module decode(clk,ir_id,npc_idi,op_id,A_id,B_id,Imm_id,npc_ido,Ri_id,reg_update,reg_i,Ri_in);

input        clk;
input  [31:0]ir_id;
input  [31:0]npc_idi;
input        reg_update;
input  [31:0]reg_i;
input  [4:0] Ri_in;
output [5:0] op_id;
output [31:0]A_id;
output [31:0]B_id;
output [31:0]Imm_id;
output [31:0]npc_ido;
output [4:0] Ri_id;

reg [31:0]Regs [31:0];
initial
begin
	$readmemh("register.txt",Regs);
end

wire [4:0] Ri;
wire [4:0] Rj;
wire [4:0] Rk;
wire [5:0] op_id;
wire [31:0]A_id;
wire [31:0]B_id;
wire [31:0]Imm_id;
wire [31:0]npc_ido;
wire [4:0] Ri_id;

assign Ri      = ir_id[25:21];
assign Rj      = ir_id[20:16];
assign Rk      = ir_id[15:11];
assign op_id   = ir_id[31:26];
assign A_id    = op_id[5:4] == 2'b00 ? Regs[Rj]://R-R ALU
			     op_id[5:4] == 2'b01 ? Regs[Ri]://SW
			     op_id == 6'b10_0000 ? Regs[Ri]://BEQ
			     0;
assign B_id    = op_id[5:4] == 2'b00 ? Regs[Rk] : 
			     op_id[5:4] == 2'b01 ? Regs[Rj] :
			     op_id = 6'b10_0000  ? Regs[Rj] ://BEQ
			     0;
assign Imm_id  = op_id == 6'b10_0001 ? ir_id[25:0] ://JMP
	             op_id == 6'b10_0000 ? ir_id[15:0] ://BEQ
			     0;
assign npc_ido = npc_idi; 
assign Ri_id   = Ri;
				
always @(negedge clk)
begin
    if (reg_update)
		begin
			Regs[Ri] <= reg_i;
		end
end 

endmodule