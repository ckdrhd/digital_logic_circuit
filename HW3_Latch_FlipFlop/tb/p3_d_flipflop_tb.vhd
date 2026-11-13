-- Testbench for d_flipflop: q changes only on the rising edge of clk
library ieee;
use ieee.std_logic_1164.all;

entity d_flipflop_tb is
end d_flipflop_tb;

architecture sim of d_flipflop_tb is
  signal clk, d, q, qn : std_logic := '0';
begin
  uut : entity work.d_flipflop port map (clk => clk, d => d, q => q, qn => qn);

  process
    procedure step (cv, dv, eq : std_logic; name : string) is
    begin
      clk <= cv; d <= dv; wait for 10 ns;
      assert q = eq and qn = not eq report "FAIL: " & name severity error;
      report name & ": clk=" & to_string(clk) & " d=" & to_string(d)
           & " -> q=" & to_string(q) & " qn=" & to_string(qn);
    end procedure;
  begin
    step('0', '1', '0', "clk=0, d changes");
    step('1', '1', '1', "Rising edge captures 1");
    step('1', '0', '1', "clk=1, d changes");
    step('0', '0', '1', "Falling edge");
    step('0', '1', '1', "clk=0, d changes");
    step('0', '0', '1', "clk=0, d changes");
    step('1', '0', '0', "Rising edge captures 0");
    step('1', '1', '0', "clk=1, d changes");
    step('0', '1', '0', "Falling edge");
    step('1', '1', '1', "Rising edge captures 1");
    report "Simulation done";
    wait;
  end process;
end sim;
