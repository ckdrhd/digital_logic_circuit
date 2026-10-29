-- Testbench for count_ones: 0..13 ones, then en = '0'
library ieee;
use ieee.std_logic_1164.all;

entity count_ones_tb is
end count_ones_tb;

architecture sim of count_ones_tb is
  signal en      : std_logic;
  signal vt      : std_logic_vector(13 downto 1);
  signal display : std_logic_vector(7 downto 0);
  type pat_t is array (0 to 13) of std_logic_vector(7 downto 0);
  constant expected : pat_t := (
    "11111100", "01100000", "11011010", "11110010", "01100110", "10110110", "10111110",
    "11100000", "11111110", "11100110", "11101110", "00111110", "10011100", "01111010");
  constant names : string(1 to 14) := "0123456789AbCd";
begin
  uut : entity work.count_ones port map (en => en, vt => vt, display => display);

  process
  begin
    en <= '1';
    for k in 0 to 13 loop
      vt <= (others => '0');
      for i in 13 downto 14 - k loop  -- fill from the top so the bits are not just the low ones
        vt(i) <= '1';
      end loop;
      wait for 10 ns;
      assert display = expected(k) report "FAIL: ones=" & integer'image(k) severity error;
      report "ones=" & integer'image(k) & " -> " & to_string(display) & " (" & names(k + 1) & ")";
    end loop;
    en <= '0'; wait for 10 ns;
    assert display = "00000000" report "FAIL: en=0 should turn display off" severity error;
    report "en=0 -> " & to_string(display);
    report "Simulation done";
    wait;
  end process;
end sim;
