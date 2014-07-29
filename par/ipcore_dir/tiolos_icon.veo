///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2014 Xilinx, Inc.
// All Rights Reserved
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor     : Xilinx
// \   \   \/     Version    : 14.7
//  \   \         Application: Xilinx CORE Generator
//  /   /         Filename   : tiolos_icon.veo
// /___/   /\     Timestamp  : Tue Jul 29 09:50:19 Eastern Daylight Time 2014
// \   \  /  \
//  \___\/\___\
//
// Design Name: ISE Instantiation template
///////////////////////////////////////////////////////////////////////////////

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
tiolos_icon YourInstanceName (
    .CONTROL0(CONTROL0), // INOUT BUS [35:0]
    .CONTROL1(CONTROL1), // INOUT BUS [35:0]
    .TDO_OUT(TDO_OUT), // OUT
    .TDI_IN(TDI_IN), // IN
    .RESET_IN(RESET_IN), // IN
    .SHIFT_IN(SHIFT_IN), // IN
    .UPDATE_IN(UPDATE_IN), // IN
    .CAPTURE_IN(CAPTURE_IN), // IN
    .SEL_IN(SEL_IN), // IN
    .DRCK_IN(DRCK_IN) // IN
);

// INST_TAG_END ------ End INSTANTIATION Template ---------

