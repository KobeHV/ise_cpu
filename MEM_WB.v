`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:51:21 12/12/2018 
// Design Name: 
// Module Name:    MEM_WB 
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
module MEM_WB(clk,op_mem,op_wb,ife_mem,Ri_mem,write_mem,ife_wb,Ri_wb,write_wb);
input            clk;
input       [5:0]op_mem;
output reg  [5:0]op_wb;
input            ife_mem;
input       [4:0]Ri_mem;
input      [31:0]write_mem;
output reg       ife_wb;
output reg  [4:0]Ri_wb;
output reg [31:0]write_wb;

always @(posedge clk)
begin 
	op_wb    <=op_mem;
	ife_wb   <=ife_mem;
	Ri_wb    <=Ri_mem;
	write_wb <=write_mem;	
end
endmodule
