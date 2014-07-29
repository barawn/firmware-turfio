`timescale 1ns / 1ps
module TURF_prog_if(
		inout TURF_INIT_MTMS,
		output TURF_DIN_MTCK,
		output TURF_CCLK,
		output TURF_MTDI,
		input TURF_MTDO,
		input TURF_DONE,
		output F_PROG,
		input clk_i,
		input wr_i,
		input addr_i,
		input [31:0] dat_i,
		output [31:0] dat_o
    );

	// The low register is the number of bits to write to the programming interface, minus 1 (up to 32).
	// The high register is the data, either TMS/TDI (16-bits each) or the pure 32-bits
	// to be shifted into TURF_DIN_MTCK.
	reg [3:0] shift_counter = {4{1'b0}};
	wire [4:0] shift_counter_next = shift_counter + 1;
	reg [4:0] bit_counter = {5{1'b0}};
	wire [5:0] bit_counter_next = (bit_counter - 1);
	
	reg [31:0] shift_register = {32{1'b0}};
	reg [31:0] shift_register_in = {32{1'b0}};
	
	reg turf_done = 0;
	
	reg busy = 0;
	
	wire turf_tms;
	wire turf_cclk;
	wire turf_tck;
	wire turf_din;
	wire turf_tdi;
	(* IOB = "TRUE" *)
	reg turf_din_mtck_reg = 0;
	(* IOB = "TRUE" *)
	reg turf_cclk_reg = 0;
	(* IOB = "TRUE" *)
	reg turf_mtms_oe_reg = 1;
	always @(posedge clk_i) begin
		if (wr_i && addr_i) shift_counter <= {4{1'b0}};
		else shift_counter <= shift_counter_next;
		
		if (busy && shift_counter_next[4]) bit_counter <= bit_counter_next;
		else if (wr_i && !addr_i) bit_counter <= dat_i[4:0];
	
		if (wr_i && addr_i) shift_register <= dat_i;
		else if (shift_counter_next[4]) shift_register <= {1'b0,shift_register[30:0]};
		
		if (TURF_DONE) turf_done <= 1;
		else if (wr_i && !addr_i) turf_done <= dat_i[31];

		if (wr_i && addr_i) busy <= 1;
		else if (bit_counter_next[5]) busy <= 0;
	
		turf_din_mtck_reg <= (turf_done && turf_tck) || (!turf_done && turf_din);
		turf_cclk_reg <= !turf_done && shift_counter[3] && busy;
		turf_mtms_oe_reg <= !turf_done;
	end
	
	assign turf_tdi = shift_register[0];
	assign turf_tms = shift_register[16];
	assign turf_din = shift_register[0];
	assign turf_tck = shift_counter[3] || !busy;



endmodule
