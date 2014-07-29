# icon XDC
create_clock -name J_CLK -period 30 -waveform {15 30} [get_pins -hierarchical * -filter {name =~ */DRCK_IN}]
create_clock -name U_CLK -period 30 [get_pins -hierarchical * -filter {NAME =~ */UPDATE_IN}]
set_multicycle_path -from [get_clocks U_CLK] -to [get_clocks J_CLK] -setup 2
set_multicycle_path -from [get_clocks U_CLK] -to [get_clocks J_CLK] -hold 1
set_clock_groups -asynchronous -name cross_jtag_clock_domains -group {J_CLK U_CLK}
