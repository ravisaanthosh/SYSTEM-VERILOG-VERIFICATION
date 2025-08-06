`include "environment.sv"
program test(in_fa i_f);
  environment env;
  initial begin
    env = new(i_f);
    env.t_run();
  end
endprogram
