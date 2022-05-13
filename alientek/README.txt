正点原子领航者开发板根据PYNQ-Z2工程自行移植:
芯片型号：zynq7z020clg400-1 -> zynq7z020clg400-2
输入时钟频率：50MHz -> 33.33333
DDR3内存宽度: 16 Bit -> 32Bit
SDIO Frequency: 50Mhz -> 125Mhz (不知道PYNQ-Z2这板子设计的有啥问题，125MHz的最大约束，它只能跑50MHz，高了sd就gg了)

1. 使用Xilinx Vivado 2019.1打开
2. 手动替换scr中三个文件至工程目录
3. 综合，enjoy it！
4. 如遇报错，兵来将挡水来土掩

xddcore 2022/05/13 www.github.com/xddcore