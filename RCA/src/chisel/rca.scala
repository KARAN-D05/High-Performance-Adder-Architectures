//> using scala 2.13.18
//> using dep org.chipsalliance::chisel:7.15.0
//> using plugin org.chipsalliance:::chisel-plugin:7.15.0

import chisel3._

class FullAdder extends Module {
  val io = IO(new Bundle {
    val a    = Input(Bool())
    val b    = Input(Bool())
    val cin  = Input(Bool())

    val sum  = Output(Bool())
    val cout = Output(Bool())
  })

  io.sum  := io.a ^ io.b ^ io.cin
  io.cout := (io.a & io.b) | (io.a & io.cin) | (io.b & io.cin)
}

class RippleCarryAdder(val n: Int) extends Module {
  val io = IO(new Bundle {
    val a    = Input(UInt(n.W))
    val b    = Input(UInt(n.W))
    val cin  = Input(Bool())

    val sum  = Output(UInt(n.W))
    val cout = Output(Bool())
  })

  val carry = Wire(Vec(n + 1, Bool()))
  val sum   = Wire(Vec(n, Bool()))

  carry(0) := io.cin

  for (i <- 0 until n) {
    val fa = Module(new FullAdder)

    fa.io.a   := io.a(i)
    fa.io.b   := io.b(i)
    fa.io.cin := carry(i)

    sum(i)        := fa.io.sum
    carry(i + 1) := fa.io.cout
  }

  io.sum  := sum.asUInt
  io.cout := carry(n)
}

class RCA64 extends Module {
  val io = IO(new Bundle {
    val a    = Input(UInt(64.W))
    val b    = Input(UInt(64.W))
    val cin  = Input(Bool())

    val sum  = Output(UInt(64.W))
    val cout = Output(Bool())
  })

  val rca = Module(new RippleCarryAdder(64))

  rca.io.a   := io.a
  rca.io.b   := io.b
  rca.io.cin := io.cin

  io.sum  := rca.io.sum
  io.cout := rca.io.cout
}

// Generate SystemVerilog
object RCA64 extends App {
  emitVerilog(new RCA64)
}
