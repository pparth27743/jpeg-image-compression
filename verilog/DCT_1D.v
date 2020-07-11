`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:44:25 11/06/2017 
// Design Name: 
// Module Name:    DCT_1D 
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
/////////////////////////////////////////////////////////////////////////////////
module DCT_1D(I0, I1, I2, I3, I4, I5, I6, I7, O0, O1, O2, O3, O4, O5, O6, O7, aclk);

input [31:0] I0,I1, I2, I3, I4, I5, I6, I7;//Inputs
input aclk;
output wire [31:0] O0,O1, O2, O3, O4, O5, O6, O7;//Outputs

//////////////////-Constants-////////////////////////
wire [31:0] S_Pi_8_by2=32'b00111110010000111110111100010100;
wire [31:0] S_Pi_16_by2=32'b00111101110001111100010111000010; 
wire [31:0] S_3Pi_16_by2=32'b00111110100011100011100111011010; 
wire [31:0] C_Pi_8_by2=32'b00111110111011001000001101011110;
wire [31:0] C_Pi_16_by2=32'b00111110111110110001010010111101; 
wire [31:0] C_3Pi_16_by2=32'b00111110110101001101101100110001; 
wire [31:0] C_Pi_4=32'b00111111001101010000010011110100;
wire [31:0] C_Pi_4_by2=32'b00111110101101010000010011110100;

//Negatives of Constants
wire [31:0] NS_Pi_8_by2={~S_Pi_8_by2[31] , S_Pi_8_by2[30:0]};
wire [31:0] NS_Pi_16_by2={~S_Pi_16_by2[31] , S_Pi_16_by2[30:0]};
wire [31:0] NS_3Pi_16_by2={~S_3Pi_16_by2[31] , S_3Pi_16_by2[30:0]}; 
wire [31:0] NC_Pi_8_by2={~C_Pi_8_by2[31] , C_Pi_8_by2[30:0]};
wire [31:0] NC_Pi_16_by2={~C_Pi_16_by2[31] , C_Pi_16_by2[30:0]}; 
wire [31:0] NC_3Pi_16_by2={~C_3Pi_16_by2[31] , C_3Pi_16_by2[30:0]}; 
//wire [31:0] NC_Pi_4={~C_Pi_4[31] , C_Pi_4[31:0]};

//Negatives of Inputs
wire [31:0] NI4={~I4[31] , I4[30:0]};
wire [31:0] NI5={~I5[31] , I5[30:0]};
wire [31:0] NI6={~I6[31] , I6[30:0]};
wire [31:0] NI7={~I7[31] , I7[30:0]};

/////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////
//////////////////Stage-1///////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
wire [31:0] stage1_0, stage1_1,stage1_2, stage1_3,stage1_4, stage1_5,stage1_6, stage1_7; 
wire S1_0_Valid, S1_1_Valid, S1_2_Valid, S1_3_Valid, S1_4_Valid, S1_5_Valid, S1_6_Valid,S1_7_Valid;

Add_Floating Add_S1_0(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(1'b1), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(I0), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(I7), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S1_0_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage1_0) // output [31 : 0] m_axis_result_tdata
);

Add_Floating Add_S1_1(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(1'b1), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(I1), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(I6), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S1_1_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage1_1) // output [31 : 0] m_axis_result_tdata
);


Add_Floating Add_S1_2(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(1'b1), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(I2), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(I5), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S1_2_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage1_2) // output [31 : 0] m_axis_result_tdata
);

Add_Floating Add_S1_3(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(1'b1), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(I3), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(I4), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S1_3_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage1_3) // output [31 : 0] m_axis_result_tdata
);

Add_Floating Add_S1_4(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(1'b1), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(NI4), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(I3), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S1_4_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage1_4) // output [31 : 0] m_axis_result_tdata
);


Add_Floating Add_S1_5(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(1'b1), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(NI5), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(I2), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S1_5_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage1_5) // output [31 : 0] m_axis_result_tdata
);

Add_Floating Add_S1_6(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(1'b1), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(NI6), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(I1), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S1_6_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage1_6) // output [31 : 0] m_axis_result_tdata
);

Add_Floating Add_S1_7(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(1'b1), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(NI7), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(I0), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S1_7_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage1_7) // output [31 : 0] m_axis_result_tdata
);

wire [31:0] Nstage1_2={~stage1_2[31] , stage1_2[30:0]};
wire [31:0] Nstage1_3={~stage1_3[31] , stage1_3[30:0]};
wire [31:0] Nstage1_5={~stage1_5[31] , stage1_5[30:0]};
/////////////////////////////////////////////////////
/*assign m_axis_result_tvalid=S1_7_Valid;

assign O0=stage1_0;
assign O1=stage1_1;
assign O2=stage1_2;
assign O3=stage1_3;
assign O4=stage1_4;
assign O5=stage1_5;
assign O6=stage1_6;
assign O7=stage1_7;*/



////////////////////////////////////////////////////////////////////////////////////////
//////////////////Stage-2///////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
wire [31:0] stage2_0, stage2_1,stage2_2, stage2_3,stage2_4, stage2_5,stage2_6, stage2_7; 
wire S2_0_Valid,S2_1_Valid, S2_2_Valid, S2_3_Valid, S2_4_Valid, S2_5_Valid, S2_6_Valid, S2_7_Valid;



Add_Floating Add_S2_0(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S1_0_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(stage1_0), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(S1_3_Valid), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_a_tready), // output s_axis_b_tready
  .s_axis_b_tdata(stage1_3), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S2_0_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage2_0) // output [31 : 0] m_axis_result_tdata
);

Add_Floating Add_S2_1(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S1_1_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(stage1_1), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(S1_2_Valid), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_a_tready), // output s_axis_b_tready
  .s_axis_b_tdata(stage1_2), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S2_1_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage2_1) // output [31 : 0] m_axis_result_tdata
);


Add_Floating Add_S2_2(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S1_2_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(Nstage1_2), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(S1_1_Valid), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_a_tready), // output s_axis_b_tready
  .s_axis_b_tdata(stage1_1), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S2_2_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage2_2) // output [31 : 0] m_axis_result_tdata
);

Add_Floating Add_S2_3(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S1_3_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(Nstage1_3), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(S1_0_Valid), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_a_tready), // output s_axis_b_tready
  .s_axis_b_tdata(stage1_0), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S2_3_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage2_3) // output [31 : 0] m_axis_result_tdata
);


assign stage2_4=stage1_4;
assign S2_4_Valid=1'b1;
//---------------------
wire [31:0] T_stage2_5;
wire T_S2_5_Valid ;
Add_Floating Add_S2_5(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S1_5_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(Nstage1_5), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(S1_6_Valid), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_a_tready), // output s_axis_b_tready
  .s_axis_b_tdata(stage1_6), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(T_S2_5_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(T_stage2_5) // output [31 : 0] m_axis_result_tdata
);

Multiply_Floating Mul_S2_5 (
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(T_S2_5_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(T_stage2_5), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(C_Pi_4), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S2_5_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage2_5) // output [31 : 0] m_axis_result_tdata
);


//------------------

wire [31:0] T_stage2_6;
wire T_S2_6_Valid ;
Add_Floating Add_S2_6(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S1_6_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(stage1_6), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(S1_5_Valid), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_a_tready), // output s_axis_b_tready
  .s_axis_b_tdata(stage1_5), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(T_S2_6_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(T_stage2_6) // output [31 : 0] m_axis_result_tdata
);

Multiply_Floating Mul_S2_6  (
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(T_S2_6_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(T_stage2_6), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(C_Pi_4), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S2_6_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage2_6) // output [31 : 0] m_axis_result_tdata
);

//--------------------

assign stage2_7=stage1_7;
assign S2_7_Valid=1'b1;

wire [31:0] Nstage2_1={~stage2_1[31] , stage2_1[30:0]};
wire [31:0] Nstage2_5={~stage2_5[31] , stage2_5[30:0]};
wire [31:0] Nstage2_6={~stage2_6[31] , stage2_6[30:0]};
/////////////////////////////////////////////////////
/////////////////////////////////////////////////////
/////////////////////////////////////////////////////
/*assign m_axis_result_tvalid=S2_5_Valid;

assign O0=stage2_0;
assign O1=stage2_1;
assign O2=stage2_2;
assign O3=stage2_3;
assign O4=stage2_4;
assign O5=stage2_5;
assign O6=stage2_6;
assign O7=stage2_7;
*/




////////////////////////////////////////////////////////////////////////////////////////
//////////////////Stage-3///////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
wire [31:0] stage3_0, stage3_1,stage3_2, stage3_3,stage3_4, stage3_5,stage3_6, stage3_7; 
wire S3_0_Valid,S3_1_Valid, S3_2_Valid, S3_3_Valid, S3_4_Valid, S3_5_Valid, S3_6_Valid, S3_7_Valid;


//----------
wire [31:0] T_stage3_0;
wire T_S3_0_Valid ;
Add_Floating Add_S3_0(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S2_0_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(stage2_0), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(S2_1_Valid), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_a_tready), // output s_axis_b_tready
  .s_axis_b_tdata(stage2_1), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(T_S3_0_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(T_stage3_0) // output [31 : 0] m_axis_result_tdata
);

Multiply_Floating Mul_S3_0  (
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(T_S3_0_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(T_stage3_0), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(C_Pi_4_by2), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S3_0_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage3_0) // output [31 : 0] m_axis_result_tdata
);
//----------------


//----------
wire [31:0] T_stage3_1;
wire T_S3_1_Valid ;
Add_Floating Add_S3_1(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S2_1_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(Nstage2_1), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(S2_0_Valid), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_a_tready), // output s_axis_b_tready
  .s_axis_b_tdata(stage2_0), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(T_S3_1_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(T_stage3_1) // output [31 : 0] m_axis_result_tdata
);

Multiply_Floating Mul_S3_1  (
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(T_S3_1_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(T_stage3_1), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(C_Pi_4_by2), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S3_1_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage3_1) // output [31 : 0] m_axis_result_tdata
);
//------------------
wire [31:0] T1_stage3_2,T2_stage3_2;
wire T1_S3_2_Valid, T2_S3_2_Valid ;

Multiply_Floating Mul_S3_2_1  (
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S2_2_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(stage2_2), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(S_Pi_8_by2), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(T1_S3_2_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(T1_stage3_2) // output [31 : 0] m_axis_result_tdata
);

Multiply_Floating Mul_S3_2_2  (
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S2_3_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(stage2_3), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(C_Pi_8_by2), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(T2_S3_2_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(T2_stage3_2) // output [31 : 0] m_axis_result_tdata
);


Add_Floating Add_S3_2(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(T1_S3_2_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(T1_stage3_2), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(T2_S3_2_Valid), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_a_tready), // output s_axis_b_tready
  .s_axis_b_tdata(T2_stage3_2), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S3_2_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage3_2) // output [31 : 0] m_axis_result_tdata
);



//------------------
wire [31:0] T1_stage3_3,T2_stage3_3;
wire T1_S3_3_Valid, T2_S3_3_Valid ;

Multiply_Floating Mul_S3_3_1  (
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S2_3_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(stage2_3), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(S_Pi_8_by2), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(T1_S3_3_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(T1_stage3_3) // output [31 : 0] m_axis_result_tdata
);

Multiply_Floating Mul_S3_3_2  (
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S2_2_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(stage2_2), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(NC_Pi_8_by2), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(T2_S3_3_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(T2_stage3_3) // output [31 : 0] m_axis_result_tdata
);


Add_Floating Add_S3_3(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(T1_S3_3_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(T1_stage3_3), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(T2_S3_3_Valid), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_a_tready), // output s_axis_b_tready
  .s_axis_b_tdata(T2_stage3_3), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S3_3_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage3_3) // output [31 : 0] m_axis_result_tdata
);


//------------------

Add_Floating Add_S3_4(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S2_4_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(stage2_4), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(S2_5_Valid), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_a_tready), // output s_axis_b_tready
  .s_axis_b_tdata(stage2_5), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S3_4_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage3_4) // output [31 : 0] m_axis_result_tdata
);

Add_Floating Add_S3_5(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S2_5_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(Nstage2_5), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(S2_4_Valid), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_a_tready), // output s_axis_b_tready
  .s_axis_b_tdata(stage2_4), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S3_5_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage3_5) // output [31 : 0] m_axis_result_tdata
);



Add_Floating Add_S3_6(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S2_6_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(Nstage2_6), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(S2_7_Valid), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_a_tready), // output s_axis_b_tready
  .s_axis_b_tdata(stage2_7), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S3_6_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage3_6) // output [31 : 0] m_axis_result_tdata
);


Add_Floating Add_S3_7(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S2_7_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(stage2_7), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(S2_6_Valid), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_a_tready), // output s_axis_b_tready
  .s_axis_b_tdata(stage2_6), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S3_7_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage3_7) // output [31 : 0] m_axis_result_tdata
);
/////////////////////////////////////////////////////
/////////////////////////////////////////////////////
/////////////////////////////////////////////////////
/*assign m_axis_result_tvalid=S3_3_Valid;

assign O0=stage3_0;
assign O1=stage3_1;
assign O2=stage3_2;
assign O3=stage3_3;
assign O4=stage3_4;
assign O5=stage3_5;
assign O6=stage3_6;
assign O7=stage3_7;
*/


////////////////////////////////////////////////////////////////////////////////////////
//////////////////Stage-4///////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
wire [31:0] stage4_0, stage4_1,stage4_2, stage4_3,stage4_4, stage4_5,stage4_6, stage4_7; 
wire S4_0_Valid,S4_1_Valid, S4_2_Valid, S4_3_Valid, S4_4_Valid, S4_5_Valid, S4_6_Valid, S4_7_Valid;

assign stage4_0=stage3_0;
assign stage4_1=stage3_1;
assign stage4_2=stage3_2;
assign stage4_3=stage3_3;

//------------------------
wire [31:0] T1_stage4_4,T2_stage4_4;
wire T1_S4_4_Valid, T2_S4_4_Valid ;

Multiply_Floating Mul_S4_4_1  (
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S3_4_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(stage3_4), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(S_Pi_16_by2), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(T1_S4_4_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(T1_stage4_4) // output [31 : 0] m_axis_result_tdata
);

Multiply_Floating Mul_S4_4_2  (
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S3_7_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(stage3_7), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(C_Pi_16_by2), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(T2_S4_4_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(T2_stage4_4) // output [31 : 0] m_axis_result_tdata
);


Add_Floating Add_S4_4(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(T1_S4_4_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(T1_stage4_4), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(T2_S4_4_Valid), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_a_tready), // output s_axis_b_tready
  .s_axis_b_tdata(T2_stage4_4), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S4_4_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage4_4) // output [31 : 0] m_axis_result_tdata
);
//--------------------------

wire [31:0] T1_stage4_5,T2_stage4_5;
wire T1_S4_5_Valid, T2_S4_5_Valid ;

Multiply_Floating Mul_S4_5_1  (
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S3_5_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(stage3_5), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(C_3Pi_16_by2), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(T1_S4_5_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(T1_stage4_5) // output [31 : 0] m_axis_result_tdata
);

Multiply_Floating Mul_S4_5_2  (
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S3_6_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(stage3_6), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(S_3Pi_16_by2), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(T2_S4_5_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(T2_stage4_5) // output [31 : 0] m_axis_result_tdata
);


Add_Floating Add_S4_5(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(T1_S4_5_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(T1_stage4_5), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(T2_S4_5_Valid), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_a_tready), // output s_axis_b_tready
  .s_axis_b_tdata(T2_stage4_5), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S4_5_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage4_5) // output [31 : 0] m_axis_result_tdata
);

//--------------------------

wire [31:0] T1_stage4_6,T2_stage4_6;
wire T1_S4_6_Valid, T2_S4_6_Valid ;

Multiply_Floating Mul_S4_6_1  (
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S3_6_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(stage3_6), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(C_3Pi_16_by2), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(T1_S4_6_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(T1_stage4_6) // output [31 : 0] m_axis_result_tdata
);

Multiply_Floating Mul_S4_6_2  (
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S3_5_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(stage3_5), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(NS_3Pi_16_by2), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(T2_S4_6_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(T2_stage4_6) // output [31 : 0] m_axis_result_tdata
);


Add_Floating Add_S4_6(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(T1_S4_6_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(T1_stage4_6), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(T2_S4_6_Valid), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_a_tready), // output s_axis_b_tready
  .s_axis_b_tdata(T2_stage4_6), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S4_6_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage4_6) // output [31 : 0] m_axis_result_tdata
);





//-------------------------
wire [31:0] T1_stage4_7,T2_stage4_7;
wire T1_S4_7_Valid, T2_S4_7_Valid ;

Multiply_Floating Mul_S4_7_1  (
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S3_7_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(stage3_7), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(S_Pi_16_by2), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(T1_S4_7_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(T1_stage4_7) // output [31 : 0] m_axis_result_tdata
);

Multiply_Floating Mul_S4_7_2  (
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(S3_4_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(stage3_4), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready), // output s_axis_b_tready
  .s_axis_b_tdata(NC_Pi_16_by2), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(T2_S4_7_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(T2_stage4_7) // output [31 : 0] m_axis_result_tdata
);


Add_Floating Add_S4_7(
  .aclk(aclk), // input aclk
  .s_axis_a_tvalid(T1_S4_7_Valid), // input s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready), // output s_axis_a_tready
  .s_axis_a_tdata(T1_stage4_7), // input [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(T2_S4_7_Valid), // input s_axis_b_tvalid
  .s_axis_b_tready(s_axis_a_tready), // output s_axis_b_tready
  .s_axis_b_tdata(T2_stage4_7), // input [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(S4_7_Valid), // output m_axis_result_tvalid
  .m_axis_result_tdata(stage4_7) // output [31 : 0] m_axis_result_tdata
);

//-------------------------


assign m_axis_result_tvalid=S4_6_Valid;

assign O0=stage4_0;
assign O1=stage4_1;
assign O2=stage4_2;
assign O3=stage4_3;
assign O4=stage4_4;
assign O5=stage4_5;
assign O6=stage4_6;
assign O7=stage4_7;
/////////////////////////////////////////////////////
/////////////////////////////////////////////////////
/////////////////////////////////////////////////////


endmodule
