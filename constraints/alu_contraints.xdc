set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }]; #IO_L12P_T1_MRCC_35 Sch=clk100mhz
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}];

#Switches

set_property -dict { PACKAGE_PIN U9   IOSTANDARD LVCMOS33 } [get_ports { A[0] }]; 
set_property -dict { PACKAGE_PIN U8   IOSTANDARD LVCMOS33 } [get_ports { A[1] }];
set_property -dict { PACKAGE_PIN R7   IOSTANDARD LVCMOS33 } [get_ports { A[2] }]; 
set_property -dict { PACKAGE_PIN R6   IOSTANDARD LVCMOS33 } [get_ports { A[3] }];
set_property -dict { PACKAGE_PIN R5   IOSTANDARD LVCMOS33 } [get_ports { A[4] }];
set_property -dict { PACKAGE_PIN V7   IOSTANDARD LVCMOS33 } [get_ports { A[5] }];
set_property -dict { PACKAGE_PIN V6   IOSTANDARD LVCMOS33 } [get_ports { B[0] }];
set_property -dict { PACKAGE_PIN V5   IOSTANDARD LVCMOS33 } [get_ports { B[1] }];
set_property -dict { PACKAGE_PIN U4    IOSTANDARD LVCMOS33 } [get_ports { B[2] }];
set_property -dict { PACKAGE_PIN V2    IOSTANDARD LVCMOS33 } [get_ports { B[3] }];
set_property -dict { PACKAGE_PIN U2   IOSTANDARD LVCMOS33 } [get_ports { B[4] }];
set_property -dict { PACKAGE_PIN T3   IOSTANDARD LVCMOS33 } [get_ports { B[5] }]; 
set_property -dict { PACKAGE_PIN T1    IOSTANDARD LVCMOS33 } [get_ports { instruction_in }];
set_property -dict { PACKAGE_PIN R3   IOSTANDARD LVCMOS33 } [get_ports { instr_load_en }]; 
set_property -dict { PACKAGE_PIN P3   IOSTANDARD LVCMOS33 } [get_ports { reset_instr }]; 
set_property -dict { PACKAGE_PIN P4 IOSTANDARD LVCMOS33 } [get_ports { reset_all }];


#set_property -dict { PACKAGE_PIN E16   IOSTANDARD LVCMOS33 } [get_ports { instruction_in }]; #IO_L9P_T1_DQS_14 Sch=btnc
#set_property -dict { PACKAGE_PIN F15   IOSTANDARD LVCMOS33 } [get_ports { instr_load_en }]; #IO_L4N_T0_D05_14 Sch=btnu
#set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { reset_instr }]; #IO_L12P_T1_MRCC_14 Sch=btnl
#set_property -dict { PACKAGE_PIN R10   IOSTANDARD LVCMOS33 } [get_ports { reset_all }]; #IO_L10N_T1_D15_14 Sch=btnr



set_property -dict { PACKAGE_PIN L3   IOSTANDARD LVCMOS33 } [get_ports { SEG[0] }]; #IO_L24N_T3_A00_D16_14 Sch=ca
set_property -dict { PACKAGE_PIN N1   IOSTANDARD LVCMOS33 } [get_ports { SEG[1] }]; #IO_25_14 Sch=cb
set_property -dict { PACKAGE_PIN L5   IOSTANDARD LVCMOS33 } [get_ports { SEG[2] }]; #IO_25_15 Sch=cc
set_property -dict { PACKAGE_PIN L4   IOSTANDARD LVCMOS33 } [get_ports { SEG[3] }]; #IO_L17P_T2_A26_15 Sch=cd
set_property -dict { PACKAGE_PIN K3   IOSTANDARD LVCMOS33 } [get_ports { SEG[4] }]; #IO_L13P_T2_MRCC_14 Sch=ce
set_property -dict { PACKAGE_PIN M2   IOSTANDARD LVCMOS33 } [get_ports { SEG[5] }]; #IO_L19P_T3_A10_D26_14 Sch=cf
set_property -dict { PACKAGE_PIN L6   IOSTANDARD LVCMOS33 } [get_ports { SEG[6] }]; #IO_L4P_T0_D04_14 Sch=cg

