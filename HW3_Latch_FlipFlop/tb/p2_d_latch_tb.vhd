-- Testbench for d_latch: q follows d when en = '1', holds when en = '0'
library ieee;
use ieee.std_logic_1164.all;

entity d_latch_tb is
end d_latch_tb;

architecture sim of d_latch_tb is
  signal d, en, q, qn : std_logic := '0';
begin
  uut : entity work.d_latch port map (d => d, en => en, q => q, qn => qn);

  process
    procedure step (ev, dv, eq : std_logic; name : string) is
    begin
      en <= ev; d <= dv; wait for 10 ns;
      assert q = eq and qn = not eq report "FAIL: " & name severity error;
      report name & ": en=" & to_string(en) & " d=" & to_string(d)
           & " -> q=" & to_string(q) & " qn=" & to_string(qn);
    end procedure;
  begin
    step('1', '0', '0', "Transparent");
    step('1', '1', '1', "Transparent");
    step('1', '0', '0', "Transparent");
    step('1', '1', '1', "Transparent");
    step('0', '1', '1', "Latched q=1");
    step('0', '0', '1', "Hold, d changes");
    step('0', '1', '1', "Hold, d changes");
    step('1', '0', '0', "Transparent");
    step('0', '0', '0', "Latched q=0");
    step('0', '1', '0', "Hold, d changes");
    step('0', '0', '0', "Hold, d changes");
    report "Simulation done";
    wait;
  end process;
end sim;
