`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:55:37 11/21/2018 
// Design Name: 
// Module Name:    fetch 
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
module fetch(rst,clk,ir_o,npc,pc_update,pc_i,PC);
input rst;
input clk;
input pc_update;
input [31:0]pc_i;
output reg [31:0]ir_o;
output reg [31:0]npc;
output reg [31:0]PC; 

//把存储器模块整合到fetch模块里
reg [31:0]IntMem[255:0];
//reg [31:0]PC;  

initial
begin
    PC = 0 ;
	//$readmemh("int.dat",IntMem);
	$readmemh("int.txt",IntMem);
end

always @(posedge clk)
begin		
	if(rst) 
        //PC <= 0;//不能在两个always都对pc有改动，否则综合的时候报错！！！
		 begin
		 ir_o <= IntMem[0];
	     npc <= 1;
		 end
	else 
	begin
		ir_o <= IntMem[PC];
		npc <= PC + 1;
	end
end


//update PC

always @(negedge clk)
begin 
    if(!rst)
		begin
			if(pc_update)
				begin
				  PC <= pc_i;
				end
			else if(!pc_update)
				begin
				  PC <= PC + 1;
				end
		end
	else
	   PC <= 0;
end


endmodule