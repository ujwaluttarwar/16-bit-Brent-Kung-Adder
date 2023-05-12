


LIBRARY std;
use std.standard.all;
use std.textio.all; 

library ieee;
use ieee.std_logic_1164.all;

entity BrentKung_test is
end entity BrentKung_test;

architecture test of BrentKung_test is
    
	 component bk_adder is
        port (
            A, B : in STD_LOGIC_VECTOR(15 downto 0);
            C0   : in std_logic;
            Sum  : out STD_LOGIC_VECTOR(15 downto 0);
            Carry : out std_logic);
    end component bk_adder;
	 
  for DUT: bk_adder use entity work.BrentKung(structural);
    
    signal A, B, Sum : std_logic_vector(15 downto 0);
    signal C0, carry : std_logic;
    signal Acc_sum : std_logic_vector(15 downto 0);
    signal Acc_carr : std_logic;
	 
    
    file file_VECTORS : text;
  
    begin
	
	DUT: bk_adder port map (A => a, B => b, C0 => C0, Sum => Sum, Carry => Carry);
    
      process
        variable inp_line     : line;
       ---- variable out_line     : line;
        variable in_carry     : bit;
        variable out_carry    : bit;
        variable input_A      : BIT_VECTOR(15 downto 0);
        variable input_B      : BIT_VECTOR(15 downto 0);
        variable Acct_Sum     : BIT_VECTOR(15 downto 0);
       -- variable v1           : std_logic_vector(15 downto 0);
        variable Space        : character;
     
    begin
 
    file_open(file_VECTORS, "H:\IIT BOMBAY\Sem 3\VLSI Design\Assignments\Assignment 4\input_data.txt", read_mode);
  
 
    while not endfile(file_VECTORS) loop
      readline(file_VECTORS, inp_line);
      read(inp_line, input_A);
      read(inp_line, Space);           
      read(inp_line, input_B);
      read(inp_line, Space);
      read(inp_line, in_carry);
      read(inp_line, Space);
      read(inp_line, Acct_Sum);
      read(inp_line, Space);
      read(inp_line, out_carry);
    
      
      A <= to_stdlogicvector(input_A);
      B <= to_stdlogicvector(input_B);
      C0 <= to_stdulogic(in_carry);
      Acc_sum <= to_stdlogicvector(Acct_Sum);
      Acc_carr <= to_stdulogic(out_carry);
		

    wait for 90 ns;
        assert (Acc_sum = Sum and Acc_carr = carry )   
            report "case fails" severity error;
        end loop;
        
        file_close(file_VECTORS);
        wait;
        end process;
end test;