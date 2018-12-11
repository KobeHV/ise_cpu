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
module v_memory(clk,op_mem,alu_mem,addr_mem,ife_memi,Ri_memi,ife_memo,Ri_memo,write_mem);
input        clk;
input [5:0]  op_mem;
input [31:0] alu_mem;
input [31:0] addr_mem;
input        ife_memi;
input [4:0]  Ri_memi;
output       ife_memo;
output[4:0]  Ri_memo;
output [31:0]write_mem;

reg [31:0]DatMem [255:0];

initial
begin
    $readmemh("data.txt", DatMem);
end
	
wire        ife_memo;
wire [4:0]  Ri_memo;
wire [31:0] write_mem;

assign ife_memo  = ife_memi;
assign Ri_memo   = Ri_memi;
assign write_mem = op_mem[5:4]==2'b00 ? alu_mem:				 
				   op_mem[5:4]==2'b10 ? addr_mem:
				   op_mem==6'b010001 ? DatMem[addr_mem]://LW
				   0;

always @(negedge clk)
begin
	if(op==6'b010000)
		DatMem[addr_mem] <= alu_mem;//SW	
end

endmodule
