`timescale 1ns/1ns
`include "RCA64.sv"

module testbench;

   logic [63:0] io_a;
   logic [63:0] io_b;
   logic io_cin;
   logic [63:0] io_sum;
   logic io_cout;

   RCA64 dut (
    .io_a(io_a),
    .io_b(io_b),
    .io_cin(io_cin),
    .io_sum(io_sum),
    .io_cout(io_cout)
   );

   initial begin

   $monitor("time = %0t | a = %h | b = %h | c_in = %h | sum = %h | c_out = %h ", $time, io_a, io_b, io_cin, io_sum, io_cout);

   $dumpfile("Sim.vcd");
   $dumpvars(0, testbench);

   io_a = 64'b0;
   io_b = 64'b0;
   io_cin = 1'b1;
   #5;

   io_a = 64'hF0F0_F0F0_F0F0_F0F0;
   io_b = 64'h0F0F_0F0F_0F0F_0F0F;
   io_cin = 1'b0;
   #5;

   io_a = 64'hFFFF_FFFF_FFFF_FFFF;
   io_b = 64'h0000_0000_0000_0001;
   io_cin = 1'b0;
   #5;

   io_a = 64'h0000_0000_0000_00B8;
   io_b = 64'h0000_0000_0000_0017;
   io_cin = 1'b1;
   #5;

   io_a = 64'hFFFF_FFFF_FFFF_FFFF;
   io_b = 64'hFFFF_FFFF_FFFF_FFFF;
   io_cin = 1'b1;
   #5;

   $display("Simulation Complete!");
   $finish;

   end
endmodule