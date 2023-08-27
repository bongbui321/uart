#! /bin/bash
rm -rf obj_dir
rm Waveform.vcd
verilator --cc uart.v receiver.v transmitter.v clk_generator.v
verilator -Wall --trace -cc uart.v --exe tb_uart.cpp
make -C obj_dir -f Vuart.mk Vuart