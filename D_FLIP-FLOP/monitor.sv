class monitor;
  transaction trans;
  virtual int_f int_f_m_h;
  mailbox m_mail;

  function new(virtual int_f int_f_m_h, mailbox m_mail);
    this.int_f_m_h = int_f_m_h;
    this.m_mail    = m_mail;
  endfunction
  task main();
    forever begin
      @(posedge int_f_m_h.clk); 
      trans = new(); 
      trans.d_in    = int_f_m_h.d_in;
      trans.rs      = int_f_m_h.rs;
      trans.q_out   = int_f_m_h.q_out;
      trans.qb_tog  = int_f_m_h.qb_tog;
      trans.preview("fr_mon");
      m_mail.put(trans);
    end
  endtask
endclass
