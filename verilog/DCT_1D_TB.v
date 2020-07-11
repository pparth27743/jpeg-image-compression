`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:05:35 11/09/2017
// Design Name:   DCT_1D
// Module Name:   C:/Users/student/Downloads/Compresssion_Image-20171108T124842Z-001/Compression_Image_Zync/DCT_1D_TB.v
// Project Name:  Compression_Image_Zync
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DCT_1D
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DCT_1D_TB;

	// Inputs
	reg [31:0] I0;
	reg [31:0] I1;
	reg [31:0] I2;
	reg [31:0] I3;
	reg [31:0] I4;
	reg [31:0] I5;
	reg [31:0] I6;
	reg [31:0] I7;
	reg aclk;

	// Outputs
	wire [31:0] O0;
	wire [31:0] O1;
	wire [31:0] O2;
	wire [31:0] O3;
	wire [31:0] O4;
	wire [31:0] O5;
	wire [31:0] O6;
	wire [31:0] O7;

	// Instantiate the Unit Under Test (UUT)
	DCT_1D uut (
		.I0(I0), 
		.I1(I1), 
		.I2(I2), 
		.I3(I3), 
		.I4(I4), 
		.I5(I5), 
		.I6(I6), 
		.I7(I7), 
		.O0(O0), 
		.O1(O1), 
		.O2(O2), 
		.O3(O3), 
		.O4(O4), 
		.O5(O5), 
		.O6(O6), 
		.O7(O7), 
		.aclk(aclk)
	);

	initial begin
		// Initialize Inputs
		I0 = 0;
		I1 = 0;
		I2 = 0;
		I3 = 0;
		I4 = 0;
		I5 = 0;
		I6 = 0;
		I7 = 0;
		aclk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

