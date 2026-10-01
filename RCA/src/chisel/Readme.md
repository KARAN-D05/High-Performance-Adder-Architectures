# Chisel - 64-bit Ripple-Carry Adder
A parameterized Ripple-Carry Adder implemented in **Chisel** hardware-construction language and generated as SystemVerilog.

## Design

The design consists of:

* A 1-bit `FullAdder`
* A parameterized `RippleCarryAdder`
* A 64-bit `RCA64` top-level module

The `RippleCarryAdder` uses a Scala `for` loop during elaboration to construct the chain of full adders.

## Toolchain

* Chisel: 7.15.0
* Scala: 2.13.18
* Scala CLI: 1.17.1

## Generate SystemVerilog

From this directory:

```bash
scala-cli run rca.scala
```

This elaborates the Chisel design and generates the corresponding SystemVerilog RTL.

The generated `RCA64.sv` is intentionally not stored in this repository; it can be regenerated from `rca.scala`.

## Verification
The generated SystemVerilog RTL can be verified using the SystemVerilog testbench:

## Why Chisel?

This project demonstrates an alternative RTL construction flow where **Scala is used to construct parameterized hardware**, while the resulting SystemVerilog remains compatible with conventional RTL simulation and synthesis flows.
The same hardware architecture could be written directly in SystemVerilog; here, Chisel is used to demonstrate hardware construction and generation.
