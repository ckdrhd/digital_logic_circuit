-- Testbench for mux8_1: every select value, with one data input high at a time
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux8_1_tb is
end mux8_1_tb;

architecture sim of mux8_1_tb is
  signal x    : std_logic_vector(7 downto 0);  -- x(0)=a ... x(7)=h
  signal ch   : std_logic_vector(2 downto 0);
  signal data : std_logic;
begin
  uut : entity work.mux8_1
    port map (a => x(0), b => x(1), c => x(2), d => x(3),
              e => x(4), f => x(5), g => x(6), h => x(7), ch => ch, data => data);

  process
  begin
    for s in 0 to 7 loop
      ch <= std_logic_vector(to_unsigned(s, 3));
      for k in 0 to 7 loop
        x <= (others => '0'); x(k) <= '1'; wait for 10 ns;
        if k = s then
          assert data = '1' report "FAIL: ch=" & to_string(ch) & " k=" & integer'image(k) severity error;
        else
          assert data = '0' report "FAIL: ch=" & to_string(ch) & " k=" & integer'image(k) severity error;
        end if;
      end loop;
      report "ch=" & to_string(ch) & " selects input " & integer'image(s) & " OK";
    end loop;
    report "Simulation done";
    wait;
  end process;
end sim;
