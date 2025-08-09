class transaction;
  rand bit d_in;
  rand bit rs;
  bit q_out,qb_tog;
  function preview(string preview_1);
    $display($time,"%s,\n rs=%b,d_in=%b,q_out=%b,qb_tog=%b",preview_1,rs,d_in,q_out,qb_tog);
  endfunction
endclass
