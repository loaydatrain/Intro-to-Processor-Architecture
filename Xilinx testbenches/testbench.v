`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:24:06 03/10/2020
// Design Name:   Processor_pipelined
// Module Name:   /home/loay/Desktop/finalproc/testbench.v
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

module testbench;

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
always #5 clk=~clk;
	initial begin
		// Initialize Inputs

		// Wait 100 ns for global reset to finish
		#100;
        clk=1;
		// Add stimulus here

	end
      
endmodule

