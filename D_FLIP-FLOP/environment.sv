`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class environment;
  virtual int_f int_f_h_env;
  mailbox gen_mail;
  mailbox m_mail;
  event ev_gen;
  generation gen;
  driver dv;
  monitor mon;
  scoreboard scrb;
  function new(virtual int_f int_f_h_env);
    this.int_f_h_env=int_f_h_env;
    gen_mail=new();
    m_mail=new();
    gen=new(gen_mail,ev_gen);
    dv=new(int_f_h_env,gen_mail);
    mon=new(int_f_h_env,m_mail);
    scrb=new(m_mail,ev_gen);
  endfunction
  
  task main();
    fork
      gen.main();
      dv.main();
      mon.main();
      scrb.main();
    join
  endtask
endclass
