`include "test.sv"
`include "interface.sv"
module tb;
  int_f int_tb();
  test tst(int_tb);
  d_f_f uut(.clk(int_tb.clk),.d_in(int_tb.d_in),.rs(int_tb.rs),.qb_tog(int_tb.qb_tog),.q_out(int_tb.q_out));
  initial begin
    int_tb.clk=0;
    int_tb.d_in=1;
  end
  always #2 int_tb.clk=~int_tb.clk;
  initial begin
    #400 $finish;
  end
  initial begin
    $dumpfile("d_f_f.vcd");
    $dumpvars();
  end
endmodule
