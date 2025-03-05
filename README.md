Hardware Implementation of SHA3(SHAKE256) Pipelined Using VerilogHDL

This implementation merged two rounds in one with reduced round constant.
Although this reduce the usage of sequential cells, timing get worse in opposite 
due to longger combinational logic level.

This implementation is proposed for specific purpose, so I constraint the input strings' 
length must be less than 1083-bit.
