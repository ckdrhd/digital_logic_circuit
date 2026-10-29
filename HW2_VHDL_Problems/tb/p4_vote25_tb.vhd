-- Testbench for vote25: 0..25 votes, plus a scattered 12/13 vote pattern
library ieee;
use ieee.std_logic_1164.all;

entity vote25_tb is
end vote25_tb;

architecture sim of vote25_tb is
  signal vt     : std_logic_vector(25 downto 1);
  signal result : std_logic;
begin
  uut : entity work.vote25 port map (vt => vt, result => result);

  process
    variable exp : std_logic;
  begin
    for k in 0 to 25 loop
      vt <= (others => '0');
      for i in 1 to k loop
        vt(i) <= '1';
      end loop;
      wait for 10 ns;
      if k >= 13 then exp := '1'; else exp := '0'; end if;
      assert result = exp report "FAIL: votes=" & integer'image(k) severity error;
      report "votes=" & integer'image(k) & " -> result=" & std_logic'image(result);
    end loop;

    -- odd positions (13 votes) then drop one (12 votes)
    vt <= "1010101010101010101010101"; wait for 10 ns;
    assert result = '1' report "FAIL: scattered 13 votes" severity error;
    report "scattered 13 votes -> result=" & std_logic'image(result);
    vt <= "0010101010101010101010101"; wait for 10 ns;
    assert result = '0' report "FAIL: scattered 12 votes" severity error;
    report "scattered 12 votes -> result=" & std_logic'image(result);

    report "Simulation done";
    wait;
  end process;
end sim;
