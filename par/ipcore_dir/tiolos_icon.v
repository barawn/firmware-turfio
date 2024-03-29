///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2014 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 14.7
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : tiolos_icon.v
// /___/   /\     Timestamp  : Tue Jul 29 09:50:19 Eastern Daylight Time 2014
// \   \  /  \
//  \___\/\___\
//
// Design Name: Verilog Synthesis Wrapper
///////////////////////////////////////////////////////////////////////////////
// This wrapper is used to integrate with Project Navigator and PlanAhead

`timescale 1ns/1ps

module tiolos_icon(
    CONTROL0,
    CONTROL1,
    TDO_OUT,
    TDI_IN,
    RESET_IN,
    SHIFT_IN,
    UPDATE_IN,
    CAPTURE_IN,
    SEL_IN,
    DRCK_IN) /* synthesis syn_black_box syn_noprune=1 */;


inout [35 : 0] CONTROL0;
inout [35 : 0] CONTROL1;
output TDO_OUT;
input TDI_IN;
input RESET_IN;
input SHIFT_IN;
input UPDATE_IN;
input CAPTURE_IN;
input SEL_IN;
input DRCK_IN;

endmodule
