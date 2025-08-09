`include "environment.sv"
program test(int_f int_f_h);
  environment env;
  initial begin
    env=new(int_f_h);
    env.main();
  end
endprogram
