-- Testbench for jk_flipflop: Hold, Set, Reset and Toggle
library ieee;
use ieee.std_logic_1164.all;

entity jk_flipflop_tb is
end jk_flipflop_tb;

architecture sim of jk_flipflop_tb is
  signal clk, j, k, q, qn : std_logic := '0';
begin
  uut : entity work.jk_flipflop port map (clk => clk, j => j, k => k, q => q, qn => qn);

  process
    -- apply j, k while clk = 0, then give one full clock pulse
    procedure pulse (jv, kv, eq : std_logic; name : string) is
    begin
      j <= jv; k <= kv; wait for 5 ns;
      clk <= '1'; wait for 5 ns;
      assert q = eq and qn = not eq report "FAIL: " & name severity error;
      report name & ": j=" & to_string(j) & " k=" & to_string(k)
           & " -> q=" & to_string(q) & " qn=" & to_string(qn);
      clk <= '0'; wait for 5 ns;
      assert q = eq report "FAIL: changed on falling edge: " & name severity error;
    end procedure;
  begin
    pulse('0', '1', '0', "Reset");
    pulse('0', '0', '0', "Hold");
    pulse('1', '0', '1', "Set");
    pulse('0', '0', '1', "Hold");
    pulse('1', '1', '0', "Toggle");
    pulse('1', '1', '1', "Toggle");
    pulse('1', '1', '0', "Toggle");
    pulse('1', '0', '1', "Set");
    pulse('0', '1', '0', "Reset");

    -- j pulse while clk = 0 must be ignored (edge-triggered, no 1s catching)
    j <= '1'; wait for 5 ns;
    j <= '0'; wait for 5 ns;
    clk <= '1'; wait for 5 ns;
    assert q = '0' report "FAIL: j pulse during clk=0 was caught" severity error;
    report "j pulse during clk=0 ignored: q=" & to_string(q);
    clk <= '0'; wait for 5 ns;

    report "Simulation done";
    wait;
  end process;
end sim;
