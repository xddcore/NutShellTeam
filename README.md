# NutShellTeam
基于RISCV64果核处理器的卷积神经网络加速器研究

# 快速验证
1. PYNQ-Z2: https://github.com/xddcore/NutShellTeam/releases/tag/PYNQ-Z2
2. 正点原子领航者7020: https://github.com/xddcore/NutShellTeam/releases/tag/ALIENTEK-NAVIGATOR-7020

# Demo 视频

1. 启动Linux内核:https://www.bilibili.com/video/BV1pr4y147m5?spm_id_from=333.337.search-card.all.click
2. 启动Debian: https://www.bilibili.com/video/BV1Ya41177EJ?spm_id_from=333.999.0.0

# 目录说明

1. alentek: 将果壳运行于正点原子领航者7020开发板
2. img: 重要的图片信息
3. nutshell_opennna: 果核+神经网络加速器外设
4. opennna_ipcore: OpenNNA的IP Core
5. process_element_v1_0: nna相关驱动代码
6. pynq: 将果壳运行于TUL PYNQ-Z2开发板
7. riscv-pk-build: riscv-pk(bbl+linux内核)
8. rootfsimg: 根文件系统
9. rtl: chisel -> verilog
10. vmlinux: linux内核编译raw文件


# 综合速度基准

## Windows Vivado 2019.1 + I9-12900K

1. Nutshell: 5min
2. Nutshell+OpenNNA: 30min

> PS:全程2-3个核心干活

## Linux Vivado 2019.1 + I9-12900K

还没测试，看网上测试的大概可以快一倍。(Vivado Linux多核调度比Windows要好)

