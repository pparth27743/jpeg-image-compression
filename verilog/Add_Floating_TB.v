`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:04:06 11/09/2017
// Design Name:   Add_Floating
// Module Name:   C:/Users/student/Downloads/Compresssion_Image-20171108T124842Z-001/Compression_Image_Zync/Add_Floating_TB.v
// Project Name:  Compression_Image_Zync
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Add_Floating
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Add_Floating_TB;

	// Inputs
	reg aclk;
	reg s_axis_a_tvalid;
	reg s_axis_b_tvalid;
	reg [31:0] s_axis_a_tdata;
	reg [31:0] s_axis_b_tdata;

	// Outputs
	wire s_axis_a_tready;
	wire s_axis_b_tready;
	wire m_axis_result_tvalid;
	wire [31:0] m_axis_result_tdata;

	// Instantiate the Unit Under Test (UUT)
	Add_Floating uut (
		.aclk(aclk), 
		.s_axis_a_tvalid(s_axis_a_tvalid), 
		.s_axis_b_tvalid(s_axis_b_tvalid), 
		.s_axis_a_tready(s_axis_a_tready), 
		.s_axis_b_tready(s_axis_b_tready), 
		.m_axis_result_tvalid(m_axis_result_tvalid), 
		.s_axis_a_tdata(s_axis_a_tdata), 
		.s_axis_b_tdata(s_axis_b_tdata), 
		.m_axis_result_tdata(m_axis_result_tdata)
	);

	initial begin
		// Initialize Inputs
		aclk = 0;
		s_axis_a_tvalid = 0;
		s_axis_b_tvalid = 1;
		s_axis_a_tdata = 32'b01000010000010100011110101110001; //34.56
		s_axis_b_tdata = 32'b01000001111101011110101110000101; //30.74
		#1000;
		
		s_axis_a_tvalid = 1;
		s_axis_b_tvalid = 1;
		s_axis_a_tdata = 32'b01000010000010100011110101110001; //34.56
		s_axis_b_tdata = 32'b01000001111101011110101110000101; //30.74
		#1000;
		

		s_axis_a_tvalid = 1;
		s_axis_b_tvalid = 1;
		s_axis_a_tdata = 32'b01010010000010100011110101110001; //34.56
		s_axis_b_tdata = 32'b01101011111101011110101110000101; //30.74
		#1000;
		
		s_axis_a_tvalid = 1;
		s_axis_b_tvalid = 1;
		s_axis_a_tdata = 32'b01000010000010100011110101110001; //34.56
		s_axis_b_tdata = 32'b01000001111101011110101110000101; //30.74
		#1000;
		

		s_axis_a_tvalid = 1;
		s_axis_b_tvalid = 1;
		s_axis_a_tdata = 32'b01010010000010100011110101110001; //34.56
		s_axis_b_tdata = 32'b01101011111101011110101110000101; //30.74
		#1000;
		
		s_axis_a_tvalid = 1;
		s_axis_b_tvalid = 1;
		s_axis_a_tdata = 32'b01010010000010100011110101110001; //34.56
		s_axis_b_tdata = 32'b01101010101101111110101110000101; //30.74
		#1000;
		
		
		s_axis_a_tvalid = 1;
		s_axis_b_tvalid = 1;
		s_axis_a_tdata = 32'b01010010000010100011110101110001; //34.56
		s_axis_b_tdata = 32'b01101011111101011110101110000101; //30.74
		#1000;
		
		s_axis_a_tvalid = 1;
		s_axis_b_tvalid = 1;
		s_axis_a_tdata = 32'b01000010000010100011110101110001; //34.56
		s_axis_b_tdata = 32'b01000001111101011110101110000101; //30.74
		#1000;
		

		s_axis_a_tvalid = 1;
		s_axis_b_tvalid = 1;
		s_axis_a_tdata = 32'b01010010000010100011110101110001; //34.56
		s_axis_b_tdata = 32'b01101011111101011110101110000101; //30.74
		#1000;
		
		s_axis_a_tvalid = 1;
		s_axis_b_tvalid = 1;
		s_axis_a_tdata = 32'b01010010000010100011110101110001; //34.56
		s_axis_b_tdata = 32'b01101010101101111110101110000101; //30.74
		#1000;
		
		
		
		s_axis_a_tvalid = 1;
		s_axis_b_tvalid = 1;
		s_axis_a_tdata = 32'b01010010000010100011110101110001; //34.56
		s_axis_b_tdata = 32'b01101011111101011110101110000101; //30.74
		#1000;
		
		s_axis_a_tvalid = 1;
		s_axis_b_tvalid = 1;
		s_axis_a_tdata = 32'b01000010000010100011110101110001; //34.56
		s_axis_b_tdata = 32'b01000001111101011110101110000101; //30.74
		#1000;
		

		s_axis_a_tvalid = 1;
		s_axis_b_tvalid = 1;
		s_axis_a_tdata = 32'b01010010000010100011110101110001; //34.56
		s_axis_b_tdata = 32'b01101011111101011110101110000101; //30.74
		#1000;
		
		s_axis_a_tvalid = 1;
		s_axis_b_tvalid = 1;
		s_axis_a_tdata = 32'b01010010000010100011110101110001; //34.56
		s_axis_b_tdata = 32'b01101010101101111110101110000101; //30.74
		#1000;
		

	end
	
	always #500 aclk = ~aclk;

      
endmodule

