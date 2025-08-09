class scoreboard;
  transaction trans;
  mailbox m_mail;
  event ev_gen;
  function new(mailbox m_mail, event ev_gen);
    this.m_mail = m_mail;
    this.ev_gen = ev_gen;
  endfunction
  task main();
    trans = new();
    forever begin
      m_mail.get(trans);
      trans.preview("fr_scrb");

      if (((trans.d_in == trans.q_out) && (trans.rs == 0)) || 
          ((trans.q_out == 0) && (trans.rs == 1))) begin
        $display(" done");
      end else begin
        $display(" not_done");
      end

      ->ev_gen;
    end
  endtask
endclass
