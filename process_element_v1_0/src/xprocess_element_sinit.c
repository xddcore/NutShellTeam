// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xprocess_element.h"

extern XProcess_element_Config XProcess_element_ConfigTable[];

XProcess_element_Config *XProcess_element_LookupConfig(u16 DeviceId) {
	XProcess_element_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XPROCESS_ELEMENT_NUM_INSTANCES; Index++) {
		if (XProcess_element_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XProcess_element_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XProcess_element_Initialize(XProcess_element *InstancePtr, u16 DeviceId) {
	XProcess_element_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XProcess_element_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XProcess_element_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

