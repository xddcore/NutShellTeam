# NutShellTeam
基于RISCV64果核处理器的卷积神经网络加速器研究

# 目录说明

1. alentek: 将果壳运行于正点原子领航者7020开发板
2. pynq: 将果壳运行于TUL PYNQ-Z2开发板
3. riscv-pk-build: riscv-pk(bbl+linux内核)
4. rootfsimg: 根文件系统
5. rtl: chisel -> verilog
6. vmlinux: linux内核编译raw文件


# 综合速度基准

## Windows Vivado 2019.1 + I9-12900K

1. Nutshell: 5min
2. Nutshell+OpenNNA: 30min

> PS:全程2-3个核心干活

## Linux Vivado 2019.1 + I9-12900K

还没测试，看网上测试的大概可以快一倍。(Vivado Linux多核调度比Windows要好)

