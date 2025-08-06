`include "interface.sv"
`include "test.sv"
module testbench;
  in_fa i_f();
  test tst(i_f);
  fa (.a(i_f.a),.b(i_f.b),.cin(i_f.cin),.sum(i_f.sum),.carry(i_f.carry));
endmodule
