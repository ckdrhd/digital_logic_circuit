-- Testbench for led_letter
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_letter_tb is
end led_letter_tb;

architecture sim of led_letter_tb is
  signal en      : std_logic;
  signal dat     : std_logic_vector(2 downto 0);
  signal display : std_logic_vector(7 downto 0);
  type pat_t is array (0 to 7) of std_logic_vector(7 downto 0);
  constant expected : pat_t := ("11101110", "00111110", "10011100", "01111010",
                                "10001110", "11110110", "00000000", "00000000");
  type name_t is array (0 to 7) of string(1 to 1);
  constant names : name_t := ("A", "b", "C", "d", "F", "g", "-", "-");
begin
  uut : entity work.led_letter port map (en => en, dat => dat, display => display);

  process
  begin
    en <= '1';
    for i in 0 to 7 loop
      dat <= std_logic_vector(to_unsigned(i, 3)); wait for 10 ns;
      assert display = expected(i) report "FAIL: dat=" & to_string(dat) severity error;
      report "en=1 dat=" & to_string(dat) & " -> " & to_string(display) & " (" & names(i) & ")";
    end loop;
    en <= '0'; wait for 10 ns;
    assert display = "ZZZZZZZZ" report "FAIL: en=0 should be Hi-Z" severity error;
    report "en=0 -> " & to_string(display);
    report "Simulation done";
    wait;
  end process;
end sim;
