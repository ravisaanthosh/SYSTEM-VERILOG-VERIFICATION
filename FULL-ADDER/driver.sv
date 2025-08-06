class driver;
  mailbox gen_mail;
  virtual in_fa i_f;
  transaction tr_h;  

  function new(virtual in_fa i_f, mailbox gen_mail);
    this.i_f = i_f;
    this.gen_mail = gen_mail;
  endfunction

  task main;
    repeat(2) begin
      #1;
      tr_h = new();         
      gen_mail.get(tr_h);
      i_f.a   = tr_h.a;
      i_f.b   = tr_h.b;
      i_f.cin = tr_h.cin;
      tr_h.display("fr_driv");
     #2;
    end
  endtask
endclass