set_property -dict { PACKAGE_PIN M4   IOSTANDARD LVCMOS33 } [get_ports { DP }]; #IO_L19N_T3_A21_VREF_15 Sch=dp

set_property -dict { PACKAGE_PIN N6   IOSTANDARD LVCMOS33 } [get_ports { AN[0] }]; #IO_L23P_T3_FOE_B_15 Sch=an[0]
set_property -dict { PACKAGE_PIN M6   IOSTANDARD LVCMOS33 } [get_ports { AN[1] }]; #IO_L23N_T3_FWE_B_15 Sch=an[1]
set_property -dict { PACKAGE_PIN M3    IOSTANDARD LVCMOS33 } [get_ports { AN[2] }]; #IO_L24P_T3_A01_D17_14 Sch=an[2]
set_property -dict { PACKAGE_PIN N5   IOSTANDARD LVCMOS33 } [get_ports { AN[3] }]; #IO_L19P_T3_A22_15 Sch=an[3]
set_property -dict { PACKAGE_PIN N2   IOSTANDARD LVCMOS33 } [get_ports { AN[4] }]; #IO_L8N_T1_D12_14 Sch=an[4]
set_property -dict { PACKAGE_PIN N4   IOSTANDARD LVCMOS33 } [get_ports { AN[5] }]; #IO_L14P_T2_SRCC_14 Sch=an[5]
set_property -dict { PACKAGE_PIN L1    IOSTANDARD LVCMOS33 } [get_ports { AN[6] }]; #IO_L23P_T3_35 Sch=an[6]
set_property -dict { PACKAGE_PIN M1 IOSTANDARD LVCMOS33 } [get_ports { AN[7] }]; #IO_L23N_T3_A02_D18_14 Sch=an[7]

## LEDs

set_property -dict { PACKAGE_PIN T8   IOSTANDARD LVCMOS33 } [get_ports { bcd_result[0] }]; #IO_L18P_T2_A24_15 Sch=led[0]
set_property -dict { PACKAGE_PIN V9   IOSTANDARD LVCMOS33 } [get_ports { bcd_result[1] }]; #IO_L24P_T3_RS1_15 Sch=led[1]
set_property -dict { PACKAGE_PIN R8   IOSTANDARD LVCMOS33 } [get_ports { bcd_result[2] }]; #IO_L17N_T2_A25_15 Sch=led[2]
set_property -dict { PACKAGE_PIN T6   IOSTANDARD LVCMOS33 } [get_ports { bcd_result[3] }]; #IO_L8P_T1_D11_14 Sch=led[3]
set_property -dict { PACKAGE_PIN T5   IOSTANDARD LVCMOS33 } [get_ports { bcd_result[4] }]; #IO_L7P_T1_D09_14 Sch=led[4]
set_property -dict { PACKAGE_PIN T4   IOSTANDARD LVCMOS33 } [get_ports { bcd_result[5] }]; #IO_L18N_T2_A11_D27_14 Sch=led[5]
set_property -dict { PACKAGE_PIN U7   IOSTANDARD LVCMOS33 } [get_ports { bcd_result[6] }]; #IO_L17P_T2_A14_D30_14 Sch=led[6]
set_property -dict { PACKAGE_PIN U6   IOSTANDARD LVCMOS33 } [get_ports { bcd_result[7] }]; #IO_L18P_T2_A12_D28_14 Sch=led[7]
set_property -dict { PACKAGE_PIN V4   IOSTANDARD LVCMOS33 } [get_ports { bcd_result[8] }]; #IO_L16N_T2_A15_D31_14 Sch=led[8]
set_property -dict { PACKAGE_PIN U3   IOSTANDARD LVCMOS33 } [get_ports { bcd_result[9] }]; #IO_L14N_T2_SRCC_14 Sch=led[9]
set_property -dict { PACKAGE_PIN V1   IOSTANDARD LVCMOS33 } [get_ports { bcd_result[10] }]; #IO_L22P_T3_A05_D21_14 Sch=led[10]
set_property -dict { PACKAGE_PIN R1   IOSTANDARD LVCMOS33 } [get_ports { bcd_result[11] }]; #IO_L15N_T2_DQS_DOUT_CSO_B_14 Sch=led[11]
