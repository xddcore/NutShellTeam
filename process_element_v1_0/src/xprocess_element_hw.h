// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of input_fmap
//        bit 31~0 - input_fmap[31:0] (Read/Write)
// 0x14 : Data signal of input_fmap
//        bit 31~0 - input_fmap[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of output_fmap
//        bit 31~0 - output_fmap[31:0] (Read/Write)
// 0x20 : Data signal of output_fmap
//        bit 31~0 - output_fmap[63:32] (Read/Write)
// 0x24 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XPROCESS_ELEMENT_CONTROL_ADDR_INPUT_FMAP_DATA  0x10
#define XPROCESS_ELEMENT_CONTROL_BITS_INPUT_FMAP_DATA  64
#define XPROCESS_ELEMENT_CONTROL_ADDR_OUTPUT_FMAP_DATA 0x1c
#define XPROCESS_ELEMENT_CONTROL_BITS_OUTPUT_FMAP_DATA 64

// CTRL_BUS
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - enable ap_done interrupt (Read/Write)
//        bit 1  - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - ap_done (COR/TOW)
//        bit 1  - ap_ready (COR/TOW)
//        others - reserved
// 0x10 : Data signal of ap_return
//        bit 15~0 - ap_return[15:0] (Read)
//        others   - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XPROCESS_ELEMENT_CTRL_BUS_ADDR_AP_CTRL   0x00
#define XPROCESS_ELEMENT_CTRL_BUS_ADDR_GIE       0x04
#define XPROCESS_ELEMENT_CTRL_BUS_ADDR_IER       0x08
#define XPROCESS_ELEMENT_CTRL_BUS_ADDR_ISR       0x0c
#define XPROCESS_ELEMENT_CTRL_BUS_ADDR_AP_RETURN 0x10
#define XPROCESS_ELEMENT_CTRL_BUS_BITS_AP_RETURN 16

