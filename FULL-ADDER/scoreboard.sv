class scoreboard;
  mailbox m_mail;
  function new(mailbox m_mail);
    this.m_mail=m_mail;
  endfunction
  task main;
    transaction tr_h;
    repeat(2)begin
      m_mail.get(tr_h);
      tr_h.display("fr_scr_b");
      if ((tr_h.a^tr_h.b^tr_h.cin)==tr_h.sum && ((tr_h.a & tr_h.b )|(tr_h.b & tr_h.cin)|(tr_h.cin & tr_h.a)) == tr_h.carry)
      $display("Result:pass");
      else
        $display("Result:fail");
    end
  endtask
endclass
