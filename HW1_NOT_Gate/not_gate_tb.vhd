-- Testbench for not_gate
library ieee;
use ieee.std_logic_1164.all;

entity not_gate_tb is
end not_gate_tb;

architecture sim of not_gate_tb is
  signal a, y : std_logic;
begin
  uut : entity work.not_gate port map (a => a, y => y);

  process
  begin
    a <= '0'; wait for 10 ns;
    assert y = '1' report "FAIL: a=0 -> y should be 1" severity error;
    report "a=0 -> y=" & std_logic'image(y);

    a <= '1'; wait for 10 ns;
    assert y = '0' report "FAIL: a=1 -> y should be 0" severity error;
    report "a=1 -> y=" & std_logic'image(y);

    report "Simulation done";
    wait;
  end process;
end sim;
