-- Testbench for logic_test: all 16 input combinations
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity logic_test_tb is
end logic_test_tb;

architecture sim of logic_test_tb is
  signal v          : std_logic_vector(3 downto 0);
  signal out1, out2 : std_logic;
begin
  uut : entity work.logic_test
    port map (a => v(3), b => v(2), c => v(1), d => v(0), out1 => out1, out2 => out2);

  process
    variable exp1, exp2 : std_logic;
  begin
    for i in 0 to 15 loop
      v <= std_logic_vector(to_unsigned(i, 4)); wait for 10 ns;
      if i = 15 then exp1 := '1'; else exp1 := '0'; end if;
      if i = 0  then exp2 := '0'; else exp2 := '1'; end if;
      assert out1 = exp1 and out2 = exp2
        report "FAIL: abcd=" & to_string(v) severity error;
      report "abcd=" & to_string(v) & " -> out1=" & std_logic'image(out1) & " out2=" & std_logic'image(out2);
    end loop;
    report "Simulation done";
    wait;
  end process;
end sim;
