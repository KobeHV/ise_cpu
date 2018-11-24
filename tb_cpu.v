`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:10:34 11/21/2018
// Design Name:   CPU
// Module Name:   E:/ISE/cpu/cpu/tb_cpu.v
// Project Name:  cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_cpu;

	parameter rst_repiod = 102; 
	// Inputs
	reg rst;
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.rst(rst), 
		.clk(clk)
	);

	initial
	begin
		 clk = 0;
		 rst = 1;
		 #rst_repiod;
		 rst = 0;   
	end
	
	always
	begin
		 #10 clk<=~clk;
	end
	//initial begin
		// Initialize Inputs
		//rst = 0;
		//clk = 0;

		// Wait 100 ns for global reset to finish
		//#100;
        
		// Add stimulus here

	//end
      
endmodule

