-- Testbench for dff_async: asynchronous clear/set, clear priority, normal D operation
library ieee;
use ieee.std_logic_1164.all;

entity dff_async_tb is
end dff_async_tb;

architecture sim of dff_async_tb is
  signal clk, d, set, clr, q, qn : std_logic := '0';
begin
  uut : entity work.dff_async
    port map (clk => clk, d => d, set => set, clr => clr, q => q, qn => qn);

  process
    procedure step (cv, dv, sv, rv, eq : std_logic; name : string) is
    begin
      clk <= cv; d <= dv; set <= sv; clr <= rv; wait for 10 ns;
      assert q = eq and qn = not eq report "FAIL: " & name severity error;
      report name & ": clk=" & to_string(clk) & " d=" & to_string(d)
           & " set=" & to_string(set) & " clr=" & to_string(clr)
           & " -> q=" & to_string(q) & " qn=" & to_string(qn);
    end procedure;
  begin
    -- clk, d, set, clr, expected q
    step('0', '0', '0', '1', '0', "Clear (no clock edge)");
    step('0', '0', '0', '0', '0', "Hold");
    step('0', '0', '1', '0', '1', "Set (no clock edge)");
    step('0', '0', '0', '0', '1', "Hold after set");
    step('0', '0', '0', '1', '0', "Clear (no clock edge)");
    step('0', '1', '1', '1', '0', "Set and clear: clear wins");
    step('1', '1', '1', '1', '0', "Set and clear, rising edge d=1");
    step('1', '1', '1', '0', '1', "Clear released, set remains");
    step('0', '0', '0', '0', '1', "Normal, falling edge");
    step('1', '0', '0', '0', '0', "Normal, rising edge captures 0");
    step('0', '1', '0', '0', '0', "Normal, falling edge");
    step('1', '1', '0', '0', '1', "Normal, rising edge captures 1");
    step('1', '0', '0', '0', '1', "Normal, clk=1 d changes");
    step('1', '0', '0', '1', '0', "Clear while clk=1");
    step('1', '1', '1', '0', '1', "Set while clk=1");
    step('0', '0', '1', '0', '1', "Set held, clk falls");
    step('1', '0', '1', '0', '1', "Set overrides rising edge d=0");
    step('0', '1', '0', '1', '0', "Clear held, clk falls");
    step('1', '1', '0', '1', '0', "Clear overrides rising edge d=1");
    report "Simulation done";
    wait;
  end process;
end sim;
