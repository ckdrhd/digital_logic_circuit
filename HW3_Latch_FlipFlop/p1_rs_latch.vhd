-- Problem 1: RS latch (cross-coupled NOR gates)
library ieee;
use ieee.std_logic_1164.all;

entity rs_latch is
  port (
    r, s : in  std_logic;
    q    : out std_logic;
    qn   : out std_logic
  );
end rs_latch;

architecture bhv of rs_latch is
  signal q_i  : std_logic := '0';
  signal qn_i : std_logic := '1';
begin
  q_i  <= r nor qn_i;
  qn_i <= s nor q_i;

  q  <= q_i;
  qn <= qn_i;
end bhv;
