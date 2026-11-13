-- Testbench for rs_latch: Reset, Set, Hold and the forbidden input
library ieee;
use ieee.std_logic_1164.all;

entity rs_latch_tb is
end rs_latch_tb;

architecture sim of rs_latch_tb is
  signal r, s, q, qn : std_logic := '0';
begin
  uut : entity work.rs_latch port map (r => r, s => s, q => q, qn => qn);

  process
    procedure step (rv, sv, eq, eqn : std_logic; name : string) is
    begin
      r <= rv; s <= sv; wait for 10 ns;
      assert q = eq and qn = eqn report "FAIL: " & name severity error;
      report name & ": r=" & to_string(r) & " s=" & to_string(s)
           & " -> q=" & to_string(q) & " qn=" & to_string(qn);
    end procedure;
  begin
    step('1', '0', '0', '1', "Reset");
    step('0', '0', '0', '1', "Hold after Reset");
    step('0', '1', '1', '0', "Set");
    step('0', '0', '1', '0', "Hold after Set");
    step('1', '1', '0', '0', "Forbidden");
    step('1', '0', '0', '1', "Forbidden, s released first");
    step('0', '0', '0', '1', "Hold");
    step('1', '1', '0', '0', "Forbidden");
    step('0', '1', '1', '0', "Forbidden, r released first");
    step('0', '0', '1', '0', "Hold");
    report "Simulation done";
    wait;
  end process;
end sim;
