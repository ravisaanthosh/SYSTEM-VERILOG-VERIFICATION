class driver;
  transaction trans_h;
  mailbox gen_mail;
  virtual int_f int_f_h;
  function new(virtual int_f int_f_h, mailbox gen_mail);
    this.gen_mail  = gen_mail;
    this.int_f_h   = int_f_h;
  endfunction
  task main();
    forever begin
      gen_mail.get(trans_h);
      int_f_h.d_in = trans_h.d_in;
      int_f_h.rs   = trans_h.rs;
      trans_h.preview("fr_div");
    end
  endtask
endclass
