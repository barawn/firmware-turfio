`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:59:17 07/04/2014
// Design Name:   TURF_interface_v2
// Module Name:   C:/cygwin/home/barawn/firmware/ANITA/TURFIOLOS/sim/turf_interface_v2_tb.v
// Project Name:  TURFIOLOS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TURF_interface_v2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module turf_interface_v2_tb;

	// Inputs
	reg clk_i;
	reg wr_i;
	reg rd_i;
	reg [5:0] addr_i;
	reg [1:0] bank_i;
	reg [31:0] dat_i;

	// Outputs
	wire [31:0] dat_o;
	wire ack_o;
	wire TURF_WnR;
	wire nCSTURF;

	// Bidirs
	wire [7:0] TURF_DIO;

	reg turf_clk = 0;
	always @(clk_i) begin
		#4 turf_clk = clk_i;
	end
	
	TURF_REGISTER_INTERFACE_v2 uut2(.TURF_DIO(TURF_DIO),
											  .TURF_WnR(TURF_WnR),
											  .nCSTURF(nCSTURF),
											  .clk_i(turf_clk),
											  .scal_dat_i({32{1'b0}}),
											  .event_dat_i({32{1'b0}}),
											  .buf_status_i({32{1'b0}}),
											  .next_id_i({32{1'b0}}));

	// Instantiate the Unit Under Test (UUT)
	TURF_interface_v2 uut (
		.clk_i(clk_i), 
		.wr_i(wr_i), 
		.rd_i(rd_i), 
		.addr_i(addr_i), 
		.bank_i(bank_i), 
		.dat_i(dat_i), 
		.dat_o(dat_o), 
		.ack_o(ack_o), 
		.TURF_DIO(TURF_DIO), 
		.TURF_WnR(TURF_WnR), 
		.nCSTURF(nCSTURF)
	);

	always #15 clk_i <= ~clk_i;

	reg initial_holdoff = 1;
	reg reading_flag = 0;
	initial begin
		// Initialize Inputs
		clk_i = 0;
		wr_i = 0;
		rd_i = 0;
		addr_i = 0;
		bank_i = 0;
		dat_i = 0;

		// Wait 100 ns for global reset to finish
		#100;
       initial_holdoff = 0;
		// Add stimulus here
		@(posedge clk_i);
		addr_i <= 6'h08;
		bank_i <= 2'b10;
		dat_i <= 32'h01234567;
		wr_i <= 1;
		while (!ack_o) @(posedge clk_i);
		wr_i <= 0;
		@(posedge clk_i);
		@(posedge clk_i);
		@(posedge clk_i);
		#1;
		addr_i <= 6'h00;
		bank_i <= 2'b00;
		rd_i <= 1;
		while (!ack_o) @(posedge clk_i);
		rd_i <= 0;
	end
endmodule

