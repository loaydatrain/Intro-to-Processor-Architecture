`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:48:41 03/10/2020
// Design Name:   Processor_pipelined
// Module Name:   /home/loay/Desktop/finalproc/weqrs.v
// Project Name:  finalproc
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Processor_pipelined
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module weqrs;

	// Inputs
	reg clk;

	// Outputs
	wire [31:0] instr;
	wire [31:0] reg_check;
	wire [31:0] data_mem_check;
	wire [31:0] Rc;

	// Instantiate the Unit Under Test (UUT)
	Processor_pipelined uut (
		.clk(clk), 
		.instr(instr), 
		.reg_check(reg_check), 
		.data_mem_check(data_mem_check), 
		.Rc(Rc)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

