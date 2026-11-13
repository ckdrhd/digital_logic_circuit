-- Problem 5: positive-edge-triggered D flip-flop with asynchronous set and clear
library ieee;
use ieee.std_logic_1164.all;

entity dff_async is
  port (
    clk, d   : in  std_logic;
    set, clr : in  std_logic;
    q        : out std_logic;
    qn       : out std_logic
  );
end dff_async;

architecture bhv of dff_async is
  signal q_i : std_logic := '0';
begin
  process (clk, clr, set)
  begin
    if clr = '1' then                -- clear has the highest priority
      q_i <= '0';
    elsif set = '1' then
      q_i <= '1';
    elsif rising_edge(clk) then
      q_i <= d;
    end if;
  end process;

  q  <= q_i;
  qn <= not q_i;
end bhv;
