// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XPROCESS_ELEMENT_H
#define XPROCESS_ELEMENT_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xprocess_element_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
    u32 Ctrl_bus_BaseAddress;
} XProcess_element_Config;
#endif

typedef struct {
    u32 Control_BaseAddress;
    u32 Ctrl_bus_BaseAddress;
    u32 IsReady;
} XProcess_element;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XProcess_element_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XProcess_element_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XProcess_element_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XProcess_element_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XProcess_element_Initialize(XProcess_element *InstancePtr, u16 DeviceId);
XProcess_element_Config* XProcess_element_LookupConfig(u16 DeviceId);
int XProcess_element_CfgInitialize(XProcess_element *InstancePtr, XProcess_element_Config *ConfigPtr);
#else
int XProcess_element_Initialize(XProcess_element *InstancePtr, const char* InstanceName);
int XProcess_element_Release(XProcess_element *InstancePtr);
#endif

void XProcess_element_Start(XProcess_element *InstancePtr);
u32 XProcess_element_IsDone(XProcess_element *InstancePtr);
u32 XProcess_element_IsIdle(XProcess_element *InstancePtr);
u32 XProcess_element_IsReady(XProcess_element *InstancePtr);
void XProcess_element_EnableAutoRestart(XProcess_element *InstancePtr);
void XProcess_element_DisableAutoRestart(XProcess_element *InstancePtr);
u32 XProcess_element_Get_return(XProcess_element *InstancePtr);

void XProcess_element_Set_input_fmap(XProcess_element *InstancePtr, u64 Data);
u64 XProcess_element_Get_input_fmap(XProcess_element *InstancePtr);
void XProcess_element_Set_output_fmap(XProcess_element *InstancePtr, u64 Data);
u64 XProcess_element_Get_output_fmap(XProcess_element *InstancePtr);

void XProcess_element_InterruptGlobalEnable(XProcess_element *InstancePtr);
void XProcess_element_InterruptGlobalDisable(XProcess_element *InstancePtr);
void XProcess_element_InterruptEnable(XProcess_element *InstancePtr, u32 Mask);
void XProcess_element_InterruptDisable(XProcess_element *InstancePtr, u32 Mask);
void XProcess_element_InterruptClear(XProcess_element *InstancePtr, u32 Mask);
u32 XProcess_element_InterruptGetEnabled(XProcess_element *InstancePtr);
u32 XProcess_element_InterruptGetStatus(XProcess_element *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
