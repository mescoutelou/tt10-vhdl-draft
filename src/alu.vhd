--
-- File: alu.vhd
-- Created Date: 2024-10-15 04:35:50 pm
-- Author: Mathieu Escouteloup
-- -----
-- Last Modified: 2025-04-11 09:52:31 am
-- Modified By: Mathieu Escouteloup
-- Email: mathieu.escouteloup@enseirb-matmeca.fr
-- -----
-- License: See LICENSE.md
-- Copyright (c) 2025 ENSEIRB-MATMECA
-- -----
-- Description: 
--


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use std.textio.all;

entity Alu is
	generic (
		G_N_BIT: integer
	);
	port (
		i_s1 : in std_logic_vector(G_N_BIT - 1 downto 0);
		i_s2 : in std_logic_vector(G_N_BIT - 1 downto 0);
		o_res : out std_logic_vector(G_N_BIT - 1 downto 0);
	);
end entity Alu;

architecture Alu_arch of Alu is
	begin
		-- Combinatorial Logic
		comb1 : process (i_s1, i_s2)
			begin
			o_res <= i_s1 + i_s2;
		end process comb1;  
end Alu_arch;