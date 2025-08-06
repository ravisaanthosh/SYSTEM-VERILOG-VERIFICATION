class monitor;
  virtual in_fa i_f;
  mailbox m_mail;
  transaction tr_h;
  function new(virtual in_fa i_f,mailbox m_mail);
    this.i_f=i_f;
    this.m_mail=m_mail;
  endfunction
  task main;
    repeat (2)begin
      #2;
      tr_h=new();
      tr_h.a=i_f.a;
      tr_h.b=i_f.b;
      tr_h.cin=i_f.cin;
      tr_h.sum=i_f.sum;
      tr_h.carry=i_f.carry;
      m_mail.put(tr_h);
      tr_h.display("fr_mon");
      #1;
    end
  endtask
endclass
      
