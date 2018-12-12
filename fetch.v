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
module fetch(rst,clk,ir_if,npc_if,pc_update,pc_i,PC);
input            rst;
input            clk;
output reg [31:0]ir_if;
output reg [31:0]npc_if;
input 			 pc_update;
input      [31:0]pc_i;
output reg [31:0]PC; 

//把存储器模块整合到fetch模块里
reg [31:0]IntMem[255:0] ;

initial
begin
    PC = 0 ;
	ir_if = 0;
	$readmemh("int.txt",IntMem);
end

always @(posedge clk)
begin		
	if(rst) 
        //不要在下降沿写PC，否则chipscop上PC总是比实际大于1
		 begin
		 PC     = 0;
		 ir_if  = IntMem[PC];
	     npc_if = PC+1;
		 end
	else 
		begin			
			if(pc_update == 1)
				begin
				  PC = pc_i;
				end
			else
				begin
				  PC = PC + 1;
				end
			ir_if  = IntMem[PC];
			npc_if = PC + 1;
		end
end

endmodule