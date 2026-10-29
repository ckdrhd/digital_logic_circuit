-- Problem 4: 25-person voting machine
-- result = '1' when 13 or more of the 25 inputs are '1'
library ieee;
use ieee.std_logic_1164.all;

entity vote25 is
  port (
    vt     : in  std_logic_vector(25 downto 1);
    result : out std_logic
  );
end vote25;

architecture bhv of vote25 is
begin
  process (vt)
    variable sum : integer range 0 to 25;
  begin
    sum := 0;
    for i in 1 to 25 loop
      if vt(i) = '1' then
        sum := sum + 1;
      end if;
    end loop;

    if sum >= 13 then
      result <= '1';
    else
      result <= '0';
    end if;
  end process;
end bhv;
