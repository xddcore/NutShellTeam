// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xprocess_element.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XProcess_element_CfgInitialize(XProcess_element *InstancePtr, XProcess_element_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->Ctrl_bus_BaseAddress = ConfigPtr->Ctrl_bus_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XProcess_element_Start(XProcess_element *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XProcess_element_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XPROCESS_ELEMENT_CTRL_BUS_ADDR_AP_CTRL) & 0x80;
    XProcess_element_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XPROCESS_ELEMENT_CTRL_BUS_ADDR_AP_CTRL, Data | 0x01);
}

u32 XProcess_element_IsDone(XProcess_element *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XProcess_element_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XPROCESS_ELEMENT_CTRL_BUS_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XProcess_element_IsIdle(XProcess_element *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XProcess_element_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XPROCESS_ELEMENT_CTRL_BUS_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XProcess_element_IsReady(XProcess_element *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XProcess_element_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XPROCESS_ELEMENT_CTRL_BUS_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XProcess_element_EnableAutoRestart(XProcess_element *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XProcess_element_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XPROCESS_ELEMENT_CTRL_BUS_ADDR_AP_CTRL, 0x80);
}

void XProcess_element_DisableAutoRestart(XProcess_element *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XProcess_element_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XPROCESS_ELEMENT_CTRL_BUS_ADDR_AP_CTRL, 0);
}

u32 XProcess_element_Get_return(XProcess_element *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XProcess_element_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XPROCESS_ELEMENT_CTRL_BUS_ADDR_AP_RETURN);
    return Data;
}
void XProcess_element_Set_input_fmap(XProcess_element *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XProcess_element_WriteReg(InstancePtr->Control_BaseAddress, XPROCESS_ELEMENT_CONTROL_ADDR_INPUT_FMAP_DATA, (u32)(Data));
    XProcess_element_WriteReg(InstancePtr->Control_BaseAddress, XPROCESS_ELEMENT_CONTROL_ADDR_INPUT_FMAP_DATA + 4, (u32)(Data >> 32));
}

u64 XProcess_element_Get_input_fmap(XProcess_element *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XProcess_element_ReadReg(InstancePtr->Control_BaseAddress, XPROCESS_ELEMENT_CONTROL_ADDR_INPUT_FMAP_DATA);
    Data += (u64)XProcess_element_ReadReg(InstancePtr->Control_BaseAddress, XPROCESS_ELEMENT_CONTROL_ADDR_INPUT_FMAP_DATA + 4) << 32;
    return Data;
}

void XProcess_element_Set_output_fmap(XProcess_element *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XProcess_element_WriteReg(InstancePtr->Control_BaseAddress, XPROCESS_ELEMENT_CONTROL_ADDR_OUTPUT_FMAP_DATA, (u32)(Data));
    XProcess_element_WriteReg(InstancePtr->Control_BaseAddress, XPROCESS_ELEMENT_CONTROL_ADDR_OUTPUT_FMAP_DATA + 4, (u32)(Data >> 32));
}

u64 XProcess_element_Get_output_fmap(XProcess_element *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XProcess_element_ReadReg(InstancePtr->Control_BaseAddress, XPROCESS_ELEMENT_CONTROL_ADDR_OUTPUT_FMAP_DATA);
    Data += (u64)XProcess_element_ReadReg(InstancePtr->Control_BaseAddress, XPROCESS_ELEMENT_CONTROL_ADDR_OUTPUT_FMAP_DATA + 4) << 32;
    return Data;
}

void XProcess_element_InterruptGlobalEnable(XProcess_element *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XProcess_element_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XPROCESS_ELEMENT_CTRL_BUS_ADDR_GIE, 1);
}

void XProcess_element_InterruptGlobalDisable(XProcess_element *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XProcess_element_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XPROCESS_ELEMENT_CTRL_BUS_ADDR_GIE, 0);
}

void XProcess_element_InterruptEnable(XProcess_element *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XProcess_element_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XPROCESS_ELEMENT_CTRL_BUS_ADDR_IER);
    XProcess_element_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XPROCESS_ELEMENT_CTRL_BUS_ADDR_IER, Register | Mask);
}

void XProcess_element_InterruptDisable(XProcess_element *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XProcess_element_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XPROCESS_ELEMENT_CTRL_BUS_ADDR_IER);
    XProcess_element_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XPROCESS_ELEMENT_CTRL_BUS_ADDR_IER, Register & (~Mask));
}

void XProcess_element_InterruptClear(XProcess_element *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XProcess_element_WriteReg(InstancePtr->Ctrl_bus_BaseAddress, XPROCESS_ELEMENT_CTRL_BUS_ADDR_ISR, Mask);
}

u32 XProcess_element_InterruptGetEnabled(XProcess_element *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XProcess_element_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XPROCESS_ELEMENT_CTRL_BUS_ADDR_IER);
}

u32 XProcess_element_InterruptGetStatus(XProcess_element *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XProcess_element_ReadReg(InstancePtr->Ctrl_bus_BaseAddress, XPROCESS_ELEMENT_CTRL_BUS_ADDR_ISR);
}

