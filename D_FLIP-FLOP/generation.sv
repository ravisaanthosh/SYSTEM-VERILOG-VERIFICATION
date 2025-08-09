class generation;
  transaction tran_h;
  mailbox gen_mail;
  event ev_gen;
  function new(mailbox gen_mail, event ev_gen);
    this.gen_mail = gen_mail;
    this.ev_gen   = ev_gen;
  endfunction
  task main();
    tran_h = new();
    forever begin
      tran_h.randomize();
      gen_mail.put(tran_h);
      tran_h.preview("fr_gen");
      @ev_gen;
    end
  endtask
endclass
