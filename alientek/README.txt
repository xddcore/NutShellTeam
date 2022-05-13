正点原子领航者开发板根据PYNQ-Z2工程自行移植:
芯片型号：zynq7z020clg400-1 -> zynq7z020clg400-2
输入时钟频率：50MHz -> 33.333333MHz
CPU Frequency: 666.666666
DDR Frequency: 533.333333
SDIO Frequency: 50Mhz ->125Mhz
DDR Width: 16Bit -> 32Bit

1. 使用Xilinx Vivado 2019.1打开
2. 手动替换scr中三个文件至工程目录
3. 综合，enjoy it！
4. 如遇报错，兵来将挡水来土掩

xddcore 2022/05/13 www.github.com/xddcore