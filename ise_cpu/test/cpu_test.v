`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:18:15 12/12/2018
// Design Name:   CPU
// Module Name:   E:/ISE/cpu/cpu/cpu_test.v
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

module cpu_test;

	// Inputs
	reg rst;
	reg clk;

	// Outputs
	wire [31:0] PC;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.rst(rst), 
		.clk(clk), 
		.PC(PC)
	);

	initial 
	begin
		// Initialize Inputs
		rst = 1;
		clk = 0;
  
		// Wait 100 ns for global reset to finish
		#102;
        rst = 0;
		// Add stimulus here

	end
	
    always 
	begin
		#10 clk <= ~clk;
	end
endmodule

