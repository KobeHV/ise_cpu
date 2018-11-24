`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:58:27 11/21/2018 
// Design Name: 
// Module Name:    v_memory 
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
module v_memory(clk,op,alu_i,addr_i,write_o);
input clk;
input [5:0]op;
input [31:0]alu_i;
input [31:0]addr_i;
output [31:0]write_o;

reg [31:0]DatMem [255:0];

initial
begin
    //$readmemh("data.dat", DatMem);
    $readmemh("E:/ISE/cpu/data.txt", DatMem);
end
	
wire [31:0]write_o;
assign write_o = op[5:4]==2'b00 ? alu_i:				 
				 op[5:4]==2'b10 ? addr_i:
				 op==6'b010001 ? DatMem[addr_i]://LW
				 0;

always @(negedge clk)
begin
	if(op==6'b010000)
		DatMem[addr_i] <= alu_i;//SW	
end

endmodule
