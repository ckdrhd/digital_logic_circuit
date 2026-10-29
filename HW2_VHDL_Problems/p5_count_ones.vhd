-- Problem 5: count the '1's in a 13-bit vector and show it on a 7-segment display
-- 0-9 -> digits, 10-15 -> A b C d E F, en = '0' -> display off
-- display(7 downto 0) = a b c d e f g dp
library ieee;
use ieee.std_logic_1164.all;

entity count_ones is
  port (
    en      : in  std_logic;
    vt      : in  std_logic_vector(13 downto 1);
    display : out std_logic_vector(7 downto 0)
  );
end count_ones;

architecture bhv of count_ones is
begin
  process (en, vt)
    variable sum : integer range 0 to 15;
  begin
    sum := 0;
    for i in 1 to 13 loop
      if vt(i) = '1' then
        sum := sum + 1;
      end if;
    end loop;

    if en = '0' then
      display <= "00000000";
    else
      case sum is
        when 0      => display <= "11111100";
        when 1      => display <= "01100000";
        when 2      => display <= "11011010";
        when 3      => display <= "11110010";
        when 4      => display <= "01100110";
        when 5      => display <= "10110110";
        when 6      => display <= "10111110";
        when 7      => display <= "11100000";
        when 8      => display <= "11111110";
        when 9      => display <= "11100110";
        when 10     => display <= "11101110";  -- A
        when 11     => display <= "00111110";  -- b
        when 12     => display <= "10011100";  -- C
        when 13     => display <= "01111010";  -- d
        when 14     => display <= "10011110";  -- E
        when others => display <= "10001110";  -- F
      end case;
    end if;
  end process;
end bhv;
