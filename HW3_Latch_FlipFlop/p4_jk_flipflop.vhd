-- Problem 4: positive-edge-triggered JK flip-flop
library ieee;
use ieee.std_logic_1164.all;

entity jk_flipflop is
  port (
    clk, j, k : in  std_logic;
    q         : out std_logic;
    qn        : out std_logic
  );
end jk_flipflop;

architecture bhv of jk_flipflop is
  signal q_i : std_logic := '0';
begin
  process (clk)
  begin
    if rising_edge(clk) then
      if j = '1' and k = '0' then
        q_i <= '1';        -- Set
      elsif j = '0' and k = '1' then
        q_i <= '0';        -- Reset
      elsif j = '1' and k = '1' then
        q_i <= not q_i;    -- Toggle
      end if;              -- j = k = '0': Hold
    end if;
  end process;

  q  <= q_i;
  qn <= not q_i;
end bhv;
