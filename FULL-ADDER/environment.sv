`include "transcation.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;

generator gen;
driver dr_v;
monitor mon;
scoreboard scr_b;
  mailbox m_mail;
  mailbox gen_mail;
  
  virtual in_fa  i_f;
  function new(virtual in_fa i_f);
    this.i_f=i_f;
    
    gen_mail=new();
    m_mail=new();
    
    gen=new(gen_mail);
    dr_v=new(i_f,gen_mail);
    mon=new(i_f,m_mail);
    scr_b=new(m_mail);
  endfunction
  task t_run;
    fork
      gen.main;
      dr_v.main;
      mon.main;
      scr_b.main;
    join
  endtask
endclass
