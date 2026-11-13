-- Problem 3: positive-edge-triggered D flip-flop
library ieee;
use ieee.std_logic_1164.all;

entity d_flipflop is
  port (
    clk, d : in  std_logic;
    q      : out std_logic;
    qn     : out std_logic
  );
end d_flipflop;

architecture bhv of d_flipflop is
  signal q_i : std_logic := '0';
begin
  process (clk)
  begin
    if rising_edge(clk) then
      q_i <= d;
    end if;
  end process;

  q  <= q_i;
  qn <= not q_i;
end bhv;
