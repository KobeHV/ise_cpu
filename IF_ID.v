`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:47:12 12/12/2018 
// Design Name: 
// Module Name:    IF_ID 
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
module IF_ID(clk,ir_if,npc_if,ir_id,npc_id);
input           clk;
input     [31:0]ir_if;
input     [31:0]npc_if;
output reg[31:0]ir_id;
output reg[31:0]npc_id;

always @(posedge clk)
begin 
	ir_id  <= ir_if;
	npc_id <= npc_if;
end

endmodule
