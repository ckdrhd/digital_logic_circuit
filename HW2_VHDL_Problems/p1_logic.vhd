-- Problem 1: 4-input AND / OR
library ieee;
use ieee.std_logic_1164.all;

entity logic_test is
  port (
    a, b, c, d : in  std_logic;
    out1       : out std_logic;
    out2       : out std_logic
  );
end logic_test;

architecture bhv of logic_test is
begin
  out1 <= a and b and c and d;
  out2 <= a or b or c or d;
end bhv;
