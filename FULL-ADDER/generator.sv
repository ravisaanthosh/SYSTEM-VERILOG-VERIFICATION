class generator;
  transaction tr_h;
  mailbox gen_mail;
  function new(mailbox gen_mail);
    this.gen_mail=gen_mail;
  endfunction
  task main();
    repeat(2)begin
      tr_h=new();
      tr_h.randomize();
      tr_h.display("fr_gen");
      gen_mail.put(tr_h);
      #3;
    end
  endtask
endclass
      
